SMODS.Rarity {
    key = "orthodox",
    default_weight = 0.23,
    badge_colour = HEX('009dff'),
    pools = { ["Joker"] = { rate = 0.023 } },
    get_weight = function(self, weight, object_type)
        return weight
    end,
}

SMODS.Rarity {
    key = "infrequent",
    default_weight = 0.083,
    badge_colour = HEX("4BC292"),
    pools = { ["Joker"] = { rate = 0.083 } },
    get_weight = function(self, weight, object_type)
        return weight
    end,
}

SMODS.Rarity {
    key = "sparse",
    default_weight = 0.017,
    badge_colour = HEX('fe5f55'),
    pools = { ["Joker"] = { rate = 0.017 } },
    get_weight = function(self, weight, object_type)
        return weight
    end,
}
