defmodule App.Repo.Migrations.CreatePosts do
  use Ecto.Migration

  def change do
    create table(:posts) do
      add(:body, :string)
      add(:word_count, :integer)
      add(:ovni, :boolean, default: false, null: false)

      timestamps()
    end
  end
end
