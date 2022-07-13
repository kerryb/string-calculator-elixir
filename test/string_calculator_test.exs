defmodule StringCalculatorTest do
  use ExUnit.Case

  describe "StringCalculator.add/1" do
    test "returns 0 for an empty string" do
      assert StringCalculator.add("") == 0
    end
  end
end
