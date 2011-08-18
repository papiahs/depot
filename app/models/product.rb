class Product < ActiveRecord::Base
  default_scope :order =>'title'
  has_many :line_items
  has_many :orders, :through => :line_items
  
  before_destroy :ensure_not_referenced_by_any_line_item
  
  validates :title, :description, :img_url, :precio, :presence => {:message => 'No puede estar vacio'}
  validates :precio, :numericality => {:greater_than_or_equal_to => 0.01}
  validates :title, :uniqueness => true
  validates :img_url, :format => {
    :with => %r{\.(gif|jpg|png|jpeg)$}i,
    :message => 'Debe ser una url valida de una imagen gif, jpg o png'
  }
  
  def ensure_not_referenced_by_any_line_item
    if line_items.count.zero?
      return true
    else
      errors[:base] << "Tiene registros en LineItems"
      return false
    end
  end
  
end
