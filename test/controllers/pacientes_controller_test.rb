require 'test_helper'

class PacientesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @paciente = pacientes(:one)
  end

  test "should get index" do
    get pacientes_url
    assert_response :success
  end

  test "should get new" do
    get new_paciente_url
    assert_response :success
  end

  test "should create paciente" do
    assert_difference('Paciente.count') do
      post pacientes_url, params: { paciente: { cep: @paciente.cep, complemento: @paciente.complemento, data_nasc: @paciente.data_nasc, email: @paciente.email, escolaridade: @paciente.escolaridade, estado_civil: @paciente.estado_civil, filhos: @paciente.filhos, graduacao: @paciente.graduacao, matricula: @paciente.matricula, naturalidade: @paciente.naturalidade, nome: @paciente.nome, pm: @paciente.pm, profissao: @paciente.profissao, qnt_filhos: @paciente.qnt_filhos, religiao: @paciente.religiao, rg: @paciente.rg, sexo: @paciente.sexo, subunidade: @paciente.subunidade, telefone: @paciente.telefone, unidade: @paciente.unidade } }
    end

    assert_redirected_to paciente_url(Paciente.last)
  end

  test "should show paciente" do
    get paciente_url(@paciente)
    assert_response :success
  end

  test "should get edit" do
    get edit_paciente_url(@paciente)
    assert_response :success
  end

  test "should update paciente" do
    patch paciente_url(@paciente), params: { paciente: { cep: @paciente.cep, complemento: @paciente.complemento, data_nasc: @paciente.data_nasc, email: @paciente.email, escolaridade: @paciente.escolaridade, estado_civil: @paciente.estado_civil, filhos: @paciente.filhos, graduacao: @paciente.graduacao, matricula: @paciente.matricula, naturalidade: @paciente.naturalidade, nome: @paciente.nome, pm: @paciente.pm, profissao: @paciente.profissao, qnt_filhos: @paciente.qnt_filhos, religiao: @paciente.religiao, rg: @paciente.rg, sexo: @paciente.sexo, subunidade: @paciente.subunidade, telefone: @paciente.telefone, unidade: @paciente.unidade } }
    assert_redirected_to paciente_url(@paciente)
  end

  test "should destroy paciente" do
    assert_difference('Paciente.count', -1) do
      delete paciente_url(@paciente)
    end

    assert_redirected_to pacientes_url
  end
end
