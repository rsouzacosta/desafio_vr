require 'httparty'
require 'json'
require 'rspec/expectations'
include RSpec::Matchers

# Este módulo define um cliente para interagir com a API VR usando HTTParty
module VRAPIClient
  include HTTParty
  base_uri 'https://portal.vr.com.br/api-web/comum/enumerations/VRPAT'

  # Método para obter a resposta da API
  def self.get_response
    get('')
  end
end

# Passo Given: Enviar uma solicitação para a API VR
# Este passo faz a requisição para a API VR e armazena a resposta.
Given('que envio uma solicitação para a API VR') do
  # Obtendo a resposta da API e parseando o JSON
  # O método get_response do módulo VRAPIClient para obter a resposta da API
  @response = VRAPIClient.get_response
  # O método JSON.parse para converter a resposta JSON em um objeto Ruby.
  @parsed_response = JSON.parse(@response.body)
end

# Passo Then: Verificar se a resposta contém a chave 'typeOfEstablishment'
# Este passo verifica se a chave 'typeOfEstablishment' está presente na resposta JSON.
Then('a resposta deve conter a chave {string}') do |key|
  # Verificando se a chave está presente no JSON retornado
  # O método expect do RSpec para verificar se a chave especificada está presente no objeto JSON
  # O método have_key é um matcher do RSpec que verifica a presença de uma chave em um hash.
  expect(@parsed_response).to have_key(key)
end

# Passo And: Imprimir aleatoriamente um tipo de estabelecimento
# Este passo imprime um tipo de estabelecimento aleatoriamente.
Then('eu imprimo um tipo de estabelecimento aleatoriamente') do
  # Obtendo os tipos de estabelecimentos e imprimindo um aleatoriamente
  # Obtendo array de tipos de estabelecimentos a partir do JSON 
  types_of_establishments = @parsed_response['typeOfEstablishment']
  # O método sample para selecionar um elemento aleatoriamente
  random_type = types_of_establishments.sample
  # Imprimi o tipo de estabelecimento selecionado aleatoriamente.
  puts "Tipo Aleatório de Estabelecimento: #{random_type}"
end