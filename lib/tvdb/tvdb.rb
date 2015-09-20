module Tvdb

  class << self

    def api_key
      @api_key || "85C5C161A73B6F12"
    end

    def mirror_path
      "http://thetvdb.com/api/"
    end
  end

  def previous_time
    1442668036
  end
end
