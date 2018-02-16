defmodule Pathmatics.DuplicateInspector do
	@docs_path Path.expand("../../", __DIR__)
	
	def inspect_duplicate() do
		read_contents
		|> binary_to_list
		|> advertiser_exists
	end

	@doc """
	Read txt file from current module path and return binary from contents of file
	"""
	@spec read_contents() :: binary
	def read_contents() do
		{:ok, names } = @docs_path
			|> Path.join("test.txt")
			|> File.read
			names
	end

	@doc """
	Convert binary to List
	"""
	@spec binary_to_list(binary) :: list
	def binary_to_list(binary) do
		binary
		|> String.split("\n") # Separate by carriage return.
	end

	@doc """
	Find duplicate advertiser name in the list
	"""
	@spec advertiser_exists(list) :: String.t
	def advertiser_exists(list_of_advertiser) do
		case results = list_of_advertiser -- (list_of_advertiser |> Enum.uniq) do
			[] -> IO.puts "No Duplicate Found"
			_  -> Enum.map(results, fn(x) -> IO.puts "Your name #{x} might be exists.." end)
		end
	end
end