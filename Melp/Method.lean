-- Methods as described in https://datatracker.ietf.org/doc/html/rfc2616#section-5.1.1

namespace Melp

-- A method is a token that indicates the operation to be performed.
inductive Method where
  | Option
  | Get
  | Head
  | Post
  | Put
  | Delete
  | Trace
  | Connect
  deriving BEq, Hashable

instance : ToString Method where
  toString 
    | Method.Option => "OPTION"
    | Method.Get     => "GET"
    | Method.Head    => "HEAD"
    | Method.Post    => "POST"
    | Method.Put     => "PUT"
    | Method.Delete  => "DELETE"
    | Method.Trace   => "TRACE"
    | Method.Connect => "CONNECT"

def Opt (a: Type) : Type := Option a

-- Parses a string into a method.
def Method.fromString : String → Opt Method
  | "OPTION"  => some Method.Option
  | "GET"     => some Method.Get
  | "HEAD"    => some Method.Head
  | "POST"    => some Method.Post
  | "PUT"     => some Method.Put
  | "DELETE"  => some Method.Delete
  | "TRACE"   => some Method.Trace
  | "CONNECT" => some Method.Connect
  | _         => none

end Melp