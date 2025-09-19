--SHED render logic
local stupidfuckingbuttonref = G.UIDEF.use_and_sell_buttons
function G.UIDEF.use_and_sell_buttons(card)
    local ret = stupidfuckingbuttonref(card)
    local owned = card.area and card.area == G.jokers and card.ability.set == 'Joker'
    local key = card.config.center.key
    if owned and key ~= 'j_hpfx_ijiraq' then
        local transbutton = G.UIDEF.hpfx_transform_button(card)
        if ret.nodes and ret.nodes[1] and ret.nodes[1].nodes and ret.nodes[1].nodes[2] then
            ret.nodes[1].nodes[2].nodes = ret.nodes[1].nodes[2].nodes or {}
            table.insert(ret.nodes[1].nodes[2].nodes, transbutton)
        end
    end
    return ret
end

--SHED functionality logic
function G.UIDEF.hpfx_transform_button(card)
    local transform = nil
    local key = card.config.center.key
    if card.area and card.area.config.type == 'joker' and key ~= 'j_hpfx_ijiraq'
        and card:is_rarity(4) then
        local specil = nil
        for k, v in pairs(Hyperglobal.exceptions) do
            if key == v then
                specil = true
                break
            end
        end
        if specil or card.visiblyIjiraq then
            transform = {
                n = G.UIT.C,
                config = { align = "cr" },
                nodes = {
                    {
                        n = G.UIT.C,
                        config = {
                            ref_table = card,
                            align = "cr",
                            maxw = 1.25,
                            padding = 0.1,
                            r = 0.08,
                            minw = 1.25,
                            hover = true,
                            shadow = true,
                            minh = (card.area and card.area.config.type == 'joker') and 0 or 1,
                            colour = G.C.RED,
                            one_press = true,
                            button = 'hpfx_Transbutt'
                        },
                        nodes = {
                            { n = G.UIT.B, config = { w = 0.1, h = 0.6 } },
                            { n = G.UIT.T, config = { text = localize('hpfx_shed'), colour = G.C.UI.TEXT_LIGHT, scale = 0.6, shadow = true } }
                        }
                    },
                }
            }
        end
        return transform
    end
end
