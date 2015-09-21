require 'rails_helper'

describe Tvdb::Episode do
  let(:episode_data){ read_fixture('episode_response.xml')}
  let(:subject){ described_class.new(episode_data) }

  describe "attributes" do
    it { expect(subject.writer).to eq "Gary Janetti" }
  end
end
