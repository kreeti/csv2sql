defmodule DashboardWeb.LiveHelpers do
  # import Phoenix.LiveView
  # import Phoenix.LiveView.Helpers
  # alias Phoenix.LiveView.JS

  def get_nav_item_attrs(%{page: page}, curr_page) when page == curr_page,
    do: %{class: "nav-link active", "aria-current": "page"}

  def get_nav_item_attrs(_assigns, _curr_page), do: %{class: "nav-link bg-light-grey"}
end
