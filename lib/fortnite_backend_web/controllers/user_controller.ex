defmodule FortniteBackendWeb.UserController do
  use FortniteBackendWeb, :controller

  def update_settings(conn, _params) do
    response = %{status: "OK", code: 200}

    conn
    |> json(response)
  end
end
