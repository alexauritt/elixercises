defmodule MyList do

  def span(from, to)
    when from > to,
    do: []
  def span(from, to) do
    [ from | span(from+1, to) ]
  end
  
  def sum([]), do: 0 
  def sum([ head | tail ]), do: head + sum(tail)
  def mapsum(list, func) do
    sum(Enum.map(list, func))
  end

  def max([]), do: nil
  def max([ head | tail ]), do: _largest(head, max(tail))
  
  defp _largest(first, second)
    when is_nil(second),
    do: first
  defp _largest(first, second)
    when first >= second,
    do: first
  defp _largest(first, second)
    when second > first,
    do: second
end

# IO.puts MyList.sum([3,4,5,6,7])
# IO.puts MyList.mapsum( [1,2,3], &(&1 * &1) )
#IO.puts MyList.max([7,3,-9,20,-4])
IO.inspect MyList.span(3,9)
