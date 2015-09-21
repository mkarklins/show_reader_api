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

  it "returns an episode list" do
    binding.pry
    expect(subject.class).to be described_class
  end

  it "parses all episodes" do
    expect(subject.count).to be 272
  end

  it "parses each episode as Tvdb::Episode object" do
    expect(subject.first.class).to be Tvdb::Episode
  end

  it "implements each method" do
    expect(subject.respond_to?(:each)).to be true
  end
end
