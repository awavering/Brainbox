class SessionsController < Devise::SessionsController
  layout "pre_auth"
end