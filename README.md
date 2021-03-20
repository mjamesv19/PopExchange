# README test
## Identification of the problem you are trying to solve by building this particular marketplace app.

Pops are collectable figures and only a limited amount of each one is ever made. this can make it very difficult to find a specific figure and fill out sets.

## Why is it a problem that needs solving?
This need sto be solved because there are people trying to finish their collections and no way of tracking down figures. Also onces they are sold out buying it from someone else is the only way to get it.

## A link to deployed app.
https://dashboard.heroku.com/apps/sheltered-everglades-77378
Image upload works locally but not on heroku
localhost
![localCapture](https://user-images.githubusercontent.com/72952429/111863681-c8b8d700-89a8-11eb-9cfa-2407df7f2b3f.JPG)

heroku
![onlinehostcapture](https://user-images.githubusercontent.com/72952429/111863744-19303480-89a9-11eb-87f7-7454561b59c5.JPG)



## A link to GitHub repository.
https://github.com/mjamesv19/PopExchange

## Description of marketplace app 
- Purpose
To enable collectors to hunt down the missing parts of their collections onces figures are no longer available 
- Functionality / features
Full crud functionally as well as stripe implementation from purchasing.
users can create, read, update, and delete their own listings while only being able to read and BUY listings from other users.
- Sitemap
![sitemap](https://user-images.githubusercontent.com/72952429/111864177-3cf47a00-89ab-11eb-9a84-a148c0c16224.JPG)
- Screenshots
![homepage](https://user-images.githubusercontent.com/72952429/111865151-19343280-89b1-11eb-813c-6e05a4e8e59b.jpg)
![borwselistings](https://user-images.githubusercontent.com/72952429/111865156-1cc7b980-89b1-11eb-8fe5-4e434b0afe29.JPG)
![showlistingmadebycurrentuser](https://user-images.githubusercontent.com/72952429/111865158-1df8e680-89b1-11eb-9390-724e0b04d656.JPG)
![showlistingmadebyotheruser](https://user-images.githubusercontent.com/72952429/111865160-1f2a1380-89b1-11eb-9c14-0774f71096a1.JPG)
![orderpage](https://user-images.githubusercontent.com/72952429/111865167-23eec780-89b1-11eb-8b82-89ed7a38a808.JPG)
![stripe](https://user-images.githubusercontent.com/72952429/111865171-26e9b800-89b1-11eb-92a4-b28e60effde9.JPG)
![createlisttingpage](https://user-images.githubusercontent.com/72952429/111865175-28b37b80-89b1-11eb-8df5-cc7754b0bdfd.JPG)

- Target audience
the target audience is collectors
- Tech stack (e.g. html, css, deployment platform, etc)
## User stories
"It took me 4 mouths to find a figure missing from my collection, with this app i found her in minutes"

## Wireframes for your app

## An ERD for your app
![Capture](https://user-images.githubusercontent.com/72952429/111865219-6adcbd00-89b1-11eb-949a-8000e15dc571.JPG)

## High-level components
Most complex component of app was setting up the pop controller and views, then getting cloudinary, stripe, and heroku to all work together. At this stage the the user can upload and image and with their listing, the images on the home page hosted through cloudinary and stripe is 90% working. I say 90% because you have to reload the page and then click the buy button for stripe to load. Heroku was causeing errors with cloudinay which was partially solved by installing a cloudinary addon for heroku. This solved the error but the image just appears as a small icon.

The routes were quite simple to set up thanks to the "resources" command to auto generate 95% of the routes. Only and handful of routes needed to be manually created (listed bellow), and im most cases that was just to give then a name with "as:".

ruby's generate scaffold command made a lost of the complex modeling very easy, only requiring miner adjustment's to fit the apps needs.

```ruby
root 'home#index'
  get 'orders/new/:pop_id', to: "orders#new", as: "new_order"
  get 'orders/success', to: "orders#success", as: "order_success"
  get 'orders/cancel', to: "orders#cancel", as: "order_cancel"
  delete "/pops/:id", to: "pops#destroy", as: "delete_pop"
```

## Third party services
The App uses Stripe for trasactions, Cloudinary for data storage, and Heroku to host the server.

## Relationships
The users is able to create a listing. if the user owns a listing they can edit, and delete the listing. if the user doesn't own the listing they can't edit or delete but they can buy it.

Each listing contains a pop firgure, and each figure belongs to a collection( future updates would also implement a set feature to group each pop with its set) a listing can only be edited/deleted buy creator and bought by anyone else.
```ruby
  create_table "pops", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.float "price"
    t.string "category"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_pops_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false 
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end
```