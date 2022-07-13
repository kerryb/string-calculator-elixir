defmodule StringCalculator do
  def add(""), do: 0

  def add("//" <> <<delimiter::bytes-size(1)>> <> "\n" <> input) do
    input |> String.split(delimiter) |> Enum.map(&String.to_integer/1) |> Enum.sum()
  end

  def add(input) do
    input |> String.split(~r/[,\n]/) |> Enum.map(&String.to_integer/1) |> Enum.sum()
  end
end
