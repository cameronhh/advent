{:ok, body} = File.read("input.txt")

lines = String.split(body, "\n")

{first_list, second_list} =
  Enum.reduce(lines, {[], []}, fn entry, {first_list, second_list} ->
    [first, second] = String.split(entry) |> Enum.map(&String.to_integer/1)
    {first_list ++ [first], second_list ++ [second]}
  end)

sum_of_similarity_scores =
  Enum.reduce(first_list, 0, fn first, acc ->
    acc + first * Enum.count(second_list, fn item -> first == item end)
  end)

IO.inspect(sum_of_similarity_scores)
