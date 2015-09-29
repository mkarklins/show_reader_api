class Episode::Create < Struct.new(:tvdb_episode)
  def self.call(*args)
    new(*args).call
  end

  def call
    Episode.create!(
      series_id: tvdb_episode.series_id,
      episode_id: tvdb_episode.episode_id,
      name: tvdb_episode.name,
      number: tvdb_episode.number,
      first_aired_at: tvdb_episode.first_aired_at,
      guest_stars: tvdb_episode.guest_stars,
      description: tvdb_episode.description,
      banner_path: tvdb_episode.banner_path,
      season_id: tvdb_episode.season_id,
      thumb_height: tvdb_episode.thumb_height,
      thumb_width: tvdb_episode.thumb_width,
      director: tvdb_episode.director,
      imdb_id: tvdb_episode.imdb_id,
    )
  end
end
