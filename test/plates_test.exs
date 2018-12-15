defmodule PlatesTest do
  use ExUnit.Case
  doctest Plates

  test "available_plates" do
    assert Plates.available_plates() == [45, 35, 25, 10, 5, 2.5]
  end

  test "barbell_weight", do: assert Plates.barbell_weight() == 45

  describe "max_plate" do
    test "2.5", do: assert Plates.max_plate(2.5) == 2.5
    test "5", do: assert Plates.max_plate(5) == 5
    test "7.5", do: assert Plates.max_plate(7.5) == 5
    test "10", do: assert Plates.max_plate(10) == 10
    test "15", do: assert Plates.max_plate(15) == 10
    test "20", do: assert Plates.max_plate(20) == 10
    test "25", do: assert Plates.max_plate(25) == 25
    test "35", do: assert Plates.max_plate(35) == 35
    test "40", do: assert Plates.max_plate(40) == 35
    test "45", do: assert Plates.max_plate(45) == 45
    test "50", do: assert Plates.max_plate(50) == 45
  end

  describe "plates_on_one_side" do
    test "2.5", do: assert Plates.plates_on_one_side(2.5) == [2.5]
    test "5", do: assert Plates.plates_on_one_side(5) == [5]
    test "10", do: assert Plates.plates_on_one_side(10) == [10]
    test "15", do: assert Plates.plates_on_one_side(15) == [10, 5]
    test "20", do: assert Plates.plates_on_one_side(20) == [10, 10]
    test "30", do: assert Plates.plates_on_one_side(30) == [25, 5]
    test "32.5", do: assert Plates.plates_on_one_side(32.5) == [25, 5, 2.5]
    test "35", do: assert Plates.plates_on_one_side(35) == [35]
    test "42.5", do: assert Plates.plates_on_one_side(42.5) == [35, 5, 2.5]
    test "45", do: assert Plates.plates_on_one_side(45) == [45]
  end

  describe "plates" do
    test "45" do
      assert Plates.plates(45) == []
    end

    test "under 45" do
      assert Plates.plates(40) == []
      assert Plates.plates(0) == []
    end

    test "not divisible by 5" do
      assert_raise RuntimeError, "not divisible by 5", fn ->
        Plates.plates(47)
      end
    end
  end
end
