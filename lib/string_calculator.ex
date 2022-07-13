defmodule StringCalculator do
  def add(""), do: 0

  def add(input) do
    String.to_integer(input)
  end
end
