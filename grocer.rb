require 'pry'
def consolidate_cart(cart)
  new_hash = {}
    cart.each do |item|
     item.each do |name, v|
       
       if new_hash.include?(name)
          new_hash[name][:count] += 1
       else
        new_hash[name] = {}
        new_hash[name] = v 
          new_hash[name][:count] = 1
            
        
      end
    end
   end 
   new_hash
end

def apply_coupons(cart, coupons)

idx = 0
while idx < coupons.length

  temp = {}
    c_name = coupons[idx][:item].to_s
    c_num = coupons[idx][:num].to_i
    c_cost = coupons[idx][:cost].to_i


    cart.each do |name, info|
       if cart.include?("#{name} W/COUPON") && info[:count] >= c_num
         cart["#{name} W/COUPON"][:count] += 1
         info[:count] -= c_num
         
        
      elsif name == c_name && info[:count] >= c_num
        info[:count] -= c_num
        temp["#{name} W/COUPON"] = {}
        temp["#{name} W/COUPON"][:price] = c_cost
        temp["#{name} W/COUPON"][:clearance] = info[:clearance]
             temp["#{name} W/COUPON"][:count] = 1
        
      end
    end
    new_cart = cart.merge!(temp)
    new_cart = {}
    idx += 1
  end
     cart
end



def apply_clearance(cart)
  cart.each do |item, data|
    if data[:clearance] == true
      data[:price] = (data[:price] * 0.8).round(2)
   end
  end
  cart
end

def checkout(cart, coupons)
  items = []
  total = 0
  coupons = coupons.length
    cart.each do |item|
      items = item.keys
    end
  
    if items.length == 1 && coupons == 0
      consolidate_cart(cart)
        
        cart.each do |k, v|
          binding.pry
          total += v[:price]
          
        end 
        
    else    
    end 
end












