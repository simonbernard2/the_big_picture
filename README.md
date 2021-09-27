# README

## Intro

**The Big Picture**

## Requirements

* Ruby 3.0.0 or above
* Linux, MacOS or Windows
* ImageMagick
    * visit https://github.com/rmagick/rmagick to get instructions
* mysql

## Installation

Install the missing requirements if any.

Copy the repo, cd into it and ```bundle install```.

Setup the database with

```
rails db:create
rails db:migrate
rails db:seed
```

Start the server with ```rails s```

## Adding images to the database

Send a POST request to **http://localhost:3000/upload_images** using Postman

Your json data structure should look like this:

```json
{
  "urls": [
    "https://i.imgur.com/VLL0Imub.jpg",
    "https://i.imgur.com/L6MHFqzb.jpg",
    "https://i.imgur.com/lxgPHBrb.jpg",
    "https://i.imgur.com/7TExQ3Wb.jpg",
    "https://i.imgur.com/uUzHwZnb.jpg",
    "https://i.imgur.com/bi0Pw6eb.jpg",
    "https://i.imgur.com/tV4YBBDb.jpg",
    "https://i.imgur.com/WBHwff2b.jpg"
  ]
}
```

## Creating a mosaic from an image

Send a GET request to **localhost:3000/make_mosaic**

Make sure you include the followings parameters in your query:

* image_url: the url where your image is hosted at
* size: this represents how many "pictures in a row" you would like
* resolution (0-255): this the lower the number, the more accurate the color will match.

example: **http://localhost:3000/make_mosaic?image_url=https://i.imgur.com/KfutyIK.jpeg&size=10&resolution=4**

## Testing

To run the tests: ```rails test```
