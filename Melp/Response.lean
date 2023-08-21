import Lina.Version
import Melp.Status

open Lina.Version

namespace Melp

structure Response where
  status : Melp.Status
  headers : List (String × String)
  body : String

def Response.new (status : Status) (headers : List (String × String)) (body : String) : Response :=
  { status := status, headers := headers, body := body }

def Response.toString (version: Lina.Version) (r : Response) : String :=
  let headers := r.headers.map (λ (k, v) => s!"{k}: {v}¬")
  let headers := String.join headers
  let major := version.major
  let minor := version.minor
  let code := r.status.code
  let status := r.status.toString
  s!"HTTP/{major}.{minor} {code} {status}\r\n{headers}\r\n{r.body}"

end Melp