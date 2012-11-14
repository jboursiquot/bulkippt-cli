require 'thor'
require 'logger'
require 'bulkippt'
require 'kippt'

module Bulkippt

  class CLI < Thor

    desc 'submit CSV', 'Submits bookmarks from CSV to kippt.com'
    method_option :username, aliases: '-u', desc: 'Your kippt.com username'
    method_option :token, aliases: '-t', desc: 'Your kippt.com token'
    method_option :environment, aliases: '-e', default: 'production', desc: 'Running environment of tool. When set to test, it will not submit to Kippt.com.'
    def submit(csv)
      begin
        initialize_credentials options
        initialize_bulkippt options[:environment]

        csv_path = File.expand_path(csv, __FILE__)
        raise RuntimeError("File not found: #{csv}") unless File.exists?(csv_path)

        bookmarks = @bulkippt.extract_bookmarks csv_path
        submitted = @bulkippt.submit_bookmarks bookmarks
        $stdout.puts "#{submitted.length} bookmarks submitted"

      rescue => e
        $stderr.puts e.message
      end
    end

    private

    def initialize_credentials(options)
      raise 'Missing username argument' unless options.has_key? 'username'
      raise 'Missing token argument' unless options.has_key? 'token'
      @username = options['username']
      @token = options['token']
    end

    def initialize_bulkippt(env)
      kippt = env == 'test' ? Bulkippt::FakeService.new('valid','valid') : Kippt::Client.new(username: @username, token: @token)
      @bulkippt = Bulkippt::Loader.new(kippt)
    end

  end

end
