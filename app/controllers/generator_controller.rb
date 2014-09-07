class GeneratorController < ApplicationController
  def index
  end

  def new
  end

  def show
  end

  def create
  	@treasure = TreasureGenerator.generate
  end

end
