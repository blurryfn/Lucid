defmodule FortniteBackendWeb.WaitingRoomController do
  use FortniteBackendWeb, :controller

  def waiting_room(conn, _params) do
    conn
    |> put_status(:no_content) 
    |> json([]) 
  end
end
