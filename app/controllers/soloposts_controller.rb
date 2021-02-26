class SolopostsController < ApplicationController
  def index
    @soloposts = Solopost.all
  end
end
