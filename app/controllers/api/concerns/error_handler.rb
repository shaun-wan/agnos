module Api
  module Concerns
    module ErrorHandler
      def render_error(message, status = :bad_request)
        render json: { error: { message: message } }, status: status
      end
    end
  end
end
