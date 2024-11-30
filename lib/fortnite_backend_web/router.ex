defmodule FortniteBackendWeb.Router do
  use FortniteBackendWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, html: {FortniteBackendWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", FortniteBackendWeb do
    pipe_through :browser

    get "/", PageController, :home
  end

scope "/fortnite/api", FortniteBackendWeb do
  pipe_through :api

  get "/calendar/v1/timeline", TimelineController, :timeline
end

scope "/datarouter/api/v1/public", FortniteBackendWeb do
  pipe_through :api

  post "/data", DataController, :create
end

scope "/lightswitch/api/service", FortniteBackendWeb do
  pipe_through :api

  get "/status", StatusController, :fortnite_status
  get "/bulk/status", StatusController, :bulk_status
end


scope "/", FortniteBackendWeb do
  pipe_through :api

  post "/fortnite/api/game/v2/tryPlayOnPlatform/account/:accountId", FortniteController, :try_play_on_platform
  get "/account/api/public/account/:accountId/externalAuths", AccountController, :external_auths
  get "/fortnite/api/game/v2/enabled_features", FortniteController, :enabled_features
  get "/content-controls/:accountId", AccountController, :content_controls
  get "/account/api/public/account", AccountController, :account
  get "/account/api/public/account/:accountId", AccountController, :account_details
  post "/api/v1/user/setting", UserController, :update_settings
  get "/socialban/api/public/v1/:accountId", FortniteController, :social_ban
  get "/presence/api/v1/_/:accountId/settings/subscriptions", FortniteController, :subscriptions
  get "/fortnite/api/game/v2/privacy/account/:accountId", FortniteController, :privacy_settings
end

scope "/account/api/oauth", FortniteBackendWeb do
  pipe_through :api

  post "/token", OAuthController, :token
  post "/verify", OAuthController, :verify
  delete "/sessions/kill", OAuthController, :kill_sessions
  delete "/sessions/kill/:token", OAuthController, :kill_session_by_token
end

scope "/fortnite/api/cloudstorage", FortniteBackendWeb do
  pipe_through :api

  get "/system", CloudStorageController, :system_status
  get "/user/:accountId", CloudStorageController, :user_status
  put "/user/:accountId/:fileName", CloudStorageController, :upload_file
end

scope "/content/api/pages", FortniteBackendWeb do
  pipe_through :api

  get "/fortnite-game", ContentController, :fortnite_game
end

scope "/fortnite/api/storefront/v2", FortniteBackendWeb do
  pipe_through :api

  get "/keychain", StorefrontController, :keychain
end

scope "/fortnite/api/game/v2", FortniteBackendWeb do
    pipe_through :api

    post "/profile/:accountId/client/:operation", ProfileController, :queryprofile
  end

scope "/fortnite/api/v2", FortniteBackendWeb do
  pipe_through :api

  get "/versioncheck", FortniteController, :version_check
  get "/versioncheck/:version", FortniteController, :version_check_with_version
end




scope "/waitingroom/api", FortniteBackendWeb do
  get "/waitingroom", WaitingRoomController, :waiting_room
end

  # Other scopes may use custom stacks.
  # scope "/api", FortniteBackendWeb do
  #   pipe_through :api
  # end

  # Enable LiveDashboard and Swoosh mailbox preview in development
  if Application.compile_env(:fortnite_backend, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: FortniteBackendWeb.Telemetry
      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
