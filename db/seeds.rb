# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

include JSON
file = File.open('sample_data.json')
data = JSON.parse(file.read)
# # p JSON.pretty_generate(data)
# p data['RECORDS'].count

data['RECORDS'].each do |child|
  @product = Product.find_by(name: child['product_name'])
  @product = Product.create(name: child['product_name']) if @product.nil?

  @customer = Customer.find_by(email: child['email'])
  if @customer.nil?
    @customer = Customer.create(email: child['email'], city: child['city'],
                                state: child['state'], country: child['country'])
  end
  @subscription = Subscription.create(billing_type: child['billing_type'],
                                      platform: child['platform'],
                                      subscribed_at: child['subscribed_at'])
  @product.subscriptions << @subscription
  @customer.subscriptions << @subscription
end

