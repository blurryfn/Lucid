defmodule FortniteBackendWeb.OAuthController do
  use FortniteBackendWeb, :controller

  def token(conn, _params) do
    response = %{
      access_token: "eg1~fortnite",
      expires_in: 28_800,
      expires_at: "9999-12-02T01:12:01.100Z",
      token_type: "bearer",
      refresh_token: "eg1~fortnite",
      refresh_expires: 86_400,
      refresh_expires_at: "9999-12-02T01:12:01.100Z",
      account_id: "fornite",
      client_id: "fornite",
      internal_client: true,
      client_service: "fortnite",
      displayName: "fornite",
      app: "fortnite",
      in_app_id: "fornite",
      device_id: "fornite"
    }

    conn
    |> json(response)
  end

  def verify(conn, _params) do
    response = %{
      access_token: "eg1~fortnite",
      expires_in: 28_800,
      expires_at: "9999-12-02T01:12:01.100Z",
      token_type: "bearer",
      refresh_token: "eg1~fortnite",
      refresh_expires: 86_400,
      refresh_expires_at: "9999-12-02T01:12:01.100Z",
      account_id: "fornite",
      client_id: "fornite",
      internal_client: true,
      client_service: "fortnite",
      displayName: "fornite",
      app: "fortnite",
      in_app_id: "fornite",
      device_id: "fornite"
    }

    conn
    |> json(response)
  end

  def kill_sessions(conn, _params) do
    response = %{
      status: "OK",
      code: 200
    }

    conn
    |> json(response)
  end

  def kill_session_by_token(conn, _params) do
    response = %{
      status: "OK",
      code: 200
    }

    conn
    |> json(response)
  end
end
