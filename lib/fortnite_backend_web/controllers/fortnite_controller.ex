defmodule FortniteBackendWeb.FortniteController do
  use FortniteBackendWeb, :controller


  def version_check(conn, _params) do
    response = %{
      type: "NO_UPDATE"
    }

    conn
    |> json(response)
  end


  def version_check_with_version(conn, %{"version" => _version}) do
    response = %{
      type: "NO_UPDATE"
    }

    conn
    |> json(response)
  end

   def subscriptions(conn, %{"accountId" => _account_id}) do
    conn
    |> json([])
  end

  def social_ban(conn, %{"accountId" => _account_id}) do
    conn
    |> json([])
  end


  def try_play_on_platform(conn, %{"accountId" => _account_id}) do
    conn
    |> put_resp_content_type("text/plain")
    |> send_resp(:ok, "true")
  end

  def enabled_features(conn, _params) do
    conn
    |> json([])
  end

  def privacy_settings(conn, %{"accountId" => _account_id}) do
    conn
    |> json([])
  end


def timeline(conn, _params) do
  response = %{
    channels: %{
      "client-matchmaking" => %{
        states: [],
        cacheExpire: "9999-01-01T00:00:00.000Z"
      },
      "client-events" => %{
        states: [
          %{
            validFrom: "0001-01-01T00:00:00.000Z",
            activeEvents: [],
            state: %{
              activeStorefronts: [],
              eventNamedWeights: %{},
              seasonNumber: 6.00,
              seasonTemplateId: "AthenaSeason:athenaseason6",
              matchXpBonusPoints: 0,
              seasonBegin: "2020-01-01T00:00:00Z",
              seasonEnd: "9999-01-01T00:00:00Z",
              seasonDisplayedEnd: "9999-01-01T00:00:00Z",
              weeklyStoreEnd: "9999-01-01T00:00:00Z",
              stwEventStoreEnd: "9999-01-01T00:00:00.000Z",
              stwWeeklyStoreEnd: "9999-01-01T00:00:00.000Z",
              sectionStoreEnds: %{
                "Featured" => "9999-01-01T00:00:00.000Z"
              },
              dailyStoreEnd: "9999-01-01T00:00:00Z"
            }
          }
        ],
        cacheExpire: "9999-01-01T00:00:00.000Z"
      }
    },
    eventsTimeOffsetHrs: 0,
    cacheIntervalMins: 10,
    currentTime: DateTime.utc_now() |> DateTime.to_iso8601()
  }

  conn
  |> put_status(:ok)
  |> json(response)
  end
end
