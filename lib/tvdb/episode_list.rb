require 'zip'

module Tvdb
  class EpisodeList
    def self.api_key
      "85C5C161A73B6F12"
    end

    def self.fetch_by(series_id:)
      response = RestClient.get "http://thetvdb.com/api/#{api_key}/series/#{series_id}/all/en.zip"
      new(response)
    end

    include Enumerable

    attr_reader :episodes

    def initialize(response)
      @episodes ||= parsed_episodes(response).map do |episode_data|
        Tvdb::Episode.new(episode_data.to_xml)
      end
      nil
    end

    def each(&block)
      episodes.each do |episode|
        block.call(episode)
      end
    end

    private

      def episode_zip_content(response)
        ::Zip::File.open_buffer(response) do |zip_files|
          return zip_files.detect{|a| a.name = "en.xml"}.get_input_stream.read
        end
      end

      def parsed_episodes(response)
        @parsed_episodes ||= Nokogiri::XML(episode_zip_content(response)).xpath("//Data/Episode")
      end
  end
end
