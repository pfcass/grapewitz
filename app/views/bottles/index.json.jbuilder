json.array!(@bottles) do |bottle|
  json.extract! bottle, :id, :quantity, :price, :rating, :comment, :wine_id, :store_id
  json.url bottle_url(bottle, format: :json)
end
