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
      "EpisodeName"            => "name",
      "EpisodeNumber"          => "number",
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
      "filename"               => "banner_path",
      "lastupdated"            => "lastupdated",
      "seasonid"               => "season_id",
      "seriesid"               => "series_id",
      "thumb_added"            => "thumb_added",
      "thumb_height"           => "thumb_height",
      "thumb_width"            => "thumb_width",
    }.with_indifferent_access

    def initialize(episode_data)
      @episode_data = episode_data
    end

    def first_aired_at
      first_aired_at = read_attribute("FirstAired")
      first_aired_at && Date.strptime(first_aired_at, "%Y-%m-%d")
    end

    def method_missing(m, *args, &block)
      m = m.to_s

      if ATTRIBUTE_MAPPING.values.include?(m)
        read_attribute(method_name_to_attribute(m))
      else
        super
      end
    end

    private

      def read_attribute(attribute_name)
        Nokogiri::XML(episode_data).at(attribute_name).text
      end

      def method_name_to_attribute(method_name)
        ATTRIBUTE_MAPPING.find do |attribute, attribute_method_name|
          attribute_method_name == method_name
        end.first
      end
  end
end
