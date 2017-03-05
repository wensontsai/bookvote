defmodule Bookvote.VoteController do
  use Bookvote.Web, :controller

  alias Bookvote.Vote

  def index(conn, _params) do
    votes = Repo.all(Vote)
    render(conn, "index.json", votes: votes)
  end

  def create(conn, %{"vote" => vote_params}) do
    changeset = Vote.changeset(%Vote{}, vote_params)

    case Repo.insert(changeset) do
      {:ok, vote} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", vote_path(conn, :show, vote))
        |> render("show.json", vote: vote)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Bookvote.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    vote = Repo.get!(Vote, id)
    render(conn, "show.json", vote: vote)
  end

  def update(conn, %{"id" => id, "vote" => vote_params}) do
    vote = Repo.get!(Vote, id)
    changeset = Vote.changeset(vote, vote_params)

    case Repo.update(changeset) do
      {:ok, vote} ->
        render(conn, "show.json", vote: vote)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Bookvote.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    vote = Repo.get!(Vote, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(vote)

    send_resp(conn, :no_content, "")
  end
end
