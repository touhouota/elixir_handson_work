defmodule Basic do
  @moduledoc """
  Documentation for Basic.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Basic.hello()
      :world

  """
  def hello do
    :world
  end
  
  def q1 do
    #data = File.stream!('data.json')
    #map_data = Enum.map(data, fn s -> Poison.decode!(s) end)
    #filter_data = Enum.filter(map_data, fn hash -> hash["age"] <= 20)
    #Enum.count(filter)
    "data.json"
    |> File.stream!
    |> Enum.map(fn s -> Poison.decode!(s) end)
    |> Enum.filter(fn hash -> hash["age"] <= 20 end)
    |> Enum.count
  end

  def q2_1 do
    "data.json"
    |> File.stream!
    |> Stream.map(fn s -> Poison.decode!(s) end)
    |> Stream.filter(fn h -> h["age"] <= 20 end)
    |> Enum.count
  end

  def q2_2 do
    "data.json"
    |> File.stream!
    |> Flow.from_enumerable
    |> Flow.map(fn s -> Poison.decode!(s) end)
    |> Flow.partition
    |> Flow.filter(fn h -> h["age"] <= 20 end)
    |> Enum.count
  end 
end
