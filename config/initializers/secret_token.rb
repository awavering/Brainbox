# Be sure to restart your server when you modify this file.

# Your secret key for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!
# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.

def replace_me
  puts "Hello!  Please generate your own secret token by editing secret_token.rb.  Replace this call with the output of 'rake secret'."
  exit
end

Brainbox::Application.config.secret_key_base = '43315eeecea4df801549f1690aa57227598eb6f97214060f35347461abee6690ec0e07b65bb9bb07044012fb192424bce95ef96176c73099597dcf772dee22fa'