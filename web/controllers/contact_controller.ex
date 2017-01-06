defmodule AballcPhoenix.ContactController do
    use AballcPhoenix.Web, :controller

    def index(conn, _params) do
        contacts = Repo.all(AballcPhoenix.Contact)
        json(conn, contacts)
    end
end
