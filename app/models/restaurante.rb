class Restaurante < ApplicationRecord
  # named_scope :massas, :conditions => { :especialidade => ’massas’ }
  # named_scope :recentes, :conditions => [ "created_at > ?", 3.months.ago ]
  # named_scope :pelo_nome, :order => ’nome’
  
  has_many :qualificacoes
  has_many :comentarios, :as => :comentavel
  has_and_belongs_to_many :pratos
  
  has_attached_file :foto, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :foto, content_type: /\Aimage\/.*\z/

  validates_presence_of :nome, :message => "deve ser preenchido"
  validates_presence_of :endereco, :message => "deve ser preenchido"
  validates_presence_of :especialidade, :message => "deve ser preenchida"

  validates_uniqueness_of :nome, :message => "nome já cadastrado"
  validates_uniqueness_of :endereco, :message => "endereço já cadastrado"

  validate :primeira_letra_deve_ser_maiuscula

  private
  def primeira_letra_deve_ser_maiuscula
    errors.add("nome", "primeira letra deve ser maiúscula") unless nome =~ /[A-Z].*/
  end
end
