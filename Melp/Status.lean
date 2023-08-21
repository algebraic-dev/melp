namespace Melp

inductive Status where
  | Continue
  | SwitchingProtocols
  | Processing
  | EarlyHints
  | Ok
  | Created
  | Accepted
  | NonAuthoritativeInformation
  | NoContent
  | ResetContent
  | PartialContent
  | MultiStatus
  | AlreadyReported
  | IMUsed
  | MultipleChoices
  | MovedPermanently
  | Found
  | SeeOther
  | NotModified
  | UseProxy
  | TemporaryRedirect
  | PermanentRedirect
  | BadRequest
  | Unauthorized
  | PaymentRequired
  | Forbidden
  | NotFound
  | MethodNotAllowed
  | NotAcceptable
  | ProxyAuthenticationRequired
  | RequestTimeout
  | Conflict
  | Gone
  | LengthRequired
  | PreconditionFailed
  | PayloadTooLarge
  | URITooLong
  | UnsupportedMediaType
  | RangeNotSatisfiable
  | ExpectationFailed
  | ImATeapot
  | MisdirectedRequest
  | UnprocessableEntity
  | Locked
  | FailedDependency
  | TooEarly
  | UpgradeRequired
  | PreconditionRequired
  | TooManyRequests
  | RequestHeaderFieldsTooLarge
  | UnavailableForLegalReasons
  | InternalServerError
  | NotImplemented
  | BadGateway
  | ServiceUnavailable
  | GatewayTimeout
  | HTTPVersionNotSupported
  | VariantAlsoNegotiates
  | InsufficientStorage
  | LoopDetected
  | NotExtended
  | NetworkAuthenticationRequired

namespace Status 

def toString : Status → String
  | Continue => "CONTINUE"
  | SwitchingProtocols => "SWITCHING_PROTOCOLS"
  | Processing => "PROCESSING"
  | EarlyHints => "EARLY_HINTS"
  | Ok => "OK"
  | Created => "CREATED" 
  | Accepted => "ACCEPTED"
  | NonAuthoritativeInformation => "NON_AUTHORITATIVE_INFORMATION"
  | NoContent => "NO_CONTENT"
  | ResetContent => "RESET_CONTENT"
  | PartialContent => "PARTIAL_CONTENT"
  | MultiStatus => "MULTI_STATUS"
  | AlreadyReported =>  "ALREADY_REPORTED"
  | IMUsed => "IM_USED"
  | MultipleChoices => "MULTIPLE_CHOICES"
  | MovedPermanently => "MOVED_PERMANENTLY"
  | Found => "FOUND"
  | SeeOther => "SEE_OTHER"
  | NotModified => "NOT_MODIFIED"
  | UseProxy => "USE_PROXY"
  | TemporaryRedirect =>  "TEMPORARY_REDIRECT"
  | PermanentRedirect => "PERMANENT_REDIRECT"
  | BadRequest => "BAD_REQUEST"
  | Unauthorized => "UNAUTHORIZED"
  | PaymentRequired => "PAYMENT_REQUIRED"
  | Forbidden => "FORBIDDEN"
  | NotFound => "NOT_FOUND"
  | MethodNotAllowed => "METHOD_NOT_ALLOWED"
  | NotAcceptable => "NOT_ACCEPTABLE"
  | ProxyAuthenticationRequired => "PROXY_AUTHENTICATION_REQUIRED"
  | RequestTimeout => "REQUEST_TIMEOUT"
  | Conflict => "CONFLICT"
  | Gone => "GONE"
  | LengthRequired => "LENGTH_REQUIRED" 
  | PreconditionFailed => "PRECONDITION_FAILED"
  | PayloadTooLarge => "PAYLOAD_TOO_LARGE"
  | URITooLong => "URI_TOO_LONG"
  | UnsupportedMediaType => "UNSUPPORTED_MEDIA_TYPE"
  | RangeNotSatisfiable => "RANGE_NOT_SATISFIABLE"
  | ExpectationFailed => "EXPECTATION_FAILED"
  | ImATeapot => "IM_A_TEAPOT"
  | MisdirectedRequest => "MISDIRECTED_REQUEST"
  | UnprocessableEntity => "UNPROCESSABLE_ENTITY"
  | Locked => "LOCKED"
  | FailedDependency => "FAILED_DEPENDENCY" 
  | TooEarly => "TOO_EARLY"
  | UpgradeRequired => "UPGRADE_REQUIRED"
  | PreconditionRequired => "PRECONDITION_REQUIRED"
  | TooManyRequests => "TOO_MANY_REQUESTS"
  | RequestHeaderFieldsTooLarge => "REQUEST_HEADER_FIELDS_TOO_LARGE"
  | UnavailableForLegalReasons => "UNAVAILABLE_FOR_LEGAL_REASONS"
  | InternalServerError => "INTERNAL_SERVER_ERROR"
  | NotImplemented => "NOT_IMPLEMENTED"
  | BadGateway => "BAD_GATEWAY"
  | ServiceUnavailable => "SERVICE_UNAVAILABLE"
  | GatewayTimeout => "GATEWAY_TIMEOUT"
  | HTTPVersionNotSupported =>  "HTTP_VERSION_NOT_SUPPORTED"
  | VariantAlsoNegotiates => "VARIANT_ALSO_NEGOTIATES"
  | InsufficientStorage => "INSUFFICIENT_STORAGE"
  | LoopDetected => "LOOP_DETECTED"
  | NotExtended => "NOT_EXTENDED"
  | NetworkAuthenticationRequired => "NETWORK_AUTHENTICATION_REQUIRED"
  
def code : Status → Int
  | Continue => 100
  | SwitchingProtocols => 101
  | Processing => 102
  | EarlyHints => 103
  | Ok => 200
  | Created => 201 
  | Accepted => 202
  | NonAuthoritativeInformation => 203
  | NoContent => 204
  | ResetContent => 205
  | PartialContent => 206
  | MultiStatus => 207
  | AlreadyReported =>  208
  | IMUsed => 226
  | MultipleChoices => 300
  | MovedPermanently => 301
  | Found => 302
  | SeeOther => 303
  | NotModified => 304
  | UseProxy => 305
  | TemporaryRedirect =>  307
  | PermanentRedirect => 308
  | BadRequest => 400
  | Unauthorized => 401
  | PaymentRequired => 402
  | Forbidden => 403
  | NotFound => 404
  | MethodNotAllowed => 405
  | NotAcceptable => 406
  | ProxyAuthenticationRequired => 407
  | RequestTimeout => 408
  | Conflict => 409
  | Gone => 410
  | LengthRequired => 411 
  | PreconditionFailed => 412
  | PayloadTooLarge => 413
  | URITooLong => 414
  | UnsupportedMediaType => 415
  | RangeNotSatisfiable => 416
  | ExpectationFailed => 417
  | ImATeapot => 418
  | MisdirectedRequest => 421
  | UnprocessableEntity => 422
  | Locked => 423
  | FailedDependency => 424 
  | TooEarly => 425
  | UpgradeRequired => 426
  | PreconditionRequired => 428
  | TooManyRequests => 429
  | RequestHeaderFieldsTooLarge => 431
  | UnavailableForLegalReasons => 451
  | InternalServerError => 500
  | NotImplemented => 501
  | BadGateway => 502
  | ServiceUnavailable => 503
  | GatewayTimeout => 504
  | HTTPVersionNotSupported =>  505
  | VariantAlsoNegotiates => 506
  | InsufficientStorage => 507
  | LoopDetected => 508
  | NotExtended => 510
  | NetworkAuthenticationRequired => 511

end Status
end Melp