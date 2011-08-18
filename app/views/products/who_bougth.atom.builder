atom_feed do |feed|
	feed.title "Quien compro #{@product.title}"
	
	latest_order = @product.orders.sort_by(&:updated_at).last
	feed.updated(latest_order && latest_order.updated_at)
	
	@product.orders.each do |o|
		feed.entry(o) do |e|
			e.title  "Order #{o.id}"
			e.summary :type => "xhmtl" do |xhtml|
				xhtml.p "Shipped to #{o.address}"
				
				xhtml.table do 
					xhtml.tr do
						xhtml.th 'Producto'
						xhtml.th 'Cantidad'
						xhtml.th 'Precio total'						
					end
					for item in order.line_items
						xhtml.tr do
							xhtml.td item.product.title
							xhtml.td item.q
							xhtml.td item.total_price
						end 
					end
					xhtml.tr do
						xhtml.th "Total", :colspan=>2
						xhtml.th number_to_currency(order.line_items.map(&:total_price).sum)
					end
				end 
				
				xhtml.p "Paga en #{order.pay_type}"				
			end
			e.author do |a|
				a.name order.name
				a.email order.email
			end 
		end
	end 
end