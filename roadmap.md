# OpenRA 2028 Roadmap

## Core campaign premise

OpenRA 2028 is an original alternate-history RTS campaign. President Grant Rourke,
a fictional wealthy New York developer, celebrity businessman, reality-TV star, and
political outsider, abuses emergency powers in the United States. Canada and Mexico
reject his rule and become the first major resistance governments.

The story should remain original and should not portray Grant Rourke as a real-world
person.

## Planned factions

Playable factions:

- Canada
- Mexico
- Russia
- England
- France / other European partners as allied support where appropriate
- United States
- Japan

England and France may initially appear as allied AI forces, diplomatic partners, or
limited expeditionary forces before becoming full playable factions.

## Campaign structure

The campaign should eventually allow the player to begin with either Canada or
Mexico. The first implemented route begins with Canada in **The Northern Line**;
the Mexican opening route can be added after the first mission is stable.

The initial target is approximately **14 missions** for the main Canada/Mexico
coalition campaign, matching the scale of an original Red Alert faction campaign.
England, France, and other European countries are approached first. The United
States defeats or forces the European intervention to withdraw. Russia and Japan
then join later to prevent Canada and Mexico from being overwhelmed.

### Planned opening arc

1. **The Northern Line** — Canada defends an evacuation corridor against the United States.
2. **The Southern Break** — Mexico enters the conflict and resists pressure along its border.
3. **Broken Signals** — Canada and Mexico coordinate their first major resistance operation.
4. **European Promise** — England, France, and another European partner offer diplomatic and limited military support.
5. **The European Defeat** — United States forces defeat the intervention or force Europe to withdraw.
6. **The Russian Offer** — With Canada and Mexico near collapse, Russia offers weapons, intelligence, and advisors.
7. **The Japanese Channel** — Japan opens a second supply and technology route, but has its own strategic goals.
8. **The Price of Aid** — The coalition coordinates Russia and Japan without surrendering its independence.
9–14. **The Counteroffensive** — Joint operations expose Rourke’s false-flag crisis and begin the final assault on his regime.

The Russia and Japan alliances should be politically complicated rather than simple
permanent good-versus-evil alliances. Their support can provide different military
advantages and create different diplomatic consequences.

## Mission 01: The Northern Line

### Story

Canada has rejected President Rourke’s emergency rule. Canadian forces must hold a
northern evacuation corridor while civilian authorities recover a communications
relay from a border station. The relay may contain the first evidence that Rourke’s
national emergency was engineered by his own regime. United States occupation forces
attempt to destroy the relay and silence the operation.

### Intended gameplay flow

1. **Defend the line** — Keep the Canadian command post alive for 90 seconds.
2. **Survive escalating attacks** — United States infantry and tanks attack from the south.
3. **Recover the relay** — Secure the border communications relay and its evidence.
4. **Break the occupation command** — Destroy the local United States forward command center.
5. **Victory** — Complete the objective chain while keeping the Canadian command post alive.

### Current implementation

- Uses Red Alert terrain, sprites, rules, and shared campaign scripts.
- Canada is the playable faction; the United States is the opposing campaign AI.
- A Canadian command post, power plant, and barracks are placed near the starting force.
- Objective text exists for holding the line, protecting the command post, recovering the relay, and destroying the forward occupation command center.
- Timed United States attack waves are scripted with infantry and tanks.
- The mission Lua script loads `campaign.lua` and `utils.lua` so objective helpers are available.

### Remaining acceptance checks

- Launch the mission and confirm Canadian units can be selected and moved.
- Confirm the objective stages appear in the correct order.
- Confirm the command post loss causes defeat.
- Confirm attack waves reach the Canadian position.
- Confirm holding the line unlocks the relay objective.
- Confirm destroying the relay unlocks the forward command-center objective.
- Confirm destroying the forward command center produces a normal victory screen.
- Confirm the mission can also be lost without a Lua or map error.

## Development priorities

1. Finish and playtest **The Northern Line**.
2. Fix balance, map readability, starting economy, and attack timing.
3. Add original Canada and Mexico units after the first mission loop is stable.
4. Build the second mission, **The Southern Break**.
5. Add campaign transitions, briefings, debriefings, and faction progression.
6. Replace temporary Red Alert-derived presentation elements with original art and audio families as they are produced.

## Technical direction

- Keep the technical mod ID as `openra2028` until a later migration is justified.
- Continue depending on the Red Alert content package for normal terrain and sprite support during prototyping.
- Keep story, faction identities, mission objectives, and custom units original.
- Prefer small playable slices and test each mission in-game before expanding the campaign.
