import day04
import fileutil
import gleam/result
import gleeunit
import gleeunit/should

pub fn main() {
  gleeunit.main()
}

pub fn part1_test() {
  fileutil.read_test_input(4)
  |> result.map(day04.part1)
  |> result.map(fn(solution) { should.equal(solution, 2) })
}

pub fn part2_test() {
  fileutil.read_test_input(4)
  |> result.map(day04.part2)
  |> result.map(fn(solution) { should.equal(solution, 4) })
}
