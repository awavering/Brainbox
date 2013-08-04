class PasswordsController < Devise::PasswordsController
  layout "pre_auth"
end