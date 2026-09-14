open Jest
open Expect

test("is less than one hundred", () => {
  expect(Hiker.answer() < 100)->toEqual(true)
})
