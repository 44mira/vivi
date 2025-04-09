return {
  s(
    "main",
    fmt(
      [[
def main():
  {}


if __name__ == '__main__':
  main()]],
      { i(1) }
    )
  ),
}
