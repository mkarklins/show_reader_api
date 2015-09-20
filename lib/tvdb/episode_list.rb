require 'zip'

module Tvdb
  class EpisodeList
    def self.api_key
      "85C5C161A73B6F12"
    end

    def self.fetch_by(series_id:)
      response = RestClient.get "http://thetvdb.com/api/#{api_key}/series/#{series_id}/all/en.zip"

      ::Zip::File.open_buffer(response) do |zip_files|
        zip_files.detect{|a| a.name = "en.xml"}.get_input_stream.read.each do |episode_data|
          yield(Tvdb::Episode.new(episode_data))
        end
      end
    end
  end
end
