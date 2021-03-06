# The Big Picture

![Example of a image mosaic](https://i2-prod.mirror.co.uk/incoming/article848233.ece/ALTERNATES/s615b/BBC%20SOUTH%20EAST%20PRESENTS%20THE%20PEOPLE%E2%80%99S%20MONARCH)

## Intro

**The Big Picture** is an image repository that allows users to upload their pictures. What makes it different is that it is capable of _creating an image from other images_. You will get a package of your printed photos, with indications on the back of each one telling you where they belong on the generated grid. It is the perfect way to decorate your home and it all ties up your photos into **one big picture**. 

Enjoy.

## Requirements

* Linux, MacOS or Windows
* [Ruby 3.0.0 or above](https://www.ruby-lang.org/en/downloads/)
* [ImageMagick 7.0.8 or later](https://imagemagick.org/script/download.php)
* [MySQL](https://www.mysql.com/downloads/)

## Installation

Install the missing requirements if any.

Copy the repo, cd into it then run ```bundle install```.

Setup the database with:

```
rails db:create
rails db:migrate
rails db:seed
```

Start the server by running ```rails s```.

## Adding images to the database

Send a POST request to **http://localhost:3000/upload_images** using Postman.

Your JSON data structure should look something like this:

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

Send a POST request to **http://localhost:3000/make_mosaic** using Postman.

Your JSON data should look something like this:

```json
{
    "image_url": "https://i.imgur.com/KfutyIK.jpeg",
    "size": 5,
    "resolution":30
}
```

**The Big Picture** will "chop" your main picture into a grid based on the _**size**_ you provided. For every square of the grid, the average color will be calculated and **The Big Picture** will try to find a picture with a similar color from it's database. The higher the _**resolution**_ value, the broader the search will be.

Upon success, you should get a response that looks like this:

<details>
  <summary>Click here to see the sample JSON response.</summary>

```json
{
    "status": "ok",
    "data": [
        {
            "picture_id": 54,
            "x": 0,
            "y": 0
        },
        {
            "picture_id": 8,
            "x": 0,
            "y": 1
        },
        {
            "picture_id": 10,
            "x": 0,
            "y": 2
        },
        {
            "picture_id": 3,
            "x": 1,
            "y": 0
        },
        {
            "picture_id": 19,
            "x": 1,
            "y": 1
        },
        {
            "picture_id": 28,
            "x": 1,
            "y": 2
        },
        {
            "picture_id": 23,
            "x": 2,
            "y": 0
        },
        {
            "picture_id": 38,
            "x": 2,
            "y": 1
        },
        {
            "picture_id": 10,
            "x": 2,
            "y": 2
        },
        {
            "picture_id": 23,
            "x": 3,
            "y": 0
        },
        {
            "picture_id": 8,
            "x": 3,
            "y": 1
        },
        {
            "picture_id": 3,
            "x": 3,
            "y": 2
        },
        {
            "picture_id": 3,
            "x": 4,
            "y": 0
        },
        {
            "picture_id": 3,
            "x": 4,
            "y": 1
        },
        {
            "picture_id": 19,
            "x": 4,
            "y": 2
        },
        {
            "picture_id": 10,
            "x": 5,
            "y": 0
        },
        {
            "picture_id": 8,
            "x": 5,
            "y": 1
        },
        {
            "picture_id": 28,
            "x": 5,
            "y": 2
        }
    ]
}
```
</details>

## Testing

To run the tests: ```rails test```

## What's next?
Here are a few things that should be added to the project:
* Adding security
* Minimizing picture repetition 
* Uploading images instead of relying on urls
* Generating a preview image of the mosaic
* Adding users
* Make users upload images for themselves or to the whole community
* Users could create albums
* Considering images ratios in order to generate a "cleaner" mosaic
* Taking advantage of images' metadata
* Setting up the front-end
* Setting up the printing layouts
* Implementing a payment method

