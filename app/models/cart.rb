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
    @items.each_index do |index|
      if @items[index].product_id == product.id
        @items.delete_at index
        if @items.length == 0
          @total_price = 0.0
        end
      end
    end
  end
  
  private #---------------
  
end
