module Api
  class ApiController < ApplicationController
    include Api::Concerns::ErrorHandler
  end
end
