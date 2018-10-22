module API
  module Private
    class Core < Grape::API
      prefix "api/private"
      mount API::Private::V1::Base
    end
  end
end
