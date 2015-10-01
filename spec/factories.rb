FactoryGirl.define do
  factory :series do
    name "Family Guy"
    series_id 75978
    banner_path "graphical/75978-g6.jpg"
    description "sample description"
    first_aired_at Date.today
    imdb_id "tt0182576"
    network "FOX (US)"
  end
end
