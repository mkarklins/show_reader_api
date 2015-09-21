module Tvdb
  class Episode
    attr_accessor :episode_data

    ATTRIBUTE_MAPPING = {
      "id"                     => "episode_id",
      "Combined_episodenumber" => "combined_episode_number",
      "Combined_season"        => "combined_season",
      "DVD_chapter"            => "DVD_chapter",
      "DVD_discid"             => "DVD_discid",
      "DVD_episodenumber"      => "DVD_episodenumber",
      "DVD_season"             => "DVD_season",
      "Director"               => "director",
      "EpImgFlag"              => "EpImgFlag",
      "EpisodeName"            => "episode_name",
      "EpisodeNumber"          => "episode_number",
      "FirstAired"             => "first_aired_at",
      "GuestStars"             => "guest_stars",
      "IMDB_ID"                => "imdb_id",
      "Language"               => "language",
      "Overview"               => "description",
      "ProductionCode"         => "production_code",
      "Rating"                 => "rating",
      "RatingCount"            => "rating_count",
      "SeasonNumber"           => "season_number",
      "Writer"                 => "writer",
      "absolute_number"        => "absolute_number",
      "filename"               => "filename",
      "lastupdated"            => "lastupdated",
      "seasonid"               => "season_id",
      "seriesid"               => "series_id",
      "thumb_added"            => "thumb_added",
      "thumb_height"           => "thumb_height",
      "thumb_width"            => "thumb_width",
    }

    def initialize(episode_data)
      @episode_data = episode_data
    end

    def method_missing(m, *args, &block)
      if ATTRIBUTE_MAPPING.values.include?(m.to_s)
        Nokogiri::XML(episode_data).at(
          attribute_name_by_method(m.to_s)
        ).text
      else
        super
      end
    end

    def attribute_name_by_method(method_name)
      ATTRIBUTE_MAPPING.find do |attribute, attribute_method_name|
        attribute_method_name == method_name
      end.first
    end

  end
end
