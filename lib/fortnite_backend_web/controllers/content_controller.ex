defmodule FortniteBackendWeb.ContentController do
  use FortniteBackendWeb, :controller

  
  def fortnite_game(conn, _params) do
    file_path = "C:\\Users\\charleslb10000\\Downloads\\New folder\\backedn elixir\\fortnite_backend\\assets\\contentpages.json"

    if File.exists?(file_path) do
      case File.read(file_path) do
        {:ok, content} ->
          case Jason.decode(content) do
            {:ok, contentpages} ->
              json(conn, contentpages)

            {:error, _reason} ->
              conn
              |> put_status(:internal_server_error)
              |> json(%{error: "Invalid JSON format in contentpages.json"})
          end

        {:error, reason} ->
          conn
          |> put_status(:internal_server_error)
          |> json(%{error: "Error reading contentpages.json: #{inspect(reason)}"})
      end
    else
      conn
      |> put_status(:not_found)
      |> json(%{error: "contentpages.json not found"})
    end
  end
end