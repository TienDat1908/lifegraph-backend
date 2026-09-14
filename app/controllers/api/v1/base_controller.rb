module Api
  module V1
    class BaseController < ApplicationController
      private

      def render_error(code:, message:, status:, details: nil)
        error = { code: code, message: message }
        error[:details] = details if details.present?

        render json: {
          error: error,
          meta: { request_id: request.request_id }
        }, status: status
      end
    end
  end
end
