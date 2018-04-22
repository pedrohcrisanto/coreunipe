require 'test_helper'

class TriagemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @triagem = triagems(:one)
  end

  test "should get index" do
    get triagems_url
    assert_response :success
  end

  test "should get new" do
    get new_triagem_url
    assert_response :success
  end

  test "should create triagem" do
    assert_difference('Triagem.count') do
      post triagems_url, params: { triagem: { desc_hist_medic: @triagem.desc_hist_medic, desc_hist_tratamento: @triagem.desc_hist_tratamento, estado_paciente: @triagem.estado_paciente, nome_paciente: @triagem.nome_paciente, psicoterapia: @triagem.psicoterapia, queixa: @triagem.queixa } }
    end

    assert_redirected_to triagem_url(Triagem.last)
  end

  test "should show triagem" do
    get triagem_url(@triagem)
    assert_response :success
  end

  test "should get edit" do
    get edit_triagem_url(@triagem)
    assert_response :success
  end

  test "should update triagem" do
    patch triagem_url(@triagem), params: { triagem: { desc_hist_medic: @triagem.desc_hist_medic, desc_hist_tratamento: @triagem.desc_hist_tratamento, estado_paciente: @triagem.estado_paciente, nome_paciente: @triagem.nome_paciente, psicoterapia: @triagem.psicoterapia, queixa: @triagem.queixa } }
    assert_redirected_to triagem_url(@triagem)
  end

  test "should destroy triagem" do
    assert_difference('Triagem.count', -1) do
      delete triagem_url(@triagem)
    end

    assert_redirected_to triagems_url
  end
end
