import gleam/int
import gleam/io
import gleam/list
import gleam/option
import gleam/regexp
import gleam/result

pub fn get_muls(line) {
  let assert Ok(reg) = regexp.from_string("mul\\(([0-9]{1,3}),([0-9]{1,3})\\)")
  regexp.scan(reg, line)
  |> list.map(fn(match) {
    match.submatches
    |> list.map(option.unwrap(_, "0"))
    |> list.map(int.parse(_))
    |> list.map(result.unwrap(_, 0))
  })
  |> list.flatten
}

pub fn part1(lines) {
  lines
  |> list.map(fn(line) {
    line
    |> get_muls
    |> list.sized_chunk(2)
    |> list.map(fn(chunk) {
      chunk
      |> list.fold(1, int.multiply)
    })
    |> list.fold(0, int.add)
  })
  |> list.fold(0, int.add)
}

pub fn part2(line) {
  1
}

pub fn solve(input: List(String)) {
  let solution1 = part1(input)
  let solution2 = part2(input)

  io.println("part1: " <> int.to_string(solution1))
  io.println("part2: " <> int.to_string(solution2))
}
