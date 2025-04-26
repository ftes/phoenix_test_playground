defmodule MyAppWeb.Features.BlogTest do
  use MyAppWeb.ConnCase, async: true
  import PhoenixTest

  describe "tom-select" do
    test "single select with static data handled like vanilla select" do
      build_conn()
      |> visit(~p"/posts/new")
      |> fill_in("Title", with: "Hey!")
      |> select("Category", option: "sports", exact: false)
      |> select("Tags", option: "one", exact: false)
      |> select("Tags", option: "two", exact: false)
      |> fill_in("Body", with: "Quill delta")
      |> submit()
    end
  end
end
