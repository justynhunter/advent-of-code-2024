import argv
import fileutil
import gleam/int
import gleam/result
import runner

pub fn main() {
  get_day() |> run()
}

fn run(day) {
  fileutil.read_input(day)
  |> result.map_error(fn(_) { "No input file for day " <> int.to_string(day) })
  |> result.try(fn(input) { runner.run(day, input) })
  |> result.map_error(fn(msg) { panic as msg })
}

fn get_day() {
  case argv.load().arguments {
    [] -> panic as "no input"
    [n] -> {
      case int.parse(n) {
        Ok(day) -> day
        _ -> panic as "args"
      }
    }
    _ -> panic as "Invalid input"
  }
}
