# frozen_string_literal: true

class WelcomeController < ApplicationController
  def index
    @my_name = my_name
  end
end

def my_name
  cookies[:my_name] ||= 'leandro'
  # session[:my_name] ||= 'leandro'
end
