defmodule StringCalculator do
  def add(""), do: 0

  def add("//" <> <<delimiter::bytes-size(1)>> <> "\n" <> input),
    do: split_and_sum(input, delimiter)

  def add(input), do: split_and_sum(input, ~r/[,\n]/)

  defp split_and_sum(input, split_pattern),
    do: input |> String.split(split_pattern) |> Enum.map(&String.to_integer/1) |> Enum.sum()
end
