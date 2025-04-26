defmodule MyApp.Blog.Post do
  use Ecto.Schema
  import Ecto.Changeset

  schema "posts" do
    field :title, :string
    field :category, Ecto.Enum, values: [:sports, :movies]
    field :tags, {:array, :string}
    field :price, :integer
    field :body, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:title, :category, :tags, :price, :body])
    |> validate_required([:title, :category])
  end
end
