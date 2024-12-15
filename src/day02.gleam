import gleam/int
import gleam/io
import gleam/list
import gleam/string

fn parse_reports(lines) {
  list.map(lines, fn(l) {
    string.split(l, " ")
    |> list.map(fn(i) {
      case int.parse(i) {
        Ok(i) -> i
        _ -> panic as "invalid int"
      }
    })
  })
}

fn is_safe(report) {
  let diffs =
    report
    |> list.window_by_2
    |> list.map(fn(pair) { pair.1 - pair.0 })

  list.all(diffs, fn(diff) { 0 < diff && diff < 4 })
  || list.all(diffs, fn(diff) { 0 > diff && -4 < diff })
}

fn skip_one(report) {
  list.range(1, list.length(report))
  |> list.map(fn(idx) {
    report
    |> list.take(idx - 1)
    |> list.append(list.drop(report, idx))
  })
}

pub fn part1(lines) {
  lines
  |> parse_reports
  |> list.count(is_safe(_))
}

pub fn part2(lines) {
  lines
  |> parse_reports
  |> list.count(fn(report) {
    is_safe(report) || skip_one(report) |> list.any(is_safe(_))
  })
}

pub fn solve(input) {
  let solution1 = part1(input)
  let solution2 = part2(input)

  io.println("part1: " <> int.to_string(solution1))
  io.println("part2: " <> int.to_string(solution2))
}
