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
  new_cart = cart.clone
  coupons.collect do |coupon|
    item_with_coupon = "#{coupon[:item]} W/COUPON"
    binding.pry
    if new_cart.key?(coupon[:item]) && new_cart[coupon[:item]][:count] >= coupon[:num]
      new_cart[coupon[:item]][:count] -= coupon[:num]
      if new_cart.key?(item_with_coupon)
        new_cart[item_with_coupon][:count] += 1
      else
        new_cart[item_with_coupon] = new_cart[coupon[:item]].clone
        new_cart[item_with_coupon][:price] = coupon[:cost]
        new_cart[item_with_coupon][:count] = 1
      end
      if new_cart[coupon[:item]][:count] == 0
        new_cart.delete(coupon[:item])
      end
    end
  end
  new_cart
end

def apply_clearance(cart)
  # code here
end

def checkout(cart, coupons)
  # code here
end

#consolidate_cart([{"AVOCADO"=>{:price=>3.0, :clearance=>true}}, {"AVOCADO"=>{:price=>3.0, :clearance=>true}}, {"KALE"=>{:price=>3.0, :clearance=>false}}])

#apply_coupons({"CHEESE"=>{:price=>6.5, :clearance=>false, :count=>4}, "AVOCADO"=>{:price=>3.0, :clearance=>true, :count=>3}}, [{:item=>"AVOCADO", :num=>2, :cost=>5.0}, {:item=>"CHEESE", :num=>3, :cost=>15.0}])