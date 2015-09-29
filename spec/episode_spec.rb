require 'rails_helper'

describe Tvdb::Episode do
  let(:episode_data){ read_fixture('episode_response.xml')}
  let(:subject){ described_class.new(episode_data) }

  describe "attributes" do
    it { expect(subject.writer).to eq "Gary Janetti" }
    it { expect(subject.language).to eq "en" }
    it { expect(subject.guest_stars).to eq "|Kiefer Sutherland|" }
    it { expect(subject.name).to eq "Stu & Stewie's Excellent Adventure" }
    it { expect(subject.production_code).to eq "4ACX07" }
  end

  describe "first_aired_at" do
    it "returns date object" do
      expect(subject.first_aired_at).to eq Date.new(2006,05,21)
    end
  end
end
