require "securerandom"

class Url < ActiveRecord::Base
	validates :long_url, presence: true
	validates :long_url, uniqueness: true

	# This is Sinatra! Remember to create a migration!
	def shorten
		self[:short_url] = SecureRandom.urlsafe_base64(5)
	end

end
