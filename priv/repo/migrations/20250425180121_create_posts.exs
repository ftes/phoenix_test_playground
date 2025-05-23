defmodule MyApp.Repo.Migrations.CreatePosts do
  use Ecto.Migration

  def change do
    create table(:posts) do
      add :title, :string
      add :category, :string
      add :tags, {:array, :string}
      add :price, :integer
      add :body, :binary

      timestamps(type: :utc_datetime)
    end
  end
end
