# O método que recebe uma string e um array de marcadores
def remove_text_after_markers(input_string, markers)
    # Itera sobre cada marcador presente no array
    markers.each do |marker|
      # Para cada marcador, dividi a string no ponto onde o marcador aparece
      # e pega apenas a primeira parte da divisão
      input_string = input_string.split(marker).first
    end
    # Retorna a string resultante, removendo espaços em branco extras
    input_string.strip
end