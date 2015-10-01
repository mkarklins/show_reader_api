json.series @series, partial: 'api/v1/series/show', as: :series_item
json.total_count @series.count
