open Jest
open Expect

test("has two digits", () => {
  expect(Hiker.answer()->Int.toString->String.length)->toEqual(2
})
