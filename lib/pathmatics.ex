defmodule Pathmatics do
  alias Pathmatics.DuplicateInspector

  defdelegate inspect_duplicate(), to: DuplicateInspector
end
