import fileutil
import gleam/int
import gleam/io
import gleam/list
import gleam/result
import gleam/string

type ListPair {
  ListPair(left: List(Int), right: List(Int))
}

fn lines_to_int_lists(lines) {
  let assert [left, right] =
    lines
    |> list.map(fn(line) {
      line
      |> string.trim()
      |> string.split("   ")
      |> list.map(fn(i) { i |> int.parse() |> result.unwrap(0) })
    })
    |> list.transpose

  ListPair(left, right)
}

pub fn part1(lines) {
  let list_pair = lines_to_int_lists(lines)
  list.zip(
    list.sort(list_pair.left, int.compare),
    list.sort(list_pair.right, int.compare),
  )
  |> list.map(fn(pair) {
    let #(left, right) = pair
    int.absolute_value(left - right)
  })
  |> int.sum()
}

pub fn part2(lines) {
  let list_pair = lines_to_int_lists(lines)
  list.fold(list_pair.left, 0, fn(acc, val) {
    acc + list.count(list_pair.right, fn(r_val) { val == r_val }) * val
  })
}

pub fn solve(input) {
  let solution1 = part1(input)
  let solution2 = part2(input)

  io.println("part1: " <> int.to_string(solution1))
  io.println("part2: " <> int.to_string(solution2))
}
