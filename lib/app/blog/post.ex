defmodule App.Blog.Post do
  use Ecto.Schema
  import Ecto.Changeset


  schema "posts" do
    field :body, :string
    field :ovni, :boolean, default: false
    field :word_count, :integer

    timestamps()
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:body, :word_count, :ovni])
    |> validate_required([:body, :word_count, :ovni])
  end
end
