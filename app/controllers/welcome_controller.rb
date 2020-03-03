# This class is for welcome page controller.
# class WelcomeController 
class WelcomeController < ApplicationController
  skip_before_action :authenticate_user!

  def index; end
end
