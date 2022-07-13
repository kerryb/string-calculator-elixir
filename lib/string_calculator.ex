defmodule StringCalculator do
  def add(""), do: 0

  def add(input) do
    input |> String.split(",") |> Enum.map(&String.to_integer/1) |> Enum.sum()
  end
end
