import day03
import fileutil
import gleam/io
import gleam/list
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
  fileutil.read_test_input(2)
  |> result.map(day03.part2)
  |> result.map(fn(solution) { should.equal(solution, 4) })
}
