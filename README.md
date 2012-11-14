# BulkipptCLI

BulkipptCLI offers a command line interface alternative to using the Bulkippt gem in your application. If you just need to import your bookmarks from a CSV into your kippt.com account with a single one-liner from your shell, this is your tool.

## Installation

Add this line to your application's Gemfile:

    gem 'bulkippt_cli'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install bulkippt_cli

Ruby 1.9.3 or later required.

## Usage

Upon installation, the bulkippt command should be available to you.
Running the command without any arguments will list the available tasks
you can perform. The built-in help can also assist you with invocation parameters like so:

    $ bulkippt help submit

To invoke the submit task (in test mode): 

    $ bulkippt submit ~/path/to/my/bookmarks.csv -u kippt_username -t kippt_token -e test

The above command will submit the bookmarks you've listed in your CSV
using your kippt.com username and token passed in through the -u and -t
flags. See developers.kippt.com for that information. Note that the -e
flag is set to _test_ and that allows you to perform a dry run before
actually submitting to kippt.com.  When you're ready, simply drop the -e
paramter.

Your bookmarks CSV is expected to have the following columns: url, title, description.

The result of running the command successfully will be something like this:

    I, [2012-11-14T01:40:55.938107 #66997]  INFO -- : SUCCESS: Kippt http://www.kippt.com
    I, [2012-11-14T01:40:55.938230 #66997]  INFO -- : SUCCESS: Pinboard http://pinboard.in
    I, [2012-11-14T01:40:55.938288 #66997]  INFO -- : SUCCESS: Delicious http://delicious.com
    3 bookmarks submitted

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes with tests (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
