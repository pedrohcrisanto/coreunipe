json.extract! address, :id, :street, :district, :number, :zip, :city, :state, :created_at, :updated_at
json.url address_url(address, format: :json)
