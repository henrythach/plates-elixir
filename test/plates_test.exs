defmodule PlatesTest do
  use ExUnit.Case
  doctest Plates

  test "available_plates" do
    assert Plates.available_plates() == [45, 35, 25, 10, 5, 2.5]
  end

  test "barbell_weight" do
    assert Plates.barbell_weight() == 45
  end

  describe "max_plate" do
    test "45 returns 0" do
      assert Plates.max_plate(45) == 0
    end

    test "50 returns 2.5" do
      assert Plates.max_plate(50) == 2.5
    end

    test "135 returns 45" do
      assert Plates.max_plate(135) == 45
    end

    test "140 returns 45" do
      assert Plates.max_plate(140) == 45
    end
  end

  describe "plates" do
    test "45" do
      assert Plates.plates(45) == []
    end

    test "under 45" do
      assert Plates.plates(40) == []
      assert Plates.plates(0) == []
      assert Plates.plates(-1) == []
    end

    test "65" do
      assert Plates.plates(65) == [10]
    end

    # test "70" do
    #   assert Plates.plates(70) == [10, 2.5]
    # end
  end
end
