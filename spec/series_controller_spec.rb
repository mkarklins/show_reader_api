require 'rails_helper'

describe Api::V1::SeriesController, type: :controller do
  render_views

  # TODO: First test draft
  let!(:series){ create(:series) }
  let(:response_json) { JSON.parse(response.body) }
  let(:sample_json) do
    {"series"=>
      [{"id"=>series.id,
        "name"=>"Family Guy",
        "series_id"=>75978,
        "banner_path"=>"graphical/75978-g6.jpg",
        "description"=>"sample description",
        "first_aired_at"=>"2015-10-01",
        "imdb_id"=>"tt0182576",
        "network"=>"FOX (US)",
        "created_at"=>series.created_at.to_json.gsub("\"", ""),
        "updated_at"=>series.updated_at.to_json.gsub("\"", "")}],
     "total_count"=>1}
  end

  it "returns all series" do
    get :index, format: :json

    expect(response_json).to eq sample_json
  end
end
