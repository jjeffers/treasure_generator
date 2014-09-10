require "die"

class Furnishings < Treasure

	def initialize(value)
		super
    @ttype = "furnishings/clothing"
    @value = value

		value_adjustment = 0
		
		@descriptions << furnishings
		@descriptions << clothing

		@value = Die::random_value(@value)

	end

	def furnishings(roll=Die::roll("1d100"))

		case roll
		when 1
			"altar"
		when 2
			"armchair"
		when 3..5
			"armoir"
		when 6
			"arras"
		when 7..10
			"bed"
		when 11..12
			"bench"
		when 13..15
			"blanket"
		when 16..17
			"box"
		when 18..19
			"brazier"
		when 20
			"bucket"
		when 21
			"buffet"
		when 22..23
			"bunks"
		when 24..25
			"cabinet"
		when 26..27
			"candelabrum"
		when 28..30
			"carpet"
		when 31
			"chandelier"
		when 32..36
			"chair"
		when 37..38
			"padded chair"
		when 39
			"padded armchair"
		when 40..42
			"chest of drawers"
		when 43..45
			"closet (wardrobe)"
		when 46
			"couch"
		when 47
			"cresset"
		when 48..49
			"cupboard"
		when 50..51
			"cushion"
		when 52
			"dais"
		when 53..56
			"desk"
		when 57
			"fountain"
		when 58
			"fresco"
		when 59..60
			"hamper"
		when 61..63
			"idol"
		when 64
			"loom"
		when 65..68
			"mat"
		when 69..70
			"mattress"
		when 71..73
			"pallet"
		when 74..75
			"pedastal"
		when 76..78
			"pillow"
		when 79..80
			"quilt"
		when 81..84
			"rug"
		when 85..86
			"screen"
		when 87..88
			"shelves"
		when 89
			"shrine"
		when 90
			"sofa"
		when 91..93
			"stool"
		when 94..96
			"table"
		when 97
			"throne"
		when 98
			"tub"
		when 99
			"wall basin"
		when 100
			"workbench"
		end

	end

	def clothing(roll=Die::roll("1d100"))

		case roll
		when 1
			"apron"
		when 2..3
			"belt"
		when 3..5
			"blouse/chemise"
		when 6..7
			"bodkin"
		when 9
			"braies"
		when 10..11
			"buskins"
		when 12..13
			"cap"
		when 14..15
			"cape"
		when 16..17
			"caul"
		when 18..19
			"cloak"
		when 20..21
			"coat"
		when 22..23
			"coif"
		when 24..25
			"doublet"
		when 26..27
			"dress"
		when 28
			"fez"
		when 29..30
			"frock"
		when 31..32
			"garter"
		when 33..34
			"guantlets"
		when 35..36
			"girdle"
		when 37..38
			"gloves"
		when 39..40
			"gorget"
		when 41..42
			"gown"
		when 43..44
			"hat"
		when 45..46
			"habit"
		when 47..48
			"hood"
		when 49..50
			"hose"
		when 51..52
			"jerkin"
		when 53
			"jupon"
		when 54..55
			"kerchief"
		when 56
			"kirtle"
		when 57..58
			"leggins"
		when 59..60
			"linen (drawers)"
		when 61..62
			"linen (undershirt"
		when 63
			"mantle"
		when 64..65
			"pantaloons"
		when 66..67
			"pedtticoat"
		when 68..69
			"pouch/purse"
		when 70..71
			"robe"
		when 72..73
			"sandals"
		when 74..75
			"scarf"
		when 76..77
			"shawl"
		when 78..79
			"shift"
		when 80..81
			"slippers"
		when 82..83
			"smock"
		when 84..85
			"stockings"
		when 86..87
			"surcoat"
		when 88
			"toga"
		when 90..91
			"tousers"
		when 92..94
			"tunic"
		when 95..96
			"veil"
		when 97..98
			"vest"
		when 99
			"wallet"
		when 100
			"wrapper"
		end

	end

end