defmodule StringCalculatorTest do
  use ExUnit.Case

  describe "StringCalculator.add/1" do
    test "returns 0 for an empty string" do
      assert StringCalculator.add("") == 0
    end

    test "returns the number if there's only one" do
      assert StringCalculator.add("42") == 42
    end

    test "returns the sum of two comma-separated numbers" do
      assert StringCalculator.add("42,27") == 69
    end

    test "returns the sum of many comma-separated numbers" do
      assert StringCalculator.add("1,2,3,4,5") == 15
    end
  end
end
