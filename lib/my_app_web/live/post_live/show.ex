defmodule MyAppWeb.PostLive.Show do
  use MyAppWeb, :live_view

  alias MyApp.Blog

  @impl true
  def render(assigns) do
    ~H"""
    <Layouts.app flash={@flash}>
      <.header>
        Post {@post.id}
        <:subtitle>This is a post record from your database.</:subtitle>
        <:actions>
          <.button navigate={~p"/posts"}>
            <.icon name="hero-arrow-left" />
          </.button>
          <.button variant="primary" navigate={~p"/posts/#{@post}/edit?return_to=show"}>
            <.icon name="hero-pencil-square" /> Edit post
          </.button>
        </:actions>
      </.header>

      <.list>
        <:item title="Title">{@post.title}</:item>
        <:item title="Category">{@post.category}</:item>
      </.list>
    </Layouts.app>
    """
  end

  @impl true
  def mount(%{"id" => id}, _session, socket) do
    {:ok,
     socket
     |> assign(:page_title, "Show Post")
     |> assign(:post, Blog.get_post!(id))}
  end
end
