import gleam/int
import gleam/io
import gleam/list
import gleam/string

pub type LocationList {
  LocationList(left: List(Int), right: List(Int))
}

fn parse_loc_lists(lines) {
  let assert [left, right] =
    lines
    |> list.map(fn(line) {
      line
      |> string.trim()
      |> string.split("   ")
      |> list.map(fn(i) {
        case int.parse(i) {
          Ok(num) -> num
          Error(_) -> panic as "not an int"
        }
      })
    })
    |> list.transpose

  LocationList(left, right)
}

pub fn part1(lines) {
  let loc_list = parse_loc_lists(lines)
  list.zip(
    list.sort(loc_list.left, int.compare),
    list.sort(loc_list.right, int.compare),
  )
  |> list.map(fn(pair) {
    let #(left, right) = pair
    int.absolute_value(left - right)
  })
  |> int.sum()
}

pub fn part2(lines) {
  let loc_list = parse_loc_lists(lines)
  list.fold(loc_list.left, 0, fn(acc, val) {
    acc + list.count(loc_list.right, fn(r_val) { val == r_val }) * val
  })
}

pub fn solve(input) {
  let solution1 = part1(input)
  let solution2 = part2(input)

  io.println("part1: " <> int.to_string(solution1))
  io.println("part2: " <> int.to_string(solution2))
}
