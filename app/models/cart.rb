class Cart < ActiveRecord::Base
  has_many :line_items, :dependent => :destroy
  
  def add_product(p_id)
    c_i= line_items.where(:product_id => p_id).first
    if c_i
      c_i.q += 1
    else
      c_i = LineItem.new(:product_id => p_id)
      line_items << c_i
    end
    c_i
  end
  
  def total_price
    line_items.to_a.sum {|item| item.total_price}
  end
  
  def total_items
    line_items.sum(:q)
  end
end
