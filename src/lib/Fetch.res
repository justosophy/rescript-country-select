// A generic Response type for typing our fetch requests
module Response = {
  type t<'data>
  @send external json: t<'data> => promise<'data> = "json"
}

@val @scope("globalThis")
external get: (
  string,
) => promise<Response.t<'data>> =
  "fetch"
