open Jest
open Expect

test("to life the universe and everything", () => {
  expect(Hiker.answer())->toEqual(42)
})

test("is twice twenty one", () => {
  expect(Hiker.answer())->toEqual(21 + 21)
})

test("is six sevens", () => {
  expect(Hiker.answer())->toEqual(7 * 6)
})
