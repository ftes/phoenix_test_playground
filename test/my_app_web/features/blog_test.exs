defmodule MyAppWeb.Features.BlogTest do
  alias MyApp.Blog
  use MyAppWeb.ConnCase, async: true
  import PhoenixTest

  describe "progressive enhancement of inputs via JS hooks" do
    test "vanilla PhoenixTest input functions" do
      build_conn()
      |> visit(~p"/posts/new")
      |> fill_in("Title", with: "Hey!")
      |> select("Category", option: "sports", exact: false)
      |> select("Tags", option: "one", exact: false)
      |> select("Tags", option: "two", exact: false)
      |> fill_in("Price", with: monetary("42.42"))
      |> fill_in("Body", with: "Quill delta")
      |> submit()

      assert [post] = Blog.list_posts()
      assert post.title == "Hey!"
      assert post.category == :sports
      assert post.tags == ~w(one two)
      assert post.price == 4242
      assert post.body == "Quill delta"
    end
  end

  defp monetary(string) do
    round(String.to_float(string) * 100)
  end
end
