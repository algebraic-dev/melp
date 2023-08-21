-- Module for handling HTTP Requests. [Request] is the main structure of this module and it 
-- includes a `t` parameter that is used to track the status of the request. The status can be 
-- either `Open` or `Closed`. The `Open` status means that the request is still open and the 
-- `Closed` status means that the request has been closed with a response.

import Lina
import Socket

import Melp.Method
import Melp.Response

open Socket

namespace Melp

-- The `Status` parameter of the `Request` structure is used to track the status of the request.
inductive Request.Status
  | Open
  | Closed

-- The `Request` structure is used to represent a HTTP request. The `t` parameter is used to track
-- the status of the request.
structure Request where
  socket   : Socket
  addr     : SockAddr
  data     : Lina.Request
  
namespace Request

-- the `answer` function that is used to answer a request. It takes a `Request` structure and 
-- returns a new `Request` structure with the status set to `Closed`.
def answer 
  (req: Request)
  (status: Melp.Status)
  (headers: List (String × String))
  (body: String) 
  : IO Unit := do
    let response := Melp.Response.new status headers body
    let _ ← req.socket.send $ String.toUTF8 $ response.toString {major := 1, minor := 1}
    req.socket.close

def method (req: Request) : Option Method := Melp.Method.fromString req.data.method

end Request
end Melp