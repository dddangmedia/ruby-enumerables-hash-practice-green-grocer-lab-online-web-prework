require 'pry'

def consolidate_cart(array)
  cart = {}
  array.each_with_index do |item, i|
    item.each do |food, info|
      if cart[food]
        cart[food][:count] += 1
      else
        cart[food] = info
        cart[food][:count] = 1
      end
    end
  end
  cart
end

def apply_coupons(cart, coupons)
  item = coupon[:item]
  coupons.each do |coupon|
    if cart.keys.include?(coupon[:item]) 
      binding.pry
      if cart[item][:count] >= coupon[:num] && !cart["#{item} W/COUPON"]
        cart["#{cart.keys} W/COUPON"] = {
          :price => coupon[:price]
        }
         
      else
        cart["#{cart.keys} W/COUPON"] = {
          :price => coupon[:cost] / cart.values[:count], 
          :clearance => cart.values[:clearance], 
          :count => coupon[:num]
        }
      end
      cart[:count] -= coupon[:num]
    end   
  end
  cart
end