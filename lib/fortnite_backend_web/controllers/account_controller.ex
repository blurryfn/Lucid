defmodule FortniteBackendWeb.AccountController do
  use FortniteBackendWeb, :controller

  def external_auths(conn, %{"accountId" => _account_id}) do
    conn
    |> json([])
  end

  def content_controls(conn, %{"accountId" => _account_id}) do
    conn
    |> json([])
  end

  def account(conn, _params) do
    response = [%{
      id: "fortnite",
      displayName: "fortnite",
      externalAuth: %{}
    }]

    conn
    |> json(response)
  end

  def account_details(conn, %{"accountId" => _account_id}) do
    conn
    |> put_status(200)
    |> json(%{
      id: "fortnite",
      displayName: "fortnite",
      externalAuths: %{}
    })
  end
end
