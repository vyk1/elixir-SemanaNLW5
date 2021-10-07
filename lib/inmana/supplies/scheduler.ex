# GenServer
# um exemplo de Cron
defmodule Inmana.Supplies.Scheduler do
  use GenServer

  alias Inmana.Supplies.ExpirationNotification

  # iniciando o gs através do genserver
  # só executando o gs.start_link já roda a app
  # instanciando o CLIENT

  def start_link(_state) do
    GenServer.start_link(__MODULE__, %{})
  end

  # \\ é default
  # behavior
  # instanciando o SERVER
  @impl true
  def init(state \\ %{}) do
    schedule_notification()
    {:ok, state}
  end

  # recebe qualquer tipo de msg
  # behavior
  @impl true
  def handle_info(:generate, state) do
    ExpirationNotification.send()

    schedule_notification()

    IO.puts("RECEIVED")
    {:noreply, state}
  end

  defp schedule_notification do
    # manda depois de 10s
    Process.send_after(self(), :generate, 1000 * 10)
    # 1000 * 10 * 60 * 60 * 24 * 7
  end

  # # async
  # def handle_cast({:put, key, value}, state) do
  #   {:noreply, Map.put(state, key, value)}
  # end

  # # sync
  # def handle_call({:get, key}, _from, state) do
  #   {:reply, Map.get(state, key), state}
  # end
end

# para o handle_cast e handle_call
# {:ok, pid} = GenServer.start(Inmana.Supplies.Scheduler, %{})
# Genserver.cast(pid, {:put, :a, 6})
# Genserver.call(pid, {:get, :a})

# para o handle_info
# {:ok, pid} = GenServer.start(Inmana.Supplies.Scheduler, %{})
# send("banana", pid)
