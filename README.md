# README

A day at a coffee shop!

This is a backend api service ordering system for coffee shop.

## Flow of the ordering system
- User can view a list of bundle menu item or ala carte menu item.
- User can add aforementioned items into a order cart. User can also update/delete their order items in their cart
- User can make payment for their order cart.
- Once payment is made, user will be notified of the order when it is ready

## Note
Ensure `sidekiq` & `redis` is running for order notification feature to be enabled.
