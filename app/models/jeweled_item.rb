require "die"

class JeweledItem < Treasure

	@@art_values = [0.001, 0.05, 0.25, 1, 10, 25, 50, 75, 100, 150, 200, 300, 400, 
		500, 750, 1000, 1500, 2000, 3000, 4000, 5000, 7500, 10000, 20000, 40000, 80000,
		150000, 250000, 400000, 800000, 1000000]

	def initialize(value)
   super
   @ttype = "jeweled item"
   @value = value

  	@descriptions << item_description

		value_adjustment = 0
		
		quality = art_quality
		@descriptions << quality[0]
		value_adjustment += quality[1]

		craftsmanship = art_craftmanship
		@descriptions << craftsmanship[0]
		value_adjustment += craftsmanship[1]

		condition = art_condition
		@descriptions << condition[0]
		value_adjustment += condition[1]

		value_index = @@art_values.find_index(
		@@art_values.min { |a,b| (a-@value).abs <=> (b-@value).abs })
		
		value_index += value_adjustment
		@value = Die::random_value(@@art_values[value_index])

	end

	def treasure_type(roll=Die::roll("1d20"))
		case roll
		when 1..5
			"art"
		when 6..10
			"goods"
		when 11..16
			"furnishings"
		when 17..19
			"clothing"
		when 20
			"special and magic item"
		end

	end


	def item_description(roll=Die::roll("1d100"))
		case roll
		when 1..2
			"anklet"
		when 3..5
			"armband"
		when 6..7
			"small box"
		when 8..9
			"belt"
		when 10..14
			"bracelet"
		when 15..17
			"brooch"
		when 18
			"buckle"
		when 19
			"chain"
		when 20
			"chalice"
		when 21
			"choker"
		when 22
			"clasp"
		when 23
			"collar"
		when 24
			"coffer"
		when 25
			"comb"
		when 26
			"coronet"
		when 27
			"crown"
		when 28
			"decanter"
		when 29
			"diadem"
		when 30-32
			"earring"
		when 33
			"fob"
		when 34..35
			"goblet"
		when 36..37
			"headband"
		when 38
			"idol"
		when 39..40
			"locket"
		when 41
			"medal"
		when 42
			"medallion"
		when 43..45
			"necklace"
		when 46
			"pendant"
		when 47
			"pin"
		when 48
			"orb"
		when 49..53
			"ring"
		when 54
			"scepter"
		when 55
			"seal"
		when 56
			"statuette"
		when 57
			"tiara"
		when 58..59
			"mask"
		when 60
			"nose ring/stud"
		when 61..62
			"circlet"
		when 63..64
			"torc"
		when 65..67
			"utensils"
		when 68
			"chatelaine"
		when 69
			"cuff link"
		when 70
			"lapel pin"
		when 71
			"grill"
		when 72
			"bangles"
		when 73
			"body piercing"
		when 74
			"prayer beads"
		when 75
			"puzzle"
		when 76
			"aguilette"
		when 77
			"cock ring"
		when 78
			"pectoral"
		when 79
			"zerscheibe"
		when 80
			"icon"
		when 81
			"egg"
		when 82..85
			"weapon"
		when 86..89 
			"armor"
		when 90..93
			"tool"
		when 94..99
			bejeweled_item_type = "coins"
			while bejeweled_item_type == "coins"
				bejeweled_item_type = treasure_type
			end
			bejeweled_item_type
		when 100
			"container is bejeweled"
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