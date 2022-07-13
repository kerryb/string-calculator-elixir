defmodule StringCalculator do
  def add(""), do: 0

  def add("//" <> <<delimiter::bytes-size(1)>> <> "\n" <> input),
    do: split_and_sum(input, delimiter)

  def add("//" <> delimiter_and_input) do
    with [preamble, input] <- String.split(delimiter_and_input, "\n"),
         delimiters <-
           ~r/\[([^\]]+)\]/ |> Regex.scan(preamble, capture: :all_but_first) |> List.flatten(),
         split_pattern <- delimiters |> Enum.map_join("|", &Regex.escape/1) |> Regex.compile!() do
      split_and_sum(input, split_pattern)
    end
  end

  def add(input), do: split_and_sum(input, ~r/[,\n]/)

  defp split_and_sum(input, split_pattern) do
    input
    |> String.split(split_pattern)
    |> Enum.map(&String.to_integer/1)
    |> validate()
    |> Enum.reject(&(&1 > 1000))
    |> Enum.sum()
  end

  defp validate(numbers) do
    case Enum.filter(numbers, &(&1 < 0)) do
      [] -> numbers
      numbers -> raise "Negatives not allowed: #{Enum.join(numbers, ", ")}"
    end
  end
end
