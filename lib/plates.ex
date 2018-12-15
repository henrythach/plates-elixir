defmodule Plates do
  @moduledoc """
  Documentation for Plates.
  """

  def barbell_weight, do: 45

  def available_plates do
    [45, 35, 25, 10, 5, 2.5]
  end

  def plates(weight) when weight <= 45, do: []
  def plates(weight) when rem(weight, 5) != 0, do: raise "not divisible by 5"
  def plates(weight) do
    plates_on_one_side((weight - 45) / 2)
  end

  def plates_on_one_side(weight) when weight <= 0, do: []
  def plates_on_one_side(weight) do
    [max_plate(weight)] ++ plates_on_one_side(weight - max_plate(weight))
  end

  def max_plate(weight) when weight >= 45, do: 45
  def max_plate(weight) do
    available_plates()
      |> Enum.max_by(&(&1 <= weight))
  end
end
