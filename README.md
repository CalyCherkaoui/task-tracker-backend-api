# Task & Track | Backend API
## About the project
In this project, I built the back-end side of a tracking application that allows you to track your daily tasks.
This project was built following the specifications and user stories given here:
[Click here to read the projects specifications](https://www.notion.so/Final-Capstone-Project-Tracking-App-22e454da738c46efaf17721826841772)

## Built with
  <a href="#"><img width="10%" src="https://www.vectorlogo.zone/logos/heroku/heroku-ar21.svg"></a>
  <a href="https://github.com/"><img width="5%" src="https://i.giphy.com/media/KzJkzjggfGN5Py6nkT/200.webp" alt="GitHub"></a>
  <br>

## Table of content
- [About the project](#about-the-project)
- [Built with](#built-with)
- [API documentation](#api-documentation)
- [API Endpoints](#api-endpoints)
- [Link to the deployed API](#link-to-the-deployed-api)
- [Walkthrough Video presentation](#walkthrough-video-presentation)
- [Screenshots](#screenshots)
- [Dependencies](#dependencies)
- [Linting tools](#linting-tools)
- [Getting started](#getting-started-in-development)
- [Automated tests](#automated-tests)
- [Author](#author)
- [Contributing](#-Contributing)
- [Acknowledgments](#acknowledgments)
- [License](#license)

## API documentation
Documentation

## API Endpoints
This API provides the following Endpoints:
<table>
  <tr>
    <th>RESTful Endpoint</th>
    <th>Description</th>
  </tr>
  <tr>
    <td>POST/register</td>
    <td>Signup of a new user</td>
  </tr>
  <tr>
    <td>POST/login</td>
    <td>Login of an existing user</td>
  </tr>
  <tr>
    <td>GET/gategories</td>
    <td>List of all categories</td>
  </tr>
  <tr>
    <td>GET/tasks</td>
    <td>List of all user's tasks</td>
  </tr>
  <tr>
    <td>POST/tasks</td>
    <td>Creates new task</td>
  </tr>
  <tr>
    <td>GET/tasks/:id</td>
    <td>Provides task details</td>
  </tr>
  <tr>
    <td>PUT/tasks/id</td>
    <td>Updates task</td>
  </tr>
  <tr>
    <td>DELETE/tasks/id</td>
    <td>Destroy task</td>
  </tr>
</table>


## Link to the deployed API
[Link to the deployed Api on Heroku]()

## Walkthrough video presentation
[Check here a video presentation of the project]()

## Screenshots
<br>
<span><img width="380" src="./public/screenshots/coinsList.png"></span>&nbsp &nbsp<span><img width="380" src="./public/screenshots/About.png"></span><span><img width="380" src="./public/screenshots/coinDetail.png"></span>
<br>

## Dependencies
The main dependencies used in this web application:

<table>
  <tr>
    <th>Dependency</th>
    <th>for</th>
    <th>Development</th>
    <th>Test</th>
    <th>Production</th>
  </tr>
  <tr>
    <td>Rails</td>
    <td></td>
    <td>⭐️</td>
    <td>⭐️</td>
    <td>⭐️</td>
  </tr>
  <tr>
    <td>rspec-rails</td>
    <td>A testing framework for Rails</td>
    <td></td>
    <td>⭐️</td>
    <td></td>
  </tr>
  <tr>
    <td>factory_bot_rails</td>
    <td>A fixtures replacement</td>
    <td></td>
    <td>⭐️</td>
    <td></td>
  </tr>
  <tr>
    <td>shoulda-matchers</td>
    <td>Simple One-Liner Tests for Rails</td>
    <td></td>
    <td>⭐️</td>
    <td></td>
  </tr>
  <tr>
  <td>database_cleaner</td>
    <td>Strategies for cleaning databases in testing</td>
    <td></td>
    <td>⭐️</td>
    <td></td>
  </tr>
  <td>faker</td>
    <td>Generates fake data for testing</td>
    <td></td>
    <td>⭐️</td>
    <td></td>
  </tr>
  <td>bcrypt</td>
    <td>A secure hash algorithm for hashing passwords</td>
    <td>⭐️</td>
    <td></td>
    <td></td>
  </tr>
    <td>jwt</td>
    <td>Ruby implementation of the RFC 7519 OAuth JSON Web Token standard</td>
    <td>⭐️</td>
    <td></td>
    <td></td>
  </tr>
    <td>rack-cors</td>
    <td>Support for Cross-Origin Resource Sharing for Rack compatible web apps</td>
    <td>⭐️</td>
    <td></td>
    <td></td>
  </tr>
</table>

## Linting tools
<table>
  <tr>
    <th>Linter</th>
    <th>Use</th>
    <th>Files</th>
  </tr>
  <tr>
    <td>Rubocop</td>
    <td>Linting Ruby files</td>
    <td>.rb</td>
  </tr>
</table>

## Getting started in development

### Clone the repository:

To get a local copy of the repository, please run the following commands on your terminal:

```
$ git clone git@github.com:CalyCherkaoui/task-tracker-backend-api.git
$ cd TaskAndTrack-backend-api
$ git branch feature
$ git checkout feature

```

### Prerequisites:

Ruby: 2.6.6
Rails: 6.0.4

Run your Postgresql service in your terminal:

```
$ sudo service postgresql restart
```
### Setup:

Install gem dependencies:
```
$ bundle install
```

Setup the database:
```
$ rails db:create
$ rails db:migrate
$ rails db:seed
```

### Usage:

Run Rails server:
```
$ rails s
```
In the browser, open ``http://localhost:3000``

### Prerequisites and useful Command Line Tools:

Ruby: 2.6.6
Rails: 6.0.4

Run your Postgresql service in your terminal:

```
$ sudo service postgresql restart
```

To lint Ruby code:
```
$  rubocop -A
```

To run the tests:
```
$  bundle exec rpsec
```
## Automated tests

### Unit tests series:

<br>
<img width="600px" src="./screenshots/test_models.png">
<br>

### Request tests series:

Users
<br>
<img width="600px" height="auto" src="./screenshots/test_users_request.png">
<br>

## Author
👤 **Houda Cherkaoui**

- Github: [@CalyCherkaoui](https://github.com/CalyCherkaoui)
- Twitter: [@Houda59579688](https://twitter.com/Houda59579688)
- Linkedin: [Houda-Cherkaoui](https://www.linkedin.com/in/houda-cherkaoui-64106395/)
## Contributing
Contributions, issues, and feature requests are welcome!
## Show your support
Give a ⭐️ if you like this project!
## Acknowledgments
- Hat tip to [stackoverflow](https://stackoverflow.com) comunity.
- Hat tip to [Microverse](https://www.microverse.org/) TSE for Code Review.
- Hat tip to anyone whose code was used
## 📝 License
All source code is available jointly under the MIT License.
See [MIT licence](./LICENSE) for details.
