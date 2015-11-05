class User < ActiveRecord::Base
	has_many :articals
	validates :gender, presence: true
end
