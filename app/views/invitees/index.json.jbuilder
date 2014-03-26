json.array!(@invitees) do |invitee|
  json.extract! invitee, :id, :email
  json.url invitee_url(invitee, format: :json)
end
