defmodule SpajzaWeb.ItemJSON do
  alias Spajza.Items.Item

  @doc """
  Renders a list of items.
  """
  def index(%{items: items}) do
    %{data: for(item <- items, do: data(item))}
  end

  @doc """
  Renders a single item.
  """
  def show(%{item: item}) do
    %{data: data(item)}
  end

  defp data(%Item{} = item) do
    %{
      id: item.id,
      name: item.name,
      remarks: item.remarks,
      picture_url: item.picture_url,
      status: item.status,
      disabled: item.disabled
    }
  end
end
