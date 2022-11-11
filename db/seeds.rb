# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
unless Rails.env.production?
  puts 'Seeding database....'

  category_names = %w[Sandwiches Beverages]

  category_names.map { |category| { name: category } }

  categories = Category.create(category_names.map { |category_name| { name: category_name } })

  menu_items = [
    { name: 'Tuna Sandwich', description: 'This tuna sandwich is fresh', price_cents: 250,
      tax_rate_percentage: 5, category: categories.first },
    { name: 'Turkey Sandwich', description: 'Delicious', price_cents: 300,
      tax_rate_percentage: 5, category: categories.first },
    { name: 'Coffee', description: 'Nice for cold weather', price_cents: 100,
      tax_rate_percentage: 5, category: categories.last },
    { name: 'Hot Chocolate', description: 'Made with real cocoa', price_cents: 150,
      tax_rate_percentage: 5, category: categories.last }
  ]

  MenuItem.create(menu_items)

  puts 'Done.'
end
