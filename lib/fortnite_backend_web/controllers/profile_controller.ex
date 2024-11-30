defmodule FortniteBackendWeb.ProfileController do
  use FortniteBackendWeb, :controller
  require Logger

  def queryprofile(conn, %{"profileId" => profile_id} = params) do
    IO.inspect(params, label: "Params:")

    profile_path = "C:\\Users\\charleslb10000\\Downloads\\New folder\\backedn elixir\\fortnite_backend\\assets\\profiles\\profile_#{profile_id}.json"

    case File.read(profile_path) do
      {:ok, file_content} ->
        case Jason.decode(file_content) do
          {:ok, profile_data} ->
            response = %{
              profileRevision: 1113,
              profileId: profile_id,
              profileChangesBaseRevision: 1,
              profileChanges: [
                %{
                  changeType: "fullProfileUpdate",
                  profile: Map.put(profile_data, "updated", DateTime.utc_now() |> DateTime.to_iso8601())
                }
              ],
              profileCommandRevision: 1,
              serverTime: DateTime.utc_now()
              |> DateTime.truncate(:second)
              |> DateTime.to_iso8601(),
              responseVersion: 1
            }

            conn
            |> json(response)

          {:error, _} ->
            conn
            |> send_resp(500, "Error decoding JSON file")
        end

      {:error, _} ->
        conn
        |> send_resp(404, "Profile not found")
    end
  end
end
