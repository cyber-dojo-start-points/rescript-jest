// testMatch looks for *_spec.bs.js, so this file compiles but jest never
// runs it. The failing expectation inside it therefore costs nothing.
open Jest
open Expect

test("has three digits", () => {
  expect(Hiker.answer())->toEqual(100)
})
