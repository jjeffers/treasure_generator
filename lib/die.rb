require "dicebag"
require "simple-random"

module Die

	def roll(str)
		DiceBag::Roll.new(str).result().total
	end

	module_function :roll


	def random_value(mean)
		sr = SimpleRandom.new
		sr.set_seed(Time.now)
		sr.normal(mean, 10).to_i

	end

	module_function :random_value
end
