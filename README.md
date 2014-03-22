# Fonecal

f1cal parses [formula1.com](http://www.formula1.com/) for each Grand Prix and outputs an iCalendar file with every qualifying, practice, and race session for this year's 2014 Formula One season. All event times are converted to UTC time, allowing most  calendar applications to convert the event time to the user's current timezone.

## Installation

Add this line to your application's Gemfile:

    gem 'fonecal'

And then execute:

    $ bundle

Or install it yourself as:

   	$ gem install fonecal

## Usage

Simply call

		$ Fonecal.create_ical

To create an iCalendar file in the current directory, readable by your favorite text editor. It is then ready to be imported in a calendar application.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
