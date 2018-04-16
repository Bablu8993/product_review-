module ApplicationHelper

  def update_usercount(email, product_name, product)
    if UserProduct.find_by(user_email: email, product_name: product_name).nil?
        UserProduct.create(:user_email => email, :product_name => product_name) 
        count = product.user_count + 1
        product.update_attributes(:user_count => count)
    end
  end  
end
