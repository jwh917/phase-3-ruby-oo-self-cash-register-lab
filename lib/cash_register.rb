class CashRegister
  attr_reader :discount
  attr_accessor :total, :items, :last_transaction

  # setter method
  def initialize(discount = 0)
    @discount = discount
    @total = 0
    @items = []
    @last_transaction = {
      :title => "",
      :price => 0,
      :quantity => 1
    }
  end

  def add_item(title, price, quantity = 1)
    quantity.times { items << title }
    @total += price * quantity 
    @last_transaction = {
      :title => title,
      :price => price,
      :quantity => quantity
    }
  end

  def apply_discount
    if @discount == 0
      "There is no discount to apply."
    else
      perc_discount = @discount / 100.to_f 
      discount_total = @total * perc_discount
      @total = @total - discount_total
      "After the discount, the total comes to $#{total.to_i}."
    end
  end

  def void_last_transaction
    # remove @last_transaction[:title] of @last_transaction[:quantity] from items array
    @total -= @last_transaction[:price] * @last_transaction[:quantity]
  end

end

