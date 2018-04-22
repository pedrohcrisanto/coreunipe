json.extract! person, :id, :full_name, :birth_date, :cpf, :home_phone, :mobile_phone, :rg, :address_id, :created_at, :updated_at
json.url person_url(person, format: :json)
