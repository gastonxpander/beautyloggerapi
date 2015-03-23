class User < ActiveRecord::Base
	has_many :products, dependent: :destroy
	has_secure_password
end
