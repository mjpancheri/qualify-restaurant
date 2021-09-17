class Receita < ApplicationRecord
  belongs_to :prato
  
  validates_presence_of :prato_id
  validades_associated :prato
  
  validates_presence_of :conteudo, :message => " - deve ser preenchido"
end
