json.array!(@wines) do |wine|
  json.extract! wine, :id, :brand_id, :variety_id
  json.url wine_url(wine, format: :json)
end
