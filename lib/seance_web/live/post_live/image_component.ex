defmodule SeanceWeb.PostLive.ImageComponent do
  use SeanceWeb, :live_component

  @impl true
  def render(assigns) do
    ~L"""
    <div class="image-component">
      <button type="button" class="close" aria-label="Close" phx-target="<%= @myself %>" phx-click="delete">
        <span aria-hidden="true">&times;</span>
      </button>
    <div>
    <%= img_tag @thumb_url %> 
    <div>
    <small>from <%= @source %></small>
    </div>
    """
  end

  @impl true
  def handle_event("delete", _params, socket) do
    # Delete the image from imgur
    send(self(), {:delete, socket.assigns.index})
    {:noreply, socket}
  end
end
