{:ok, body} = File.read("input.txt")

lines = String.split(body, "\n")

{first_list, second_list} =
  Enum.reduce(lines, {[], []}, fn entry, {first_list, second_list} ->
    [first, second] = String.split(entry) |> Enum.map(&String.to_integer/1)
    {first_list ++ [first], second_list ++ [second]}
  end)

first_list_sorted = Enum.sort(first_list)
second_list_sorted = Enum.sort(second_list)

pairs = Enum.zip(first_list_sorted, second_list_sorted)

sum_of_differences =
  Enum.reduce(pairs, 0, fn {first, second}, acc ->
    result = acc + abs(first - second)
    result
  end)

IO.inspect(sum_of_differences)
