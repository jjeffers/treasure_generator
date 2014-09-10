require "die"

class Art < Treasure

	@@art_values = [0.001, 0.05, 0.25, 1, 10, 25, 50, 75, 100, 150, 200, 300, 400, 
		500, 750, 1000, 1500, 2000, 3000, 4000, 5000, 7500, 10000, 20000, 40000, 80000,
		150000, 250000, 400000, 800000, 1000000]

	def initialize(value)
    super
    @ttype = "art"

		value_adjustment = 0
		@value = value

		Rails.logger.info @value
		@descriptions << art_treasure_type

		art_value = art_value_base
		@descriptions  << art_value[0]
		value_adjustment += art_value[1]

		artist = artist_reknown
		@descriptions  << artist[0]
		value_adjustment += artist[1]

		quality = art_quality
		@descriptions  << quality[0]
		value_adjustment += quality[1]

		age = art_age
		@descriptions  << age[0]
		value_adjustment += age[1]

		size = art_size
		@descriptions  << size[0]
		value_adjustment += size[1]

		craftsmanship = art_craftmanship
		@descriptions  << craftsmanship[0]
		value_adjustment += craftsmanship[1]

		condition = art_condition
		@descriptions  << condition[0]
		value_adjustment += condition[1]

		art_value_index = @@art_values.find_index(
			@@art_values.min { |a,b| (a-@value).abs <=> (b-@value).abs })
		
		art_value_index += value_adjustment
		@value = Die::random_value(@@art_values[art_value_index])

  end 

  def art_treasure_type(roll=Die::roll("1d20"))
		case roll
		when 1..2
			"paper art"
		when 3..4
			"fabric art"
		when 5..6
			"painting"
		when 7..8
			"crafts"
		when 9..10
			"carving"
		when 11..12
			"ceramics"
		when 13..14
			"glasswork"
		when 15..17
			"stonework"
		when 18..19
			"metalwork"
		when 20
			"magical"
		end
	end

	def art_value_base(roll=Die::roll("1d20"))
		case roll
		when 1
			["abstract",-2]
		when 2
			["monster",-1]
		when 3
			["humanoid",0]
		when 4..5
			["natural",0]
		when 6
			["supernatural",0]
		when 7..9
			["local",0]
		when 10..12
			["historical",0]
		when 13..17
			["religious",0]
		when 18..19
			["wealthy/noble",1]
		when 20
			["royalty", 2]
		end
	end

	def artist_reknown(roll=Die::roll("1d100"))
		case roll
		when 1..15
			["unknown artist",-3]
		when 16..30
			["obscure artist",-2]
		when 31..50
			["locally known artist",-1]
		when 51..70
			["regionally known artist",0]
		when 71..90
			["nationally known artist",1]
		when 91..95
			["continentally known artist",2]
		when 96..99
			["world reknown artist",3]
		when 100
			["ubiquitous artist", 4]
		end
	end

	def art_quality(roll=Die::roll("1d100"))
		case roll
		when 1..5
			["awful quality",-3]
		when 5..10
			["poor quality",-2]
		when 11..25
			["below average quality",-1]
		when 26..65
			["average quality",0]
		when 66..85
			["above average quality",1]
		when 86..90
			["good quality",2]
		when 91..95
			["excellent quality",3]
		when 96..98
			["finest quality",4]
		when 99..100
			["unqique quality", 5]
		end
	end

	def art_age(roll=Die::roll("1d100"))
		case roll
		when 1..10
			["avante-garde", -3]
		when 11..20
			["current", -2]
		when 21..50
			["recent", -1]
		when 51..63
			["contemporary", 0]
		when 64..73 
			["modern", 1]
		when 74..82
			["old", 2]
		when 83..90
			["antique", 3]
		when 91..95
			["venerable",4]
		when 96..97
			["archaic", 5]
		when 98..99
			["antedeluvian",6]
		when 100
			["primordial", 7]
		end
	end

	def art_size(roll=Die::roll("1d100"))
		case roll
		when 1..5
			["tiny",-3]
		when 5..10
			["very small",-2]
		when 11..25
			["small",-1]
		when 26..65
			["average size",0]
		when 66..85
			["large",1]
		when 86..90
			["very large",2]
		when 91..95
			["huge",3]
		when 96..98
			["massive",4]
		when 99..100
			["guargantuan", 5]
		end
	end

	def art_craftmanship(roll=Die::roll("1d100"))
		case roll
		when 1..5
			["awful craftsmanship",-3]
		when 5..10
			["poor craftsmanship",-2]
		when 11..25
			["below average craftsmanship",-1]
		when 26..65
			["average craftsmanship",0]
		when 66..85
			["above average craftsmanship",1]
		when 86..90
			["good craftsmanship",2]
		when 91..95
			["excellent craftsmanship",3]
		when 96..98
			["brilliant craftsmanship",4]
		when 99..100
			["masterpiece craftsmanship", 5]
		end
	end

	def art_condition(roll=Die::roll("1d100"))
		case roll
		when 1..5
			["badly damaged",-3]
		when 5..10
			["damaged",-2]
		when 11..25
			["worn",-1]
		when 26..65
			["average condition",0]
		when 66..85
			["good condition",1]
		when 86..90
			["excellent condition",2]
		when 91..95
			["near perfect condition",3]
		when 96..98
			["perfect condition",4]
		when 99..100
			["flawless condition", 5]
		end
	end
end