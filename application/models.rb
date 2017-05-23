# frozen_string_literal: true

module Application
  module Models
    class Base
      def db
        @db ||= Firebase::Client.new(Config::DB_URI)
      end

      def find(id)
        db.get("/#{@@node_name}/#{id}")
      end

      def create(id, data)
        db.set("/#{@@node_name}/#{id}", data)
      end

      def update(id, data)
        db.update("/#{@@node_name}/#{id}", data)
      end

      class << self
        protected

        def node(node_name)
          @@node_name = node_name
        end
      end
    end
  end
end
