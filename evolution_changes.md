# Trade Evolution Changes

All trade-evolution entries were converted from `EVO_TRADE` to `EVO_LEVEL`. Item-held
trade evolutions keep their item requirement (now "reach level X while holding the item"
instead of "trade while holding the item").

## Pure trade evos → level 37

| Pokémon | Evolves to |
|---|---|
| Kadabra | Alakazam |
| Machoke | Machamp |
| Graveler / Graveler-Alola | Golem / Golem-Alola |
| Haunter | Gengar |
| Boldore | Gigalith |
| Gurdurr | Conkeldurr |
| Phantump | Trevenant |
| Pumpkaboo (×4 sizes) | Gourgeist (×4) |
| Karrablast | Escavalier* |
| Shelmet | Accelgor* |

\* Their `IF_TRADE_PARTNER_SPECIES` condition was dropped (impossible to satisfy without trading), so they're now plain level-ups.

## Item-held evos → level (item still required)

| Pokémon | Evolves to | Held item | Level |
|---|---|---|---|
| Poliwhirl | Politoed | King's Rock | 37 |
| Slowpoke | Slowking | King's Rock | 37 |
| Onix | Steelix | Metal Coat | 37 |
| Scyther | Scizor | Metal Coat | 37 |
| Electabuzz | Electivire | Electirizer | 37 |
| Magmar | Magmortar | Magmarizer | 37 |
| Spritzee | Aromatisse | Sachet | 37 |
| Swirlix | Slurpuff | Whipped Dream | 37 |
| Dusclops | Dusknoir | Reaper Cloth | 37 |
| Feebas | Milotic | Prism Scale | 30 |
| Clamperl | Huntail / Gorebyss | Deep Sea Tooth / Scale | 30 |
| Porygon | Porygon2 | Up-Grade | 30 |
| Porygon2 | Porygon-Z | Dubious Disc | 40 |
| Rhydon | Rhyperior | Protector | 42 |
| Seadra | Kingdra | Dragon Scale | 45 |

## Notes

- **Slowpoke** needed reordering: Slowbro is an unconditioned `EVO_LEVEL 37`, and the evolution loop returns the *first* matching entry, so the King's Rock → Slowking entry was moved ahead of it. Now level 37 + King's Rock → Slowking, otherwise → Slowbro.
- **Clamperl** keeps its split intact since both targets stay differentiated by their held item.
- The pre-existing `EVO_ITEM` shortcut paths (Linking Cord, etc.) were left untouched, so those still work as an alternative.
