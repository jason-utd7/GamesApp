json.extract! game, :id, :title, :release_date, :description, :created_at, :updated_at
json.url movie_url(game, format: :json)
