defmodule FortniteBackendWeb.DataController do
  use FortniteBackendWeb, :controller

  def create(conn, _params) do
    conn
    |> put_status(:ok)
    |> json(%{status: "OK", code: 200})
  end
end
