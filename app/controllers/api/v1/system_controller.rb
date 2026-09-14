module Api
  module V1
    class SystemController < BaseController
      def show
        render json: {
          data: {
            type: "system",
            id: "lifegraph-api",
            attributes: {
              name: "LifeGraph API",
              status: "ok",
              api_version: "v1"
            }
          },
          meta: { request_id: request.request_id }
        }
      end
    end
  end
end
