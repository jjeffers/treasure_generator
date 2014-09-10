require "die"

class Gems < Treasure


	@@gem_values = [0.001, 0.05, 0.25, 1, 25, 75, 250, 750, 2500, 10000,
	 20000, 40000, 800000, 1000000]

	def initialize(value)
	 super
	 @ttype = "gems"
	 @value = value

	 value_adjustment = 0

	  @descriptions << gem_stone(@value)

		quality = gem_quality
		@descriptions << quality[0]
		value_adjustment += quality[1]

		size = gem_size
		@descriptions << size[0]
		value_adjustment += size[1]

		gem_value_index = @@gem_values.find_index(
			@@gem_values.min { |a,b| (a-@value).abs <=> (b-@value).abs })
		puts "gem value index #{gem_value_index} #{@@gem_values[gem_value_index]}"
		gem_value_index += value_adjustment
		puts "gem value index #{gem_value_index} #{@@gem_values[gem_value_index]}"
		@value = gem_value_variation(gem_value_index)

	end

	def d(range)
		rand(range)+1
	end


	def gem_value_variation(value_index)

		case value_index
		when value_index < 1
			value = 0.001
		when 1
			value = 0.05
		when 2
			value = 0.25
		when 3 
			value = 1
		when 4
			value = d(25)
		when 5
			value = d(5)*10 + 25
		when 6
			value = d(25)*7 + 75
		when 7
			value = d(10)*50 + 250
		when 8
			value = d(25)*35 + 750
		when 9
			value = d(50)*150 + 2500
		when 10
			value = d(100)*100 + 10000
		when 11
			value = d(100)*200 + 20000
		when 12
			value = d(100)*400 + 40000
		when 13 
			value = d(200)*700 + 80000
		when value_index > 14
			value = d(200)*1000 + 10000
		end
	end


	def gem_stone(gp_size)

		ornamental = ["banded agate", "eye agate", "moss agate", "azurite", 
			"bone", "hematite", "lapis lazuli", "malachite", "obsidian",
			"pyrite", "tiger eye", "turquoise", "mother of pearl"]

		semiprecious = ["amazon stone", "bloodstone", "carnelian", "chalcedony",
			"chrysoprase", "citrine", "jasper", "moonstone", "onyx", "rock crystal",
			"sardonyx", "serpentine", "smoky quartz", "star rose quartz", "variscite"]

		fancy = ["amber", "alamadine", "alexandrite", "amethyst", "chrysoberyl",
			"coral", "diopside", "garnet", "iocolite", "jade", "jet", "morganite",
			"nephrite", "pearl", "spinel", "spessarite", "sugulite", "rubelite",
			"tourmaline", "zircon"]

		precious = ["aquamarine", "garnet", "black pearl", "peridot", "spinel",
			"kunzite", "topaz", "tanzanite"]

		gemstones = ["black opal", "emerald", "fire opal", "garnet", "opal",
			"amethyst", "topaz", "sapphire", "star ruby", "star sapphire"]

		jewels = ["ammolite", "black sapphire", "diamond", "jacinth", "emerald",
			"ruby"]

		case gp_size
		when 1..25
			ornamental.sample(1).first
		when 26..75
			semiprecious.sample(1).first
		when 76..250
			fancy.sample(1).first
		when 251..750
			precious.sample(1).first
		when 751..2500
			gemstones.sample(1).first
		when 2501..10000
			jewels.sample(1).first
		end

	end

	def gem_quality(roll=Die::roll("1d100"))
		case roll
		when 1..5
			["badly flawed", -3]
		when 6..10
			["flawed", -2]
		when 11..25
			["minor inclusions", -1]
		when 26..65
			["average quality", 0]
		when 66..85
			["good quality", 1]
		when 86..90
			["excellent quality", 2]
		when 91..95
			["nearly perfect", 3]
		when 96..98
			["perfect", 4]
		when 99..100
			["flawless", 5]
		end
	end

	def gem_size(roll=Die::roll("1d100"))
		case roll
		when 1..5
			["tiny",-3]
		when 5..10
			["very small",-2]
		when 11..25
			["small", -1]
		when 26..65
			["average size", 0]
		when 66..85
			["large", 1]
		when 86..90
			["very large", 2]
		when 91..95
			["huge", 3]
		when 96..98
			["massive", 4]
		when 99..100
			["guargantuan", 5]
		end
	end


end
