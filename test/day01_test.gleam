import day01
import gleeunit
import gleeunit/should

pub fn main() {
  gleeunit.main()
}

pub fn part1_test() {
  day01.part1("data/day01_test.txt")
  |> should.equal(11)
}

pub fn part2_test() {
  day01.part2("data/day01_test.txt")
  |> should.equal(31)
}
