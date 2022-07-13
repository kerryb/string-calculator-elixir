defmodule StringCalculatorTest do
  use ExUnit.Case
  doctest StringCalculator

  test "greets the world" do
    assert StringCalculator.hello() == :world
  end
end
