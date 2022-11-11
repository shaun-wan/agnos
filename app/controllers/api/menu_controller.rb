module Api
  class MenuController < Api::ApiController
    def show
      category = Category.find(params[:category_id])

      items = MenuItem.where(category: category, available: true)

      render json: items
    end
  end
end
