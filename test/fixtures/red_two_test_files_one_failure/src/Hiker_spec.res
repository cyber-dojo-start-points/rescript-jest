open Jest
open Expect

test("to life the universe and everything", () => {
  expect(Hiker.answer())->toEqual(42)
})

test("is less than one hundred", () => {
  expect(Hiker.answer() < 100)->toEqual(true)
})

test("is an even number", () => {
  expect(Hiker.answer() / 2 * 2)->toEqual(Hiker.answer())
})
