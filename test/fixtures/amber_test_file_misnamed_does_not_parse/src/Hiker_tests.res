// testMatch would never run this file, but ReScript compiles every file
// under the sources dir, so its parse error stops the build regardless.
open Jest
open Expect

test("has three digits", () => {
  expect(Hiker.answer())->toEqual(100
})
