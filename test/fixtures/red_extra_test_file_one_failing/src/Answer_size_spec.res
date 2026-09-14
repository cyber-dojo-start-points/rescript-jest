open Jest
open Expect

test("has three digits", () => {
  expect(Hiker.answer()->Int.toString->String.length)->toEqual(3)
})
