defmodule Newapp.Comment do
  use Newapp.Web, :model

  schema "comments" do
    field :body, :string
    belongs_to :post, Newapp.Post, foreign_key: :post_id

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:body])
    |> validate_required([:body])
  end
end
