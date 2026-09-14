require "test_helper"

module Api
  module V1
    class SystemControllerTest < ActionDispatch::IntegrationTest
      test "returns the public API status envelope" do
        get "/api/v1/system"

        assert_response :success
        assert_equal "application/json", response.media_type

        body = response.parsed_body
        assert_equal "lifegraph-api", body.dig("data", "id")
        assert_equal "ok", body.dig("data", "attributes", "status")
        assert_equal request.request_id, body.dig("meta", "request_id")
      end
    end
  end
end
