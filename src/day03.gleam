import gleam/int
import gleam/io
import gleam/list
import gleam/option
import gleam/regexp
import gleam/string

fn calc_mul(match: regexp.Match) {
  match.submatches
  |> option.values
  |> list.filter_map(int.parse(_))
  |> list.fold(1, int.multiply)
}

pub fn part1(lines) {
  let assert Ok(reg) = regexp.from_string("mul\\(([0-9]{1,3}),([0-9]{1,3})\\)")

  lines
  |> string.join("")
  |> regexp.scan(reg, _)
  |> list.map(calc_mul(_))
  |> list.fold(0, int.add)
}

pub fn part2(lines) {
  let assert Ok(reg) =
    regexp.from_string("mul\\((\\d{1,3}),(\\d{1,3})\\)|(do(n't)?\\(\\))")

  let solution =
    lines
    |> string.join("")
    |> regexp.scan(reg, _)
    |> list.fold(#(True, 0), fn(acc, match) {
      case acc.0, match.content {
        _, "don't()" -> #(False, acc.1)
        _, "do()" -> #(True, acc.1)
        False, _ -> #(False, acc.1)
        True, _ -> #(True, acc.1 + calc_mul(match))
      }
    })

  solution.1
}

pub fn solve(input: List(String)) {
  let solution1 = part1(input)
  let solution2 = part2(input)

  io.println("part1: " <> int.to_string(solution1))
  io.println("part2: " <> int.to_string(solution2))
}
