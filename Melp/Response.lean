-- This file contains the definition of the Response type and its associated functions as defined
-- in https://datatracker.ietf.org/doc/html/rfc2616#section-6

import Lina.Version
import Melp.Status

open Lina.Version

namespace Melp

-- Definition of a response in the HTTP protocol
structure Response where
  status : Melp.Status
  headers : List (String × String)
  body : String

-- Creates a new response
def Response.new (status : Status) (headers : List (String × String)) (body : String) : Response :=
  { status := status, headers := headers, body := body }

-- Transforms a response into string as specified in https://datatracker.ietf.org/doc/html/rfc2616#section-6
def Response.toString (version: Lina.Version) (r : Response) : String :=
  let major   := version.major
  let minor   := version.minor
  let code    := r.status.code
  let reason  := r.status.toString

  let httpVersion := s!"HTTP/{major}.{minor}"
  let statusLine  := s!"{httpVersion} {code} {reason}\r\n"

  let headers := r.headers.map (λ(k, v) => s!"{k}: {v}\r\n")
  let headers := String.join headers

  s!"{statusLine}{headers}\r\n{r.body}"

end Melp