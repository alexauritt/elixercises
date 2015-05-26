require IEx
defmodule MyEnums do
  def all?([], f), do: true
  def all?([ head | tail ], f) do
    f.(head) && all?(tail, f)
  end

  def each([], f), do: :ok
  def each([ head | tail ], f) do
    f.(head)
    each(tail, f)
  end

  def filter([],f), do: []
  def filter([ head | tail ], f) do
    IO.puts "head is #{head}"
    # IO.puts "{IO.inspect(tail)}"
    if f.(head) do
      IO.puts "yes"
      [head] ++ filter(tail, f)
      # IO.puts "cur is #{IO.inspect(cur)}"
    else
      IO.puts "no"
      filter(tail, f)
    end
  end
end  
  # def split([],f), do: true
  # def take([],f), do: true
# end

list = [13,5,17,8]
# IO.puts Enum.all? list, fn x -> x > 4 end
IO.puts MyEnums.filter(list, fn(x) -> x < 15 end)
# IO.puts Enum.each(list, &(IO.puts &1))
