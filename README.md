<p align="center">
  <img src="https://elixir-lang.org/images/logo/logo.png",>
  <br />
  <br />
  <br />
  <img src="https://img.shields.io/github/issues/SkullDarth/upnid-challenge-twitter-api">
  <img src="https://img.shields.io/github/forks/SkullDarth/upnid-challenge-twitter-api">
  <img src="https://img.shields.io/badge/made%20by-SkullDarth-lightgrey">
  <img src="https://img.shields.io/github/stars/SkullDarth/upnid-challenge-twitter-api">
  <img src="https://img.shields.io/github/license/SkullDarth/upnid-challenge-twitter-api">

   <p align="center">
      <a href="#about-the-challenge">About the challenge</a>
      <strong>|</strong>
      <a href="#resources-and-procedures">Resources and Procedures</a>
      <strong>|</strong>
      <a href="#running-for-first-time">Running for First Time</a>
      <strong>|</strong>
      <a href="#project-tree">Project Tree</a>
      <strong>|</strong>
      <a href="#project-in-function">Project in function</a>
      <strong>|</strong>
      <a href="#license">License</a>
   </p>


Upnid - [UpChallenge: Back-end - Test 1 (Twitter API) ](#)

   > "How you look at it is pretty much how you'll see it." **Rasheed Ogunlaru**
</p>

---
## **About the challenge:**
#### **Developer one RESTful back-end to simulate once functions twitter API using Postgres database, and Elixir language**
---
* The objective of this challenge is to recreate some functionalities presente in back-end twitter API to whe can create users and tweets.

* To view this project in function please. click [here][challengeUpnid].


---
# Resources and Procedures

## Technologies APIs and Libraries used to create this project

This project was developed with the following technologies:

- [Elixir][elixir]
- [Phoenix][phoenix]
- [Ecto][ecto]
- [Poison][poison]
- [Inotify-Tools][inotify-tools]
- [Hex][hex]
- [VS Code][vc] with [EditorConfig][vceditconfig] and [ESLint][vceslint]

## Developed Features

* Api for encrypt password to user login with argon2_elixir and comeonin.
* Apis for creation, update Users in plataform.
* Apis for CRUD of Tweets created by users.
* Api for consultation of published tweets made by Users present in plataform.
* Apis for Users to follow and consult another users present in clone twitter plataform.

---

## Running for First Time

To clone and run this application, you'll need [Git][git], [Docker][docker], [Elixir][elixir], [Postbird][postbird], [Node.js v10.16][nodejs] or higher + [Yarn v1.13][yarn] or higher + [Npm][npm] installed on your computer. 

From your command line:

```bash
# Clone this repository
$ git clone https://github.com/SkullDarth/upnid-challenge-twitter-api.git

# Go into the repository
$ cd upnid-challenge-twitter-api

# Install dependencies
$ mix deps.get

# Compile dependencies
$ mix deps.compile

#Install Node.js dependencies
$ cd assets && npm install

# Run Postgres
$ docker run --name twitter -e POSTGRES_PASSWORD=docker -d -p 5432:5432 -d postgres:11

# Create a new database named `twitter_dev` and run the following commands in the same order:
# Run Migrations and Seeds
$ mix ecto.migrate
$ mix run priv/repo/seeds/user_seeds.exs
$ mix run priv/repo/seeds/tweet_seeds.exs


# Run the Server
$ mix phx.server
```
Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

---

#### There is an [Insomnia file](./Insomnia.json) you can load on your Insomnia to test the routes.

---

## Project Tree
To create a tree files in project run commands present right below in respository folder:

```bash
$ yarn add tree-cli

$ yarn tree -l 6 -o out.txt --ignore  node_modules,_build,assets,deps,.elixir_ls,yarn.lock,package.json

```

#### Result after run comand present in top:

```bash

├── LICENSE
├── Procfile
├── README.md
├── config
|  ├── config.exs
|  ├── dev.exs
|  ├── prod.exs
|  ├── prod.secret.exs
|  └── test.exs
├── elixir_buildpack.config
├── lib
|  ├── twitter
|  |  ├── application.ex
|  |  ├── management
|  |  |  ├── auth.ex
|  |  |  ├── encryption.ex
|  |  |  ├── tweet.ex
|  |  |  └── user.ex
|  |  ├── management.ex
|  |  └── repo.ex
|  ├── twitter.ex
|  ├── twitter_web
|  |  ├── channels
|  |  |  └── user_socket.ex
|  |  ├── controllers
|  |  |  ├── fallback_controller.ex
|  |  |  ├── page_controller.ex
|  |  |  ├── session_controller.ex
|  |  |  ├── tweet_controller.ex
|  |  |  └── user_controller.ex
|  |  ├── endpoint.ex
|  |  ├── gettext.ex
|  |  ├── router.ex
|  |  ├── templates
|  |  |  ├── layout
|  |  |  |  └── app.html.eex
|  |  |  ├── page
|  |  |  |  └── index.html.eex
|  |  |  └── session
|  |  |     └── new.html.eex
|  |  └── views
|  |     ├── changeset_view.ex
|  |     ├── error_helpers.ex
|  |     ├── error_view.ex
|  |     ├── layout_view.ex
|  |     ├── page_view.ex
|  |     ├── session_view.ex
|  |     ├── tweet_view.ex
|  |     └── user_view.ex
|  └── twitter_web.ex
├── mix.exs
├── mix.lock
├── out.txt
├── priv
|  ├── gettext
|  |  ├── en
|  |  |  └── LC_MESSAGES
|  |  |     └── errors.po
|  |  └── errors.pot
|  ├── repo
|  |  ├── migrations
|  |  |  ├── 20191201050151_create_users.exs
|  |  |  └── 20191201051725_create_tweets.exs
|  |  ├── seeds
|  |  |  ├── tweet_seeds.exs
|  |  |  └── user_seeds.exs
|  |  └── seeds.exs
|  └── static
|     ├── css
|     |  └── app.css
|     ├── favicon.ico
|     ├── images
|     |  └── phoenix.png
|     ├── js
|     |  └── app.js
|     └── robots.txt
├── test
|  ├── support
|  |  ├── channel_case.ex
|  |  ├── conn_case.ex
|  |  └── data_case.ex
|  ├── test_helper.exs
|  ├── twitter
|  |  └── management_test.exs
|  └── twitter_web
|     ├── channels
|     ├── controllers
|     |  ├── page_controller_test.exs
|     |  ├── tweet_controller_test.exs
|     |  └── user_controller_test.exs
|     └── views
|        ├── error_view_test.exs
|        ├── layout_view_test.exs
|        └── page_view_test.exs

directory: 1683 file: 8524 symboliclink: 14

ignored: directory (68), file (726)

```

## Project in function

### - Insomnia: Routes and requests

![Insomnia Twitter][insomnia_twitter]

### - Postgres: Structure database

![Postgres Twitter database][postgres_twitter_database]

---

## Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix

---

## License
This project is under the MIT license. See the [LICENSE](./LICENSE) for more information.

---

#### Made by Yan Oliveira [Get in touch!](https://www.linkedin.com/in/yan-brito/)




[challengeUpnid]: https://youtu.be/34A_NV777RQ

[insomnia_twitter]: #
[postgres_twitter_database]: # 

[elixir]: https://elixir-lang.org/
[nodejs]: https://nodejs.org/
[vc]: https://code.visualstudio.com/
[vceditconfig]: https://marketplace.visualstudio.com/items?itemName=EditorConfig.EditorConfig
[vceslint]: https://marketplace.visualstudio.com/items?itemName=dbaeumer.vscode-eslint
[phoenix]: http://www.phoenixframework.org/
[docker]: https://www.docker.com
[git]: https://git-scm.com
[postbird]: https://electronjs.org/apps/postbird
[npm]: https://www.npmjs.com/get-npm
[yarn]: https://yarnpkg.com/lang/en/
[ecto]: https://hexdocs.pm/ecto/2.2.10/Ecto.html
[poison]: https://github.com/devinus/poison
[inotify-tools]: https://github.com/rvoicilas/inotify-tools/wiki#getting
[hex]: https://hex.pm/