# README

**A day at a coffee shop!**

This is a backend api service ordering system (guest checkout) for coffee shop.

## Flow of the ordering system
- User can view a list of bundle menu item (discounted items) or ala carte menu item.
- User can add aforementioned items into a order cart. User can also update/delete their order items in their cart
- User can view summary of their order cart & proceed to make payment.
- Once payment is made, user will be notified of the order when it is ready

## Note
- Ensure `sidekiq` & `redis` is running for order notification feature to be enabled.
- Postman collection of the avaialble REST api endpoint is included in `postman` folder.

## Other Resources
- ERD diagram: https://dbdiagram.io/d/6370a155c9abfc61117238ac
