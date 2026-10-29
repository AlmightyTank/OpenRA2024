Canada = Player.GetPlayer("Canada")
UnitedStates = Player.GetPlayer("UnitedStates")

HoldLineObjective = nil
ProtectCommandPost = nil
RecoverRelayObjective = nil
DestroyOccupationCommandObjective = nil

SendAttackWave = function(units)
	local attackers = Reinforcements.Reinforce(UnitedStates, units,
		{ SouthReinforcementsPoint.Location, BaseCameraPoint.Location })
	Utils.Do(attackers, IdleHunt)
end

SendCanadianReinforcements = function()
	local reinforcements = Reinforcements.Reinforce(Canada,
		{ "e1", "e1", "e1", "e2", "jeep" },
		{ InsertionEntry.Location, InsertionLZ.Location })
	Utils.Do(reinforcements, function(actor)
		actor.Stance = "Defend"
	end)
end

StartAttackWaves = function()
	Trigger.AfterDelay(DateTime.Seconds(45), function()
		SendAttackWave({ "e1", "e1" })
	end)

	Trigger.AfterDelay(DateTime.Seconds(100), function()
		SendAttackWave({ "e1", "e1", "e2" })
	end)

	Trigger.AfterDelay(DateTime.Seconds(155), function()
		SendAttackWave({ "e1", "e1", "e2", "1tnk" })
	end)
end

UnlockRelayObjective = function()
	if not Canada.IsObjectiveCompleted(HoldLineObjective) then
		return
	end

	RecoverRelayObjective = AddPrimaryObjective(Canada, "recover-relay")
	Trigger.OnKilled(RelayStation, function()
		Canada.MarkCompletedObjective(RecoverRelayObjective)
		DestroyOccupationCommandObjective = AddPrimaryObjective(Canada, "destroy-occupation-command")
		Trigger.OnKilled(UnitedStatesCommand, function()
			Canada.MarkCompletedObjective(DestroyOccupationCommandObjective)
		end)
	end)
end

WorldLoaded = function()
	InitObjectives(Canada)
	Camera.Position = InsertionLZ.CenterPosition
	Canada.Resources = 2000

	ProtectCommandPost = AddPrimaryObjective(Canada, "protect-command-post")
	HoldLineObjective = AddPrimaryObjective(Canada, "hold-the-line")

	Trigger.OnKilled(CommandPost, function()
		Canada.MarkFailedObjective(ProtectCommandPost)
		Canada.MarkFailedObjective(HoldLineObjective)
	end)

	Trigger.AfterDelay(DateTime.Seconds(90), function()
		if not CommandPost.IsDead then
			Canada.MarkCompletedObjective(HoldLineObjective)
			UnlockRelayObjective()
		end
	end)

	Trigger.AfterDelay(DateTime.Seconds(8), SendCanadianReinforcements)
	StartAttackWaves()
end
