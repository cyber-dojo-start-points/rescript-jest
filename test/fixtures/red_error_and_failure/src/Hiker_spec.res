open Jest
open Expect

// ReScript has no null, so the run-time error comes from unwrapping an
// option that holds nothing.
let missing: option<int> = None

test("to life the universe and everything", () => {
  expect(Hiker.answer())->toEqual(42)
})

test("has two digits", () => {
  expect(Option.getOrThrow(missing))->toEqual(2)
})
