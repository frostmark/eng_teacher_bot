# frozen_string_literal: true

module Application
  class Models::User < Models::Base
    def create(data)
      db.set('/users', data)
    end

    def find(id)
      db.get("/users/#{id}")
    end

    def update(id, data)
      db.update("/users/#{id}", data)
    end
  end
end
