require 'pry'

def consolidate_cart(cart)
  new_hash = {}
  cart.each do |item|
    item.each do |item_name, item_data|
      if new_hash.key?(item_name)
        new_hash[item_name][:count] += 1
      else
        new_hash[item_name] = item_data
        new_hash[item_name][:count] = 1
      end
    end
  end
  new_hash
end

def apply_coupons(cart, coupons)
  def apply_coupon(cart, coupon)
    item_with_coupon = "#{coupon[:item]} W/COUPON"
    if !cart.key?(item_with_coupon)
      cart[item_with_coupon] = cart[coupon[:item]].clone
      cart[item_with_coupon][:count] = 0
    end
    cart[item_with_coupon][:count] += 1
    cart[item_with_coupon][:price] = coupon[:cost]
    cart[coupon[:item]][:count] -= coupon[:num]
    cart
  end
  if coupons.kind_of?(Array)
    if !coupons.any? {|coupon| cart.keys.include?(coupon[:item])}
      return cart
    end
  else
    if !cart.keys.include?(coupons[:item])
      return cart
    end
  end
  coupons.kind_of?(Array) ? coupons.each {|coupon| apply_coupon(cart, coupon)} : apply_coupon(cart, coupons)
  cart
end

def apply_clearance(cart)
  cart.each do |item, data|
    if data[:clearance] == true
      data[:price] = data[:price] - (data[:price] * 0.2)
    end
  end
end

=begin
def checkout(cart, coupons)
  total = 0
  apply_coupons(cart, coupons)
  apply_clearance(cart)
  cart.each do |item, data|
    total += data[:price] * data[:count]
  end
  if total > 100
    total = total - (total * 0.1)
  end
  binding.pry
  total
end
=end

def checkout(cart, coupons)
  binding.pry
end

checkout(consolidate_cart({
  "AVOCADO" => {:price => 3.0, :clearance => true, :count => 3},
  "KALE"    => {:price => 3.0, :clearance => false, :count => 1}
}, {:item => "AVOCADO", :num => 2, :cost => 5.0})