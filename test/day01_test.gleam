import day01
import fileutil
import gleam/result
import gleeunit
import gleeunit/should

pub fn main() {
  gleeunit.main()
}

pub fn part1_test() {
  fileutil.read_test_input(1)
  |> result.map(day01.part1)
  |> result.map(fn(solution) { should.equal(solution, 11) })
}

pub fn part2_test() {
  fileutil.read_test_input(1)
  |> result.map(day01.part2)
  |> result.map(fn(solution) { should.equal(solution, 31) })
}
