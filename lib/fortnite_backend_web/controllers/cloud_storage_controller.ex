defmodule FortniteBackendWeb.CloudStorageController do
  use FortniteBackendWeb, :controller

  def system_status(conn, _params) do
    response = %{
      status: "OK",
      code: 200
    }

    conn
    |> json(response)
  end

 
  def user_status(conn, %{"accountId" => _account_id}) do
    response = %{
      status: "OK",
      code: 200
    }

    conn
    |> json(response)
  end

  
  def upload_file(conn, %{"accountId" => _account_id, "fileName" => _file_name}) do
    response = %{
      status: "OK",
      code: 200
    }

    conn
    |> json(response)
  end
end
