defmodule Blink do
  @open_time 100
  @closed_time 10
  @beginning_of_line "\r"

  def run do
    IO.ANSI.clear()
    |> IO.write()

    eyes_open()
  end

  def eyes_open do
    eyes = IO.ANSI.red() <> IO.ANSI.bright()
    normal = IO.ANSI.black() <> IO.ANSI.normal()
    print(" #{eyes}O#{normal}w#{eyes}O#{normal} ")
    time = @open_time * :rand.uniform(30)
    :timer.sleep(time)
    blink()
    eyes_open()
  end

  def blink do
    print(" ^w^ ")
    time = @closed_time * :rand.uniform(30)
    :timer.sleep(time)
  end

  defp print(message) do
    (IO.ANSI.home() <> IO.ANSI.cursor_down(10))
    |> IO.write()

    IO.write(
      @beginning_of_line <>
        "                               " <>
        message
    )
  end
end

Blink.run()
