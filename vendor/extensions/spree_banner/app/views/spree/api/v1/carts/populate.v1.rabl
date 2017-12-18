object false
node(:error) { |order| @error }
node(:items_count) { |order| @order.line_items.count }