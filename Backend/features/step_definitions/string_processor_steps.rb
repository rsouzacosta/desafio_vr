require_relative '../../lib/string_processor'  # Importa a função do arquivo string_processor.rb
require 'rspec/expectations'               # Importa as asserções do RSpec
include RSpec::Matchers                    # Inclui os matchers do RSpec

# Step: Given a string de entrada {string}
Given('a string de entrada {string}') do |input_string|
  # Armazena a string de entrada na variável de instância
  @input_string = input_string  
end

# Step: And os marcadores {string}
Given('os marcadores {string}') do |markers|
  # Converte a string de marcadores para um array
  # Usa gsub para remover os colchetes [ e ] da string
  # Dividi a string com split(', ') e remove as aspas " de cada marcador com map.
  @markers = markers.gsub('[', '').gsub(']', '').split(', ').map { |m| m.tr('"', '') }
end

# Step: Then a saída esperada é {string}
Then('a saída esperada é {string}') do |expected_output|
  # Chama a função para processar a string de entrada com os marcadores fornecidos
  actual_output = remove_text_after_markers(@input_string, @markers)
  # Verifica se a saída real é igual à saída esperada usando o expect
  expect(actual_output).to eq(expected_output)
end