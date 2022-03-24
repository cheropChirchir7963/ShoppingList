defmodule ShoppingList do
    use GenServer

    def start_link() do
        GenServer.start_link(__MODULE__, [])
    end

    def add(pid, item) do
        GenServer.cast(pid, item)
    end

    def handle_cast(item, list) do
        updated_list = [item|list]
        {:noreply, updated_list}
    end

    def init(list) do
        {:ok, list}
    end
end