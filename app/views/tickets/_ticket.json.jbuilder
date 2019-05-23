json.extract! ticket, :id, :created_at, :updated_at
json.url user_url(ticket, format: :json)