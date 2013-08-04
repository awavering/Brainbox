class RegistrationsController < Devise::RegistrationsController
  layout :dynamic_layout

  def dynamic_layout
    case action_name
    when "new"
      "pre_auth"
    else
      "application"
    end
  end
end