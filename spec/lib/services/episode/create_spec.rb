require 'rails_helper'

describe Episode::Create do
  describe "#call" do

    before do
      allow(Tvdb::EpisodeList).to receive(:api_key).and_return(1)

      stub_request(:get, "http://thetvdb.com/api/1/series/1/all/en.zip").to_return(
        body: read_fixture('series_episodes_response.zip')
      )
    end

    let(:tvdb_episode){ Tvdb::EpisodeList.fetch_by(series_id: 1).first }

    it "creates one record" do
      expect{ described_class.call(tvdb_episode) }.to change{ Episode.count }.from(0).to(1)
    end

    it "sets correct attributes" do
      described_class.call(tvdb_episode)

      episode = Episode.first

      expect(episode.series_id).to eq 75978
      expect(episode.episode_id).to eq 181165
      expect(episode.name).to eq "Stewie Griffin: The Untold Story (Feature Movie)"
      expect(episode.number).to eq 1
      expect(episode.first_aired_at).to eq Date.new(2006,5,21)
      expect(episode.guest_stars).to eq ""
      expect(episode.description).to eq "When Stewie sees a man who looks just like him on TV, he's convinced that he must be his real father. Stewie sets off on a cross-country road trip to find him, but his incredible journey leads to outrageous discoveries."
      expect(episode.banner_path).to eq "episodes/75978/181165.jpg"
      expect(episode.season_id).to eq 23437
      expect(episode.thumb_height).to eq 223
      expect(episode.thumb_width).to eq 300
      expect(episode.director).to eq ""
      expect(episode.imdb_id).to eq ""
    end
  end
end
