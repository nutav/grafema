class WelcomeController < ApplicationController

  def index
    @categories = Category.all
  end

  def contacts
  end

end