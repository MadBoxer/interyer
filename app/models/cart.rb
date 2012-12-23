class Cart
  attr_reader :items
  attr_reader :total_price
  
  def initialize
    @items = []
    @total_price = 0.00
  end
  
  def add_to_cart(product)
    existing_item = @items.find { |item| item.product_id == product.id}
    if existing_item
      existing_item.quantity += 1
    else
      @items << CartItem.new_based_on(product)
    end
    @total_price += product.price.to_f
  end
  
  def delete_from_cart(product)
    @items.delete(@items.find{|i| i.product_id == product.id})
=begin
    @items.each_index do |index|
      if @items[index].product_id == product.id
        @items.delete_at index
        if @items.length == 0
          @total_price = 0.0
        end
      end
    end
=end
    reset_total_price
  end
  
  def clear
    @items = []
    @total_price = 0.00
  end

  def reset_cart(params)
    params.each_pair do |key, val|
      @items.find {|item| item.product_id == key.to_i}.quantity = val
    end
    reset_total_price
  end
  
  private #---------------

  def reset_total_price
    @total_price = @items.inject(0.00){|sum, item| sum += item.product.price.to_f*item.quantity}.to_i
  end
  
end
