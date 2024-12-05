import argv
import day01
import gleam/io

pub fn main() {
  case argv.load().arguments {
    [_, "1"] -> day01.solve("data/day01.txt")
    [_, x] -> io.println("not found " <> x)
    _ -> io.println("bad call")
  }
}
