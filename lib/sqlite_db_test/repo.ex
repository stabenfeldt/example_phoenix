defmodule SqliteDbTest.Repo do
  use Ecto.Repo,
    otp_app: :sqlite_db_test,
    adapter: Ecto.Adapters.SQLite3
end
