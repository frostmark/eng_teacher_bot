module Application
  module Models
    class User < Base
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
end
