import gleam/int
import gleam/io
import gleam/list
import gleam/option
import gleam/regexp
import gleam/string

fn calc_mul(submatches) {
  submatches
  |> option.values
  |> list.filter_map(int.parse(_))
  |> list.fold(1, int.multiply)
}

pub fn get_muls(line) {
  let assert Ok(reg) = regexp.from_string("mul\\(([0-9]{1,3}),([0-9]{1,3})\\)")
  regexp.scan(reg, line)
  |> list.map(fn(match) { calc_mul(match.submatches) })
}

fn parse_matches(matches: List(regexp.Match), in_do, total) {
  case matches {
    [match, ..tail] -> {
      case in_do, match.content {
        _, "don't()" -> parse_matches(tail, False, total)
        _, "do()" -> parse_matches(tail, True, total)
        False, _ -> parse_matches(tail, False, total)
        True, _ -> parse_matches(tail, True, total + calc_mul(match.submatches))
      }
    }
    [] -> total
  }
}

pub fn get_do_muls(line) {
  let assert Ok(reg) =
    regexp.from_string("mul\\((\\d{1,3}),(\\d{1,3})\\)|(do(n't)?\\(\\))")
  regexp.scan(reg, line)
  |> parse_matches(True, 0)
}

pub fn part1(lines) {
  lines
  |> string.join("")
  |> get_muls
  |> list.fold(0, int.add)
}

pub fn part2(lines) {
  lines
  |> string.join("")
  |> get_do_muls
}

pub fn solve(input: List(String)) {
  let solution1 = part1(input)
  let solution2 = part2(input)

  io.println("part1: " <> int.to_string(solution1))
  io.println("part2: " <> int.to_string(solution2))
}
