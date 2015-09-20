module Tvdb
  class Series
    def self.fetch_by(name:)
      decoded_name = URI.encode(name)
      new(RestClient.get "http://thetvdb.com/api/GetSeries.php?seriesname=#{decoded_name}")
    end

    attr_accessor :response, :parsed_response

    def initialize(response)
      @response = response
    end

    def name
      extract_value_by(name: "SeriesName")
    end

    def series_id
      extract_value_by(name: "seriesid").to_i
    end

    def first_aired_at
      aired_at = extract_value_by(name: "FirstAired")
      Date.strptime(aired_at, "%Y-%m-%d")
    end

    def network
      extract_value_by(name: "Network")
    end

    def description
      extract_value_by(name: "Overview")
    end

    def imdb_id
      extract_value_by(name: "IMDB_ID")
    end

    def banner_path
      extract_value_by(name: "banner")
    end

    def persist!
      ::Series.create!(
        description: description,
        network: network,
        series_id: series_id,
        first_aired_at: first_aired_at,
        name: name,
        imdb_id: imdb_id,
        banner_path: banner_path,
      )
    end

    private

      def parsed_response
        @parsed_response ||= Nokogiri::XML(response).xpath("//Data/Series").first.element_children
      end

      def extract_value_by(name:)
        value = parsed_response.detect{|a| a.name == name}.text
        raise RuntimeError, "Response has no value for series element: #{name}" unless value.present?
        value
      end

  end
end
