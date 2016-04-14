module Cache
  module Comment
    extend ActiveSupport::Concern

    module ClassMethods
      def cache_key_max_created_at
        Rails.cache.fetch([name, :max_created_at]) do
          [name, :max_created_at, maximum(:created_at).to_i]
        end
      end

      def flush_max_created_at
        Rails.cache.delete [name, :max_created_at]
      end
    end

    included do
      after_create do
        self.class.flush_max_created_at
      end
    end
  end
end
