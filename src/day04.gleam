import gleam/bit_array
import gleam/dict
import gleam/int
import gleam/io
import gleam/list
import gleam/string

fn make_grid(lines) {
  lines
  |> list.index_map(fn(line, index) { #(index, line) })
  |> list.flat_map(fn(line) {
    line.1
    |> string.to_graphemes()
    |> list.index_map(fn(char, index) { #(#(index, line.0), char) })
  })
  |> dict.from_list
}

fn make_search_grid(len) {
  [#(1, 0), #(1, 1), #(0, 1), #(-1, 1), #(-1, 0), #(-1, -1), #(0, -1), #(1, -1)]
  |> list.map(fn(dir) {
    list.range(0, len - 1)
    |> list.map(fn(f) { #(dir.0 * f, dir.1 * f) })
  })
}

pub fn part1(lines) {
  lines
  |> make_grid
  0
}

pub fn part2(_input) {
  0
}

pub fn solve(input) {
  let solution1 = part1(input)
  let solution2 = part2(input)

  io.println("part1: " <> int.to_string(solution1))
  io.println("part2: " <> int.to_string(solution2))
}
