json.array!(@reviews) do |review|
  json.extract! review, :id, :author, :body, :swords
  json.url review_url(review, format: :json)
end
