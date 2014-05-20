# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
require 'securerandom'

def secure_token
  token_file = Rails.root.join('.secret')
  if File.exist?(token_file)
    # use the existing token
    File.read(token_file).chomp
  else
    # Generate new token and store it in token_file
    token = SecureRandom.hex(64)
    File.write(token_file, token)
    token
  end
end

#TemplateSite::Application.config.secret_key_base = 'e07323ebf14f4f1c52e100b36554d8ef23a81c392d9dfbe27da19d4872b5468c9d9ea0f24442bdece8fc0b3d805742d0a35fe41f2febc5814fa28f9f5949e17e'
TemplateSite::Application.config.secret_key_base = secure_token
