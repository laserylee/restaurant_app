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
	* admin?
	* activated?
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
  * category
  * picture
	* price
	* availability
		* string, will specify here when lack of stock
3. Order
	* id
  * confirmation_digest
	* order_list --> order_details
	* order_time
	* pickup time
	* picked_up?
4. Order_details
	* item id
  * quantity
	* price

# Controllers
1. Static_pages
	* Home
	* About
	* Help
	* Contact
	* AdminPanel
2. Users
	* new
	* create
	* show
	* edit
	* update
	* destroy
	* index -- only admin
3. Sessions
	* new
	* create
	* destroy
4. Orders
	* new -- to view cart and double confirm
	* create
	* show
	* index --only admin
5. Account_activation
	* edit -- link from email
6. Password_resets
	* new -- request page, confirmation through email or phone
	* create -- send token
	* edit -- get token, new pwd and confirm pwd
	* update -- patch
7. Email_resets
	* new -- request page which require confirm old email and pwd, then new email
	* create -- send token
	* edit -- get token and verify
	* update --patch
8. Phone_resets
  * new -- request page which require old phone number, new phone number, and pwd
  * create -- send token
  * edit -- get token and verify
  * update
9. Items -- views in admin panel
	* create
	* update
	* destroy

Next-Plan
  * partials of orders sorted in diff ways, best with ajax
  * manipulation of order status
