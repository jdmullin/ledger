# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
Ledger::Application.config.secret_key_base = '4ff8511540d20927ba2d65430c6f861245b045079240f155a47b5971f8efd57022c9409803e824b082790ff496b176d314601410fce685c606bc4318f728d138'
