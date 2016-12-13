defmodule Acronym do
  @doc """
  Generate an acronym from a string.
  "This is a string" => "TIAS"
  """
  @spec abbreviate(String.t()) :: String.t()
  def abbreviate(string), do: abbreviate(string |> String.codepoints, "", true)
  def abbreviate([], result, _primed), do: result
  def abbreviate([head | tail], result, primed) do
    cond do
      primed && head =~ ~r/\p{L}/ ->
        abbreviate(tail, result <> String.upcase(head), false)
      head =~ ~r/[ _-]/ ->
        abbreviate(tail, result, true)
      head =~ ~r/\p{Lu}/ ->
        abbreviate(tail, result <> head, false)
      true ->
        abbreviate(tail, result, false)
    end
  end
end
