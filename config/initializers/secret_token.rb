# Be sure to restart your server when you modify this file.

# Your secret key for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!
# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.

def replace_me
  puts "Hello!  Please generate your own secret token by editing secret_token.rb.  Replace this call with the output of 'rake secret'."
  exit
end

Brainbox::Application.config.secret_key_base = replace_me