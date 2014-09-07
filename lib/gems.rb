total_value = ARGV[0].to_i
min_value = ARGV[1].to_i
max_value = ARGV[2].to_i

generated_value = 0
gems = []

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

def d(die_size)
	rand(die_size)+1.to_i
end

while generated_value < total_value
	gem_type = d(6)
	gem_name = ""

	case gem_type
	when 1 
		gem_name = ornamental.sample(1).first
	when 2
		gem_name = semiprecious.sample(1).first
	when 3
		gem_name = fancy.sample(1).first
	when 4
		gem_name = precious.sample(1).first
	when 5
		gem_name = gemstones.sample(1).first
	when 6
		gem_name = jewels.sample(1).first
	end
	
	size_roll = d(20)
	quality_roll = d(20)
	size = ""
	quality = ""

	value_index = gem_type

	case size_roll
	when 1
		size = "tiny"
		value_index -= 3
	when 2
		size = "very small"
		value_index -= 2
	when 3..5
		size = "small"
		value_index -= 1
	when 14..17
		size = "large"
		value_index += 1
	when 18
		size = "very large"
		value_index += 2
	when 19
		size = "huge"
		value_index += 3
	when 20
		super_size_roll = d(20)
		case super_size_roll
		when 1..14
			size = "massive"
			value_index += 4
		when 15..20
			size = "gargantuan"
			value_index += 5
		end
	end

	case quality_roll
	when 1
		quality = "badly flawed"
		value_index -= 3
	when 2
		quality = "flawed"
		value_index -= 2
	when 3..5
		quality = "slightly flawed"
		value_index -= 1
	when 14..17
		value_index += 1
	when 18
		quality = "excellent"
		value_index += 2
	when 19
		quality = "near perfect"
		value_index += 3
	when 20
		super_size_roll = d(20)
		case super_size_roll
		when 1..14
			quality = "perfect"
			value_index += 4
		when 15..20
			quality = "flawless"
			value_index += 5
		end
	end

	value = 0

	case value_index
	when value_index < -3
		value = 0.001
	when -3
		value = 0.05
	when -2
		value = 0.25
	when -1 
		value = 1
	when 0
		value = d(25)
	when 1
		value = d(5)*10 + 25
	when 2
		value = d(25)*7 + 75
	when 3
		value = d(10)*50 + 250
	when 4
		value = d(25)*35 + 750
	when 5
		value = d(50)*150 + 2500
	when 6
		value = d(100)*100 + 10000
	when 7 
		value = d(100)*200 + 20000
	when 8
		value = d(100)*400 + 40000
	when 9 
		value = d(200)*700 + 80000
	when value_index > 9
		value = d(200)*1000 + 10000
	end

	description = ""

	if not size.empty?
		description += size
	end

	if not quality.empty?
		description += " #{quality} "
	end

	if not description.empty?
		description += " "
	end

	description += gem_name

	if value >= min_value and value < max_value 
		gems << { 
			:description => description,
		  :value => value }
		generated_value += value
	end
		
end

gems.each do |gem|
	puts "#{gem[:value]} gp #{gem[:description]}"
end

puts "total value: #{generated_value}"

