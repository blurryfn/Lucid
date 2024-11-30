defmodule FortniteBackendWeb.PageController do
  use FortniteBackendWeb, :controller

  def home(conn, _params) do
   
    render(conn, :home, layout: false)
  end
end
