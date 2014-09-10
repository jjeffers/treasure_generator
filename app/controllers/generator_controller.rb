
class GeneratorController < ApplicationController
  def index
  end

  def new
  end

  def show

  	parcels = params.has_key?(:parcels) ? param[:parcels].to_i : 1
  	
  	unit_size = params.has_key?(:unit_size) ? params[:unit_size].to_i : 100
  	random_hoard_size = params.has_key?(:random_hoard_size) ? 
  		false : params[:random_hoard_size]
  	
  	treasure_units = Treasure.hoard_size

  	if params.has_key?(:units) and not params.has_key?(:random_hoard_size)
  		treasure_units = params[:units].to_i
  	end

  	@treasure = { :parcels => 
  		parcels.times.collect { Treasure.generate(treasure_units, unit_size) } }

  	@treasure[:total] = @treasure[:parcels].inject(0) { |sum, x| sum + x[:total] }

  	respond_to do |format|
  		format.html
  		format.json { render json: @treasure }
		end

  end

end
