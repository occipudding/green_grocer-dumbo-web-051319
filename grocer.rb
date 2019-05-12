require 'pry'

def consolidate_cart(cart)
  new_cart = {}
  cart.each do |h|
    h.each do |k, v|
      if !new_cart.key?(k)
        new_cart[k] = v.clone
        new_cart[k][:count] = 1
      else
        new_cart[k][:count] += 1
      end
    end
  end
  new_cart
end

def apply_coupons(cart, coupons)
  binding.pry
end

def apply_clearance(cart)
  # code here
end

def checkout(cart, coupons)
  # code here
end

#consolidate_cart([{"AVOCADO"=>{:price=>3.0, :clearance=>true}}, {"AVOCADO"=>{:price=>3.0, :clearance=>true}}, {"KALE"=>{:price=>3.0, :clearance=>false}}])

apply_coupons({"CHEESE"=>{:price=>6.5, :clearance=>false, :count=>4},
 "AVOCADO"=>{:price=>3.0, :clearance=>true, :count=>3}}, )