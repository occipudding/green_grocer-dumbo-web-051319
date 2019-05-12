require 'pry'

def consolidate_cart(cart)
  new_cart = {}
  cart.each do |h|
    binding.pry
  end
end

def apply_coupons(cart, coupons)
  # code here
end

def apply_clearance(cart)
  # code here
end

def checkout(cart, coupons)
  # code here
end

#consolidate_cart([{"AVOCADO"=>{:price=>3.0, :clearance=>true}}, {"AVOCADO"=>{:price=>3.0, :clearance=>true}}, {"KALE"=>{:price=>3.0, :clearance=>false}}])
