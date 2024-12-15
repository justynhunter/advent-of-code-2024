import day03
import fileutil
import gleam/result
import gleeunit
import gleeunit/should

pub fn main() {
  gleeunit.main()
}

pub fn part1_test() {
  fileutil.read_test_input(3)
  |> result.map(day03.part1)
  |> result.map(fn(solution) { should.equal(solution, 161) })
}

pub fn part2_test() {
  ["xmul(2,4)&mul[3,7]!^don't()_mul(5,5)+mul(32,64](mul(11,8)undo()?mul(8,5))"]
  |> day03.part2
  |> should.equal(48)
}
