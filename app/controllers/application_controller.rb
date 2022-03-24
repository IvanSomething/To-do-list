# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # before_action :signed_in

  def signed_in
    redirect_to new_user_session_path if user_signed_in?
  end
end
