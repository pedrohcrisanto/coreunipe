json.extract! paciente, :id, :nome, :cep, :complemento, :telefone, :email, :data_nasc, :sexo, :escolaridade, :naturalidade, :estado_civil, :filhos, :qnt_filhos, :profissao, :religiao, :pm, :matricula, :rg, :graduacao, :unidade, :subunidade, :created_at, :updated_at
json.url paciente_url(paciente, format: :json)
