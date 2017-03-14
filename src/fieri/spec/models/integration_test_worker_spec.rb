require 'rails_helper'

describe IntegrationTestsWorker do
  let(:itw) { IntegrationTestsWorker.new }
  let(:cookbook_json_response) { File.read('spec/support/cookbook_source_url_fixture.json') }
  let(:cookbook_name) { 'apache' }

  context 'when a source url is present' do
    let(:octokit) { Octokit::Client.new(access_token: ENV['FIERI_SUPERMARKET_ENDPOINT']) }
  end
end
