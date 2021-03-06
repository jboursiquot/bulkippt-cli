require_relative '../../spec_helper'

describe 'Bulkippt CLI' do

  before(:all) do
    @username = 'valid'
    @token = 'valid'
    @invalid_username = 'invalid'
    @invalid_token = 'invalid'
    @empty_csv = File.expand_path('../../../data/empty.csv',__FILE__)
    @good_csv = File.expand_path('../../../data/good.csv',__FILE__)
    @bad_csv = '/does/not/exist'
  end

  context 'when invoked without any parameters' do

    it 'should respond with a task list' do
      output = `./bin/bulkippt`
      output.should include 'Tasks:'
      output.should include 'bulkippt submit CSV'
    end

  end

  context 'when submit task is invoked with missing or invalid paramters' do

    it "should respond with 'bulkippt submit requires at least 1 argument...' if the csv passed in is invalid" do
      output = `./bin/bulkippt submit -e test 2>&1`
      output.should include 'bulkippt submit requires at least 1 argument'
    end

    it 'should respond with a missing username argument error if the -u|-username parameter is not provided' do
      output = `./bin/bulkippt submit #{@empty_csv} -e test 2>&1`
      output.should include 'Missing username argument'
    end

    it 'should respond with a missing username argument error if the -u|-username parameter is blank' do
      output = `./bin/bulkippt submit #{@empty_csv} -u -e test 2>&1`
      output.should include 'Missing username argument'
    end

    it 'should respond with a missing token argument error if the -t|-token parameter is not provided' do
      output = `./bin/bulkippt submit #{@empty_csv} -u #{@username} -e test 2>&1`
      output.should include 'Missing token argument'
    end

    it 'should respond with a missing token argument error if the -t|-token parameter is blank' do
      output = `./bin/bulkippt submit #{@empty_csv} -u #{@username} -t -e test 2>&1`
      output.should include 'Missing token argument'
    end

    it 'should respond with invalid username and/or token if validation of username/token fails' do
      output = `./bin/bulkippt submit #{@good_csv} -u #{@invalid_username} -t #{@invalid_token} -e test 2>&1`
      output.should include 'Invalid username and/or token'
    end

    it 'should respond with an invalid CSV error if the expected columns are not found in the CSV' do
      output = `./bin/bulkippt submit #{@empty_csv} -u #{@username} -t #{@token} -e test 2>&1`
      output.should include "Missing 'url' column"
    end

    it 'should respond with an invalid CSV error if the CSV cannot be found' do
      output = `./bin/bulkippt submit #{@bad_csv} -u #{@username} -t #{@token} -e test 2>&1`
      output.should include "File not found: #{@bad_csv}"
    end

  end

  context 'when successfully parsing and submitting bookmarks' do

    it 'should respond with at least 3 SUCCESS messages when bookmarks are successfully processed' do
      output = `./bin/bulkippt submit #{@good_csv} -u #{@username} -t #{@token} -e test 2>&1`
      output.should include 'SUCCESS'
    end

  end
end
