defmodule Chop do 
  def guess(actual, range = low .. high) do
    guess = div(low+high, 2)
    IO.puts "Is it #{mid}?"
    _guess(actual, guess, range)
  end

  defp _guess(actual, actual, _) do
    IO.puts "CORRECT!"
  end

  defp _guess(actual, guess, low..high) when actual < guess do:
    guess(actual, low..div(low + guess, 2))
  end

  defp _guess(actual, guess, low..high) do:
    guess(actual, guess..div(guess + high, 2))
  end

  defp mid(range) do
    first .. last = range
    div(first + last, 2)
  end

  defp next_range(actual, pivot, prev_range) when actual < pivot do
    first .. last = prev_range
    first .. pivot
  end

  defp next_range(actual, pivot, prev_range) do
    first .. last = prev_range
    pivot .. last
  end
end
