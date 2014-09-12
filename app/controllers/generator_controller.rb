
class GeneratorController < ApplicationController

  def index
  end

  def new


  end

  def show

  	hoards = params.has_key?(:hoards) ? param[:hoards].to_i : 1
  	
  	unit_size = params.has_key?(:unit_size) ? params[:unit_size].to_i : 100

  	random_hoard_size = params.has_key?(:random_hoard_size) ? 
  		false : params[:random_hoard_size]

  	random_hoard_values = params.has_key?(:random_hoard_values) ? params[:random_hoard_values] : false 

  	treasure_units = Treasure.hoard_size

  	if params.has_key?(:units) and not params.has_key?(:random_hoard_size)
  		treasure_units = params[:units].to_i
  	end

  	hoards =  hoards.times.collect do |hoard|
  		if random_hoard_values
  			unit_size *= Trasure.base_value_of_hoard_multiplier
  		end
  		Treasure.generate(treasure_units, unit_size)
  	end
  	
  	@treasure = { :hoards => hoards }

  	@treasure[:total] = @treasure[:hoards].inject(0) { |sum, x| sum + x[:total] }

  	respond_to do |format|
  		format.html
  		format.json { render json: @treasure }
		end

  end

end
