class Payment < ActiveRecord::Base

  belongs_to :user
  attr_accessor :card_number, :card_cvv, :card_expires_month, :card_expire_year


  def self.month_options
    Date::MONTHNAMES.compact.each_with_index.map{ |name, i| ["#{i+1} - #{name}", i+1]}
  end

  def self.year_options
    (Date.today.year..(Date.today.year+10)).to_a
  end

  def process_payment
    curstomer = Stripe::Curstomer.create email:email,card:token

    stripe::Charge.create customer: customer.id, amount:1000,
    description: 'Premium',
        currency: 'usd'
  end
end
