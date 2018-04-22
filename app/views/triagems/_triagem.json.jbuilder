json.extract! triagem, :id, :nome_paciente, :desc_hist_tratamento, :desc_hist_medic, :psicoterapia, :queixa, :estado_paciente, :created_at, :updated_at
json.url triagem_url(triagem, format: :json)
