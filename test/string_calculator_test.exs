defmodule StringCalculatorTest do
  use ExUnit.Case

  describe "StringCalculator.add/1" do
    test "returns 0 for an empty string" do
      assert StringCalculator.add("") == 0
    end

    test "returns the number if there's only one" do
      assert StringCalculator.add("42") == 42
    end

    test "returns the sum of multiple comma- or newline-separated numbers" do
      assert StringCalculator.add("1,2\n3\n4,5") == 15
    end

    test "allows a custom delimiter to be specified" do
      assert StringCalculator.add("//;\n1;2") == 3
    end

    test "raises an error if given a negative number" do
      assert_raise RuntimeError, "Negatives not allowed: -42", fn ->
        StringCalculator.add("666,-42,69")
      end
    end

    test "includes all invalid numbers in the error message" do
      assert_raise RuntimeError, "Negatives not allowed: -42, -1", fn ->
        StringCalculator.add("666,-42,69,-1")
      end
    end

    test "ignores numbers over 1000" do
      assert StringCalculator.add("1,1000,2,1001") == 1003
    end
  end
end
