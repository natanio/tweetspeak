class Language < ActiveRecord::Base

	has_many :users
	has_many :definitions, through: :users

	def name=(s)
    	write_attribute(:name, s.to_s.titleize) # The to_s is in case you get nil/non-string
  	end
end