defmodule Novistore.Repo.Migrations.Setup do
  use Ecto.Migration

  def change do
    create table(:products) do
      add :title, :string
      add :description, :string
      add :price, :integer
      timestamps()
    end

    create table(:reviews) do
      add :title, :string
      add :body, :text
      add :email, :string
      add :product_id, references(:products)
      timestamps()
    end
  end
end
