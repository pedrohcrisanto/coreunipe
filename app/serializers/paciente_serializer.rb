class PacienteSerializer < ActiveModel::Serializer
  attributes :id, :nome, :cep, :complemento, :telefone, :email, :data_nasc, :sexo, :escolaridade, :naturalidade, :estado_civil, :filhos, :qnt_filhos, :profissao, :religiao, :pm, :matricula, :rg, :graduacao, :unidade, :subunidade
end
