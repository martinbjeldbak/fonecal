# Fonecal

Fonecal parses [formula1.com](http://www.formula1.com/) for each Grand Prix and outputs an iCalendar file with every qualifying, practice, and race session for this year's 2014 Formula One season. All event times are converted to UTC time, allowing calendars to convert the event time to the user's current timezone.

The latest version of the calendar is hosted here: [martinbmadsen.dk/files/fonecal.ics](http://martinbmadsen.dk/files/fonecal.ics), and can be subscribed to in most calendar applications.

Note: Most users do not need to read past this point.

## Installation

Add this line to your application's Gemfile:

    gem 'fonecal'

And then execute:

    $ bundle

Or install it yourself as:

   	$ gem install fonecal

## Usage

Simply ``require 'fonecal'`` and call

		$ Fonecal.create_ical

To create an iCalendar file in the current directory, readable by your favorite text editor. It is then ready to be imported in a calendar application.

## TODO
A list of stuff I (might) eventually do.

- [ ] fix tests
- [ ] create a better CLI exposing more features
- [ ] add documentation

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
