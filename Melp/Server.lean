-- This is the main entry point for the Melp Server. It is responsible for creating a socket, 
-- binding it to a port, and listening for incoming connections. When a connection is received, 
-- it will parse the request and pass it to the user-defined on_connection function.

import Socket
import Lina

import Melp.Request

open Socket

namespace Melp

-- A [Server] structure that holds a socket and user-defined callbacks.
structure Server where
  socket        : Socket
  on_connection : Request Request.Status.Open → IO (Request Request.Status.Closed) 
  on_bind       : SockAddr → IO Unit

-- Creates a new empty [Server] structure.
def Server.new : IO Server := do
  let socket ← Socket.mk AddressFamily.inet SockType.stream
  pure { socket, on_connection := λ conn => conn.notFound, on_bind := λ _ => pure () }

-- Sets the user-defined on_connection callback.
def Server.onConnection (server: Server) (fn: Request Request.Status.Open → IO (Request Request.Status.Closed)) : Server :=
  { server with on_connection := fn }

-- Sets the user-defined on_bind callback.
def Server.onBind (server: Server) (fn: SockAddr → IO Unit) : Server :=
  { server with on_bind := fn }

-- Starts the server by binding the socket to the given address and port, and listening for 
-- incoming connections. When a connection is received, it will parse the request and pass it
-- to the user-defined on_connection function.
def Server.start (server: Server) (address: String) (port: String) : IO Unit := do
  let localAddr ← SockAddr.mk address port AddressFamily.inet SockType.stream

  let socket := server.socket
  socket.bind localAddr

  socket.listen 10

  let _ ← server.on_bind localAddr

  repeat do
    let (remoteAddr, socket') ← socket.accept

    let _ ← IO.asTask do
      let recv ← socket'.recv 4096
      let str := String.fromUTF8Unchecked recv
      let parsed ← Lina.Request.parse str

      match parsed with
      | Except.ok data =>
        let req := { socket := socket', addr := remoteAddr, data }
        let _ ← server.on_connection req
        pure ()
      | Except.error _ =>
        socket'.close

end Melp