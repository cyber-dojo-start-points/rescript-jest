open Jest
open Expect

test("to life the universe and everything", () => {
  expect(Hiker.answer())->toEqual(42)
})

test("has two digits", () => {
  expect(Hiker.answer()->Int.toString->String.length)->toEqual(2)
})
