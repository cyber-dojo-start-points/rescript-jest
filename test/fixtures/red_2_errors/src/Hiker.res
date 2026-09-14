// ReScript has no null, so the run-time error comes from unwrapping an
// option that holds nothing.
let missing: option<int> = None

let answer = () => Option.getOrThrow(missing)
