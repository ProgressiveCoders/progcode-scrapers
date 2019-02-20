# Progcode Scraper

## Quickstart

This program is intended to be hosted on heroku and provide scraping services for progcode. Currently slack members and channels are copied over to airtable.

Once on heroku, the app will run each command daily. The app has basic error handling and a fair amount of debugging comments.

To view debugging comments, run: `$ heroku logs -n 1500`

To run scrapers by hand:

* `$ heroku run rake slack_channels_to_airtable`
* `$ heroku run rake slack_members_to_airtable`

You will be able to view live debugging comments and progress updates as you go.

## API Keys

Note that you must be logged in and have been given the appropriate permissions by the ProgCode admin team.

* [Slack token](https://api.slack.com/custom-integrations/legacy-tokens)
* [Airtable key](https://airtable.com/account)

## Introduction

This is a Sinatra app that will host a collection of scrapers meant to consolidate
* https://github.com/ProgressiveCoders/prog-channels
* https://github.com/ProgressiveCoders/prog-members

This app can easily be extended with more scrapers and more functionality in the future. The word "scraper" doesn't appear anywhere that isn't plain text. So feel free to change the name as the app itself changes.

Note: This app was bootstrapped using this helpful guide: https://flatironschool.com/blog/how-to-build-a-sinatra-web-app-in-10-steps/

## Development

### Start the app

1. clone the app
1. `$ bundle install`
1. `$ shotgun` to run the server
1. `$ cp .env.example to .env` and enter correct values

### Add a client

1. Add a gem for your client to the Gemfile.
1. Don't forget to run `$ bundle install`.
1. Create a new file or folder in `app/clients`. Slack is only needs one file because it's a simple API. Airtable uses a folder because it's easier to use separate file for each table.
1. Make sure you add logs. This way errors can be more easily debugged. Check out the slack example in the clients folder.

### Connect clients

Use a service object

1. Go to the `app/services` folder.
1. Come up with a descriptive name for the file that you will place there.
1. It should just take a few lines of code to allow one client to talk to another. Remember, all clients should have already been created in the `app/clients` file.
1. `app/services/slack_channels_to_airtable.rb` is a good example to start from.

### Run existing tasks

For now, all rake tasks should go in the Rakefile. This can be changed if the file gets too big.

An example rake task is:

`$ rake slack_channels_to_airtable`

This can be run from the command line, or the heroku console.

To run from the heroku console:

`$ heroku run console`
`$ rake slack_channels_to_airtable`

### heroku

To push create your own heroku instance:

1. Clone this repo
1. `$ heroku create`
1. `$ git push heroku master`
1. `$ heroku ps:scale web=1`
1. `$ heroku addons:create scheduler:standard`
### Testing

`$ rspec`