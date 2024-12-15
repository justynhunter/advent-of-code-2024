import gleam/int
import gleam/result
import gleam/string
import simplifile

pub fn read_input(day) {
  use file <- result.try(simplifile.read(
    "./data/day" <> get_day_string(day) <> ".txt",
  ))
  let lines = file |> string.trim() |> string.split("\n")

  Ok(lines)
}

pub fn read_test_input(day) {
  use file <- result.try(simplifile.read(
    "./data/day" <> get_day_string(day) <> "_test.txt",
  ))
  let lines = file |> string.trim() |> string.split("\n")

  Ok(lines)
}

fn get_day_string(day) {
  day
  |> int.to_string
  |> string.pad_start(2, "0")
}
