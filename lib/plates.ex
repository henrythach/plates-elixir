defmodule Plates do
  @moduledoc """
  Documentation for Plates.
  """

  def barbell_weight, do: 45

  def available_plates do
    [45, 35, 25, 10, 5, 2.5]
  end

  def max_plate(weight) when weight <= 45, do: 0
  def max_plate(weight) when weight >= 135, do: hd(available_plates())
  def max_plate(weight) do
    available_plates()
      |> Stream.filter(&(&1 * 2 <= weight - barbell_weight()))
      |> Enum.max
  end

  def plates(weight) when weight <= 45, do: []

  def plates(weight) do
    [(weight - 45) / 2] ++ plates(weight - 45)
  end
end
