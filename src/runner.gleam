import day01
import day02
import gleam/int
import gleam/list
import gleam/result
import outputer

const runners = [
  #("Historian Hysteria", day01.solve), #("Red-Nosed Reports", day02.solve),
]

pub fn run(day, input) {
  runners
  |> list.drop(day - 1)
  |> list.first
  |> result.map(fn(runner) {
    let #(title, run) = runner
    outputer.day_banner(day, title)
    run(input)
  })
  |> result.map_error(fn(_) {
    "Day " <> int.to_string(day) <> " is not implemented."
  })
}
