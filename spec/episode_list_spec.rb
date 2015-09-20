require 'rails_helper'

describe Tvdb::EpisodeList do
  let(:series_id){ 1 }
  let(:subject){ described_class.fetch_by(series_id: series_id) }

  before do
    allow(Tvdb::EpisodeList).to receive(:api_key).and_return(1)

    stub_request(:get, "http://thetvdb.com/api/1/series/1/all/en.zip").to_return(
      body: read_fixture('series_episodes_response.zip')
    )
  end

  it "parses zip" do
    binding.pry
  end
end
