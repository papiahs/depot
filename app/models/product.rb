class Product < ActiveRecord::Base
  validates :title, :description, :img_url, :precio, :presence => true
  validates :precio, :numericality => {:greater_than_or_equal_to => 0.01}
  validates :title, :uniqueness => true
  validates :img_url, :format => {
    :with => %r{\.(gif|jpg|png|jpeg)$}i,
    :message => 'Debe ser una url valida de una imagen gif, jpg o png'
  }
end
