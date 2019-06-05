# Project Background
We are a restaurant, selling fast food, e.g. Burger, Fried Chicken, French Fries, and any items you can find in McDonald. We decided to move out business to online. We want out customer able to order the food online and collect from us. 

In this app, we will have 2 kind of users, which is customer and admin. 

## Customer
 - Can see all the food listing (with / without sign in)
 - Can select the food type and quantity, and add to cart 
 - Can order the food. (with signin only)
 - When order the food, user need to choose the time for them to pickup the food.
 - Can see their order details (with signin only)

## Admin
 - Can add new food
 - Can edit price of the food
 - Can check user order details

# Project Expectation
 1. Admin Panel
	- To add/edit food listing
	- To view user order
 2. User Interface
	- Food Listing
	- Food Detail
 3. Sign Up / Sign In
 4. User dashboard
	- Check order detail
	- Check order history

# Models
	
1. User
	* id
	* admin
	* activated
	* name
	* email
		* optional, notify customer inside page, for ads spam emais
	* hp_no
		* activate using sms, if cant use email to activate
		* will sms 5 min before pickup_time as reminder
		* will sms if food havent get picked up after 5 min
	* created_at
	* order_history --> order_id
2. Item
	* id
	* name
	* description
	* price
	* availability
		* string, will specify here when lack of stock
3. Order
	* id
	* order_list --> order_details
	* order_at
	* pickup time
	* picked_up
4. Order_details
	* item id
	* price

# Controllers
1. Static_pages
	* Home
	* About
	* Help
	* Contact
2. Users
	* new
	* create
	* show
	* edit
	* update
	* destroy
3. Sessions
4. Orders