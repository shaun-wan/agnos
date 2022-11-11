module Api
  class CategoriesController < Api::ApiController
    def index
      categories = Category.all

      render json: categories
    end
  end
end
