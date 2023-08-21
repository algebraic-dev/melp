-- Module for handling HTTP Requests. [Request] is the main structure of this module and it 
-- includes a `t` parameter that is used to track the status of the request. The status can be 
-- either `Open` or `Closed`. The `Open` status means that the request is still open and the 
-- `Closed` status means that the request has been closed with a response.

import Lina
import Socket

import Melp.Response

open Socket

namespace Melp

-- The `Status` parameter of the `Request` structure is used to track the status of the request.
inductive Request.Status
  | Open
  | Closed

-- The `Request` structure is used to represent a HTTP request. The `t` parameter is used to track
-- the status of the request.
structure Request (t: Request.Status) where
  socket : Socket
  addr   : SockAddr
  data   : Lina.Request

namespace Request

-- the `answer` function that is used to answer a request. It takes a `Request` structure and 
-- returns a new `Request` structure with the status set to `Closed`.
def answer 
  (req: Request Status.Open)
  (status: Melp.Status)
  (headers: List (String × String))
  (body: String) 
  : IO (Request Status.Closed) := do
    let response := Melp.Response.new status headers body
    let _ ← req.socket.send $ String.toUTF8 $ response.toString {major := 1, minor := 1}
    req.socket.close
    pure { socket := req.socket, addr := req.addr, data := req.data }

-- the `ok` function is used to answer a request with a `200 OK` status code.
def ok (req: Request Status.Open) (body: String) : IO (Request Status.Closed) :=
  req.answer Melp.Status.Ok [] body

-- the `notFound` function is used to answer a request with a `404 Not Found` status code.
def notFound (req: Request Status.Open) : IO (Request Status.Closed) :=
  req.answer Melp.Status.NotFound [] "Not Found"

-- the `badRequest` function is used to answer a request with a `400 Bad Request` status code.
def badRequest (req: Request Status.Open) : IO (Request Status.Closed) :=
  req.answer Melp.Status.BadRequest [] "Bad Request"

-- the `internalServerError` function is used to answer a request with a `500 Internal Server Error`
def internalServerError (req: Request Status.Open) : IO (Request Status.Closed) :=
  req.answer Melp.Status.InternalServerError [] "Internal Server Error"
  
-- the `unprocessableEntity` function is used to answer a request with a `422 Unprocessable Entity`
def unprocessableEntity (req: Request Status.Open) : IO (Request Status.Closed) :=
  req.answer Melp.Status.UnprocessableEntity [] "Unprocessable Entity"

-- the `created` function is used to answer a request with a `201 Created` status code.
def created (req: Request Status.Open) (body: String) : IO (Request Status.Closed) :=
  req.answer Melp.Status.Created [] body

end Request
end Melp