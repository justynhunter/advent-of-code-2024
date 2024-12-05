import fileutil
import gleam/int
import gleam/io
import gleam/list
import gleam/string

fn lines_to_int_lists(lines) {
  lines
  |> list.fold([[], []], fn(acc, line) {
    line
    |> string.trim()
    |> string.split("   ")
    |> fn(pair) {
      let assert [left, right] = acc
      let assert [Ok(first), Ok(second)] = list.map(pair, int.parse)
      [[first, ..left], [second, ..right]]
    }
  })
  |> list.map(fn(l) { list.sort(l, int.compare) })
  // sort lists
}

pub fn part1(data_path) {
  let assert Ok(lines) = fileutil.read_input(data_path)
  lines
  |> lines_to_int_lists()
  |> list.interleave()
  |> list.sized_chunk(2)
  |> list.fold(0, fn(acc, values) {
    let assert [left, right] = values
    acc + int.absolute_value(left - right)
  })
}

pub fn part2(data_path) {
  let assert Ok(lines) = fileutil.read_input(data_path)
  let assert [left_list, right_list] = lines_to_int_lists(lines)

  list.fold(left_list, 0, fn(acc, val) {
    acc + list.count(right_list, fn(r_val) { val == r_val }) * val
  })
}

pub fn solve(data_path) {
  let solution1 = part1(data_path)
  let solution2 = part2(data_path)

  io.println("part1: " <> int.to_string(solution1))
  io.println("part2: " <> int.to_string(solution2))
}
