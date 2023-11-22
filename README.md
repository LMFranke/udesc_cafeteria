# Udesc Cafeteria

Project to UDESC

This project is not fully functional due to the fact that it does not use a cloud database like Firebase, I chose to do something locally as it was supposed to be something simple, just for a university project.

## About

This project is my first project on Flutter, I did it for a project for my higher education course.

## What did I used

## Dependencies
<details>
     <summary> Click to expand </summary>
     
* google_nav_bar
* provider
* drift
* sqlite3_flutter_libs
* path_provider
* path
* intl
* shared_preferences
     
</details>


## For what I used it

* The 'google_nav_bar' I used it to navigate between the menu screen and the requests screen;

* The 'provider', 'path', 'path_provider' I used it to update the screen whenever there was a change;

* The 'sqlite3_flutter_libs', 'drift' I used it to be the local database;

* The 'shared_preferences' I used it to save the user's configs;


## Screenshots

Login page                 |  Signup Page               
:-------------------------:|:-------------------------:
![](https://github.com/LMFranke/udesc_v2/blob/master/screenshots/user_screen/login_screen.jpg)|![](https://github.com/LMFranke/udesc_v2/blob/master/screenshots/user_screen/sign_up_screen.jpg)|

User shop page           |  User cart Page         |  Drawer 
:-----------------------:|:-----------------------:|:-------------------------:|
![](https://github.com/LMFranke/udesc_v2/blob/master/screenshots/user_screen/user_shop_screen.jpg)|![](https://github.com/LMFranke/udesc_v2/blob/master/screenshots/user_screen/user_cart_screen.jpg)|![](https://github.com/LMFranke/udesc_v2/blob/master/screenshots/user_screen/drawer_screen.jpg)|

Adm shop preview page      |  Adm requests page
:-------------------------:|:-------------------------:|
![](https://github.com/LMFranke/udesc_v2/blob/master/screenshots/adm_screen/adm_shop_screen.jpg)|![](https://github.com/LMFranke/udesc_v2/blob/master/screenshots/adm_screen/adm_requests_screen.jpg)|

Adm edit item page         |  Adm add item page
:-------------------------:|:-------------------------:|
![](https://github.com/LMFranke/udesc_v2/blob/master/screenshots/adm_screen/adm_alert_dialog_edit_item.jpg)|![](https://github.com/LMFranke/udesc_v2/blob/master/screenshots/adm_screen/adm_add_item_screen.jpg)|

## Directory Structure
```
lib
│───main.dart
|
│───model
│    │──alert_dialog_confirm_item.dart
|    │──alert_dialog_edit_item.dart
|    │──alert_dialog_preview_item.dart
|    │──bottom_nav_bar.dart
|    │──cart_item.dart
|    │──request_item.dart
|    │──shop_tem.dart
|    └──shop_item_preview.dart
│───database
│    │──database.dart
|    └──database.g.dart
│───model
│    │──item.dart
|    │──person.dart
|    │──request_item.dart
|    └──user_request_item.dart
│───pages
|    │──adm_page
|    |   |──add_item_page.dart
|    |   |──adm_items_pages.dart
|    |   |──adm_page.dart
|    |   └──adm_requests_page.dart
|    │──auth_page
|    |   |──login_page.dart
|    |   └──signup_page.dart
|    └──home_page
|        |──cart_page.dart
|        |──home_page.dart
|        └──shop_page.dart
│───provider
|    └──provider.dart
└───storage
     └──shared_preference.dart
```

