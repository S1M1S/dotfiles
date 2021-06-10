module ShopHelper
	def item_stock_to_json(item)
		stocks = {}

		item.stocks.each do |stock|
			fit = stock.fit
			size = stock.size
			stocks[fit.id] ||= { name: fit[:name], sizes: {} }
			stocks[fit.id][:sizes][size.id] = { name: size[:name], quantity: stock[:quantity] }
		end

		stocks.to_json.html_safe
	end
end
