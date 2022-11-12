module Api
  class MenuController < Api::ApiController
    def show
      category = Category.find(params[:category_id])

      items = MenuItem.where(category: category, available: true)

      render json: MenuItemBlueprint.render(items)
    end

    def bundle_menu
      bundle_items = BundleItem.includes(:first_menu_item, :second_menu_item).all

      render json: BundleItemBlueprint.render(bundle_items)
    end
  end
end
