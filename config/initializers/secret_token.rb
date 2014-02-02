# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
# PainApp::Application.config.secret_key_base = '1ed91d45ea45aee4f0a61b1f11d3904f618d19776b2c1059b5d302487af7ead305e79a2c4b3f415dc3bb3561afe771311860de156162aece7236f4108023f311'
require 'securerandom'

def secure_token
	token_file = Rails.root.join('.secret')
	if File.exist?(token_file)
		#Use the existing token.
		File.read(token_file).chomp
	else
		# generate a new token and store it in the token_file.
		token = SecureRandom.hex(64)
		File.write(token_file, token)
		token 
		
	end
	
end
PainApp::Application.config.secret_key_base = secure_token