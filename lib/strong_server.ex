defmodule MyRouter do
  use Plug.Router

  plug(:match)
  plug(:dispatch)

  match _ do
    data =
      DataFetcher.fetch_data()
      |> CsvParser.parse()
      |> Workout.get_last_workout()
      |> Enum.map(&Workout.to_workout_detail/1)
      |> Workout.to_workout_data()
      |> Jason.encode!()
      |> Jason.decode!()

    html = Vaux.render!(Component, data)

    send_resp(conn, 200, html)
  end
end

defmodule StrongServer.Application do
  use Application

  def start(_type, _args) do
    children = [
      {Bandit, plug: MyRouter, port: 4000}
    ]

    opts = [strategy: :one_for_all, name: MyApp.Supervisor]
    IO.puts("Started server")
    Supervisor.start_link(children, opts)
  end
end
