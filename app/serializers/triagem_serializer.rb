class TriagemSerializer < ActiveModel::Serializer
  attributes :id, :nome_paciente, :desc_hist_tratamento, :desc_hist_medic, :psicoterapia, :queixa, :estado_paciente
end
