# Microverse > Ruby on Rails Capstone > Twitter Redesign


## Project specification
In the project I built a fullstack application on Ruby on Rails which is a based 
on a redesign of Twitter. I followed the [given design of the website](https://www.behance.net/gallery/14286087/Twitter-Redesign-of-UI-details), 
but personalized the content and introduced voting to the tweets ( or opinions ). 

![homepace screenshot](./doc/images/homepage.png)
Homepage

![homepace screenshot](./doc/images/user_page.png)
Userpage

## MVP version of the app
I followed a user journey to build the following **MVP version** of the app:

1. The user logs in to the app, only by typing the username (a proper authenticated login is **not** a requirement).
2. The user is presented with the homepage (see the *Homepage* screenshot above) that includes:
    1. Left-side menu (includes only links to pages that are implemented).
    2. *Tweets* tab in the centre (skip *Photos* and *Videos* for this MVP).
    3. Right-side section with *Who to follow (*skip *Trending for* this MVP).
3. The *Tweets* section includes:
    1. Simple form for creating a tweet.
    2. List of all tweets (sorted by most recent) that display tweet text and author details.
4. The *Who to follow* section includes:
    1. List of profiles that are not followed by the logged-in user (ordered by most recently added).
5. When the user opens the profile page (see the *Userpage* screenshot above), they can see:
    1. Left-side menu (includes only links to pages that are implemented).
    2. Cover picture and *Tweets* tab in the centre (skipped other tabs and *Tweet to user* form).
    3. Right-side section with *Profile detailed info.*
6. The *Profile detailed info* section includes:
    1. User photo.
    2. Button to follow a user.
    3. Stats: total number of tweets, number of followers and number of following users.
    4. List of people who follow this user.
7. At the end extend the MVP app with one simple voting feature is created.

8. Eager loading is implemented in the controllers to avoid [n+1 queries problem](https://engineering.gusto.com/a-visual-guide-to-using-includes-in-rails/). 


## Technical mandatory requirements of the project:
1. The project is a desktop web app.
2. The database schema reflects the following structure:

    ![homepace screenshot](./doc/images/erd_diagram.png)

3. It validates all user input to make sure that anyone with bad intentions cannot compromise the app.
4. It uses Postgres as database.
5. It uses ```.erb``` view template engine.
6. It is an MVP of the full product (with the full graphical design but only basic features that can be easily extended in the future).
7. The project is deployed and accessible online.


## Live Demo
- [Live demo link with Heroku](https://whispering-headland-84892.herokuapp.com)

## Video presentation
https://www.loom.com/share/5aa5cb27022f492bb791996455297b5a

## Getting Started

### Prerequisites

- Ruby v2.7.0p0
- Rails v6.0.3.4
- Node v13.7.0
- npm v6.13.6
- Postgres v12.4

If you have difficulty to change the version of the prerequested apps, you can check the notes below.

- Note 1: You can change your Ruby version by using [rvm](https://rvm.io).
    - Github repository: [rvm github](https://github.com/rvm/rvm)

- Note 2: You can change your Rails version by following this article [rvm](https://developpaper.com/using-rvm-to-control-switching-ruby-rails-version/).
   
- Note 3: You can change your Node version by using [nvm](https://github.com/nvm-sh/nvm).


- Paperclip
    - It is intended as an easy file attachment library for ActiveRecord. You can check the installation instructions from its repository [here](https://github.com/thoughtbot/paperclip).
    - The intent behind it was to keep setup as easy as possible and to treat files as much like other attributes as possible. 
    This means they aren't saved to their final locations on disk, nor are they deleted if set to nil, 
    until ActiveRecord::Base#save is called. It manages validations based on size and presence, if required. 
    It can transform its assigned image into thumbnails if needed, and the prerequisites are as simple as installing 
    ```ImageMagick``` (which, for most modern Unix-based systems, is as easy as installing the right packages). 
    Attached files are saved to the filesystem and referenced in the browser by an easily understandable specification, 
    which has sensible and useful defaults. You can learn how to install ```ImageMagick``` from the [Paperclip](https://github.com/thoughtbot/paperclip) repository as well.
    
### Installation and Setup
- In order to run, you need to install RUBY and Rails in your computer. For windows you can go to [Ruby installer](https://rubyinstaller.org/) and for MAC and LINUX you can go to [Ruby official site](https://www.ruby-lang.org/en/downloads/) for intructions on how to intall it.

- To get a local copy up and running, follow these simple example steps.
   - Clone the project by typing ```https://github.com/RaminMammadzada/rails-twitter-redesign/```
   - Redirect to the root of the project by typing ```cd rails-twitter-redesign```
   - Go to the ```test_and_deploy``` branch by typing ```git checkout test_and_deploy```
   - ```bundle update```
   - ```bundle install```

- Setup database with:

```
   rails db:create
   rails db:migrate
```

### Usage

Start server with:

```
    rails server
```

Open `http://localhost:3000/` in your browser.

### Run tests

```
    rpsec --format documentation
```

## Authors

👤 **Ramin Mammadzada**

- Github: [@RaminMammadzada](https://github.com/RaminMammadzada)
- Twitter: [@RaminMammadzada](https://twitter.com/RaminMammadzada)
- Linkedin: [@RaminMammadzada](https://www.linkedin.com/in/raminmammadzada) 


## 🤝 Contributing

Contributions, issues and feature requests are welcome!

Feel free to check the [issues page](issues/).

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments

- [UI design of the Twitter Redesign](https://www.behance.net/gallery/14286087/Twitter-Redesign-of-UI-details) by Gregoire Vella
- [Microverse Project Specifications](http://notion.so/Twitter-redesign-f8a8d48453d54d1a949bb0ceab4c8718#33…)

## 📝 License

This project is [MIT](lic.url) licensed.

