# Demo
https://blog-challenge-rails.herokuapp.com/  
The authentication is fake, so you don't need to enter a password, only the email admin@admin.com is enought.

# Challenge description

Implement a bare-bones blog with an admin page for creating new posts in rails. The requirements are:
1. User authentication is not required; it's enough to have a separate `/admin` path for creating/updating/deleting posts
2. Should use a Postgresql database
3. Should have tests
4. An administrator should be able to create new blog posts
    - Contains a title and body
5. The root index page should show all the posts with:  
    - The post title
    - The first 50 characters of the post body
6. When clicking on a post title, you see:
    - The post title
    - The full post body
    - A list of comments
    - A way to create a new comment
    - A comment contains the body and email

# Dependencies
- ruby 3.0.0
- rails 7.0

# Instalation

## Run on docker
You must have installed docker and docker-compose
After clone the project, go inside the project folder and run these commands:

```
$ cp .env.sample .env
$ docker-compose run app rails db:create
$ docker-compose run app rails db:migrate
$ docker-compose run app rails db:seed
$ docker-compose up
```
once you ran these command you will be able to see the project opening the browser on localhost:3000.


# Testing

The project use Rspec for testing. You also can run the test on docker:

```
$ docker-compose run app rspec .
```
