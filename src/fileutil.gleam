import gleam/result
import gleam/string
import simplifile

pub fn read_input(path) {
  use file <- result.try(simplifile.read(path))
  let lines = file |> string.trim() |> string.split("\n")

  Ok(lines)
}
