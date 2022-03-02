# Chitter

A twitter clone that allows users to post 'peeps' to a public stream. You can view and interact with the live application [here](https://thawing-dusk-78531.herokuapp.com/).

## User stories

**[View peeps](https://trello.com/c/SU5aqtBx):** ✅
```
As a... user
I want... to see peeps
So that... I can see what other people are saying
```

**[Add peeps](https://trello.com/c/MleACtGU):** ✅
```
As a... user
I want... to post a peep
So that... I can let people know what I'm doing
```

**[Order peeps by chronological order](https://trello.com/c/53MhySqI):** ✅
```
As a... user
I want... to see all peeps in reverse chronological order
So that... I can see what others are saying most recently
```

**[Display when a peep was created](https://trello.com/c/845fZKtL):** ✅
```
As a... user
I want... to see the time at which it was made
So that... I can better appreciate the context of a peep
```

**Sign up, log in & log out:** ✅

I split this user story into two steps with two seperate trello cards:

- Step 1 - [Sign up, log in & log out](https://trello.com/c/3kxVmPyx)
- Step 2 - [Make peeps belong to a user](https://trello.com/c/qE3Lhv3Y)

```
As a... user
I want... to sign up for Chitter
So that...  I can post messages on Chitter as me
```

```
As a... user
I want... to log in to Chitter
So that...  I can post messages on Chitter as me
```

```
As a... user
I want... to log out of Chitter
So that...  someone can't post messages as me
```

**[Delete peeps](https://trello.com/c/Reu0mN9T):** ✅
```
As a... user
I want... to delete my own peep
So that... I can remove a peep I'm no longer happy with
```

**[Update peeps](https://trello.com/c/pwPxpEj4):** ✅
```
As a... user
I want... to update my own peep
So that... I can update a peep if I've made a typo
```

**[Comment on a peep](https://trello.com/c/0zXCjSod):** ✅
```
As a... user
I want... to comment on a peep
So that... I can interact with others users via their peeps
```

## Tracking development of the app

I used a trello board to track my progress with building the features for the user stories above. It's a public board if you want to take a look - https://trello.com/b/A4glMyDh/chitter-rails. I also worked on each feature in a branch before merging the branch into main via a pull request. This was in order to replicate working in a development team and keep up the good development practices I've developed at Makers Academy.

## Production application

The application is hosted on Heroku. I deployed to Heroku after merging each feature to main. I took the approach of deploying small and often in order to deliver value to users early and regularly. I also wanted to reduce the risk of deploying everything at the end and hitting problems. You can view and interact with it [here](https://thawing-dusk-78531.herokuapp.com/).

## Setting up and running the app locally

1. Clone this repository - `git clone https://github.com/Cloudy1986/chitter.git`
2. Navigate to the top level directory of the cloned repository
3. Run `bundle install` via the command line
4. Run `rails db:create` then `rails db:migrate` via the command line to set up the database
5. Run `rspec` via the command line to view tests. They should all be green.
6. Run `rails s` to start the server
7. Navigate to your local host and you should be able to interact with the application in the development environment

## Test coverage and running the tests locally

- 100% test coverage.
- 96 lines covered with 0 lines missed.
- 51 tests covering models, controllers and features.
- To run the tests navigate to the top level directory of your cloned repo and run `rspec` via the command line.

![Test coverage image](./screenshots/test_coverage.png?raw=true)
