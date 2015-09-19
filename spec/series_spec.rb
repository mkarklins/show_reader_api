require 'rails_helper'

describe Tvdb::Series do
  let(:response) { read_fixture("series_response.xml") }
  let(:subject) { described_class.new(response) }
  let(:description) do
    "Sick, twisted, politically incorrect and Freakin' Sweet animated series featuring the adventures of the dysfunctional Griffin family. Bumbling Peter and long-suffering Lois have three kids. Stewie (a brilliant but sadistic baby bent on killing his mother and taking over the world), Meg (the oldest, and is the most unpopular girl in town) and Chris (the middle kid, he's not very bright but has a passion for movies). The final member of the family is Brian - a talking dog and much more than a pet, he keeps Stewie in check whilst sipping Martinis and sorting through his own life issues."
  end

  describe "#name" do
    it { expect(subject.name).to eq "Family Guy" }
  end

  describe "#series_id" do
    it { expect(subject.series_id).to eq 75978 }
  end

  describe "#first_aired_at" do
    it { expect(subject.first_aired_at).to eq Date.new(1999, 1, 31) }
  end

  describe "#network" do
    it { expect(subject.network).to eq "FOX (US)" }
  end

  describe "#imdb_id" do
    it { expect(subject.imdb_id).to eq "tt0182576" }
  end

  describe "#banner_path" do
    it { expect(subject.banner_path).to eq "graphical/75978-g6.jpg" }
  end

  describe "#description" do
    it { expect(subject.description).to eq description }
  end

  describe "#persist!" do
    it "sets correct attributes" do
      subject.persist!

      relation = Series.where(
        imdb_id: "tt0182576",
        description: description,
        banner_path: "graphical/75978-g6.jpg",
        network: "FOX (US)",
        first_aired_at: Date.new(1999, 1, 31),
        series_id: 75978,
        name: "Family Guy",
      )
      expect(relation.exists?).to be true
    end
  end
end
