class CatsController < ApplicationController

  def index
    @cats = Cat.all
    # fail
  end
end
