---------------------------------------------------  αυтнσя : αя∂αναη81  -----------------------------------------------

-- Create And Spawn Car Near The Player Who Excute The Command

function createVehicleForPlayer(player, command, model)
    local x, y, z = getElementPosition(player)
    createVehicle(model, x, y + 5, z)
    outputChatBox("Mashin Ba Hash Code >> "..model.." << Sakhte Shode")
end

-- Commands For Spawing Car

addCommandHandler('createvehicle', createVehicleForPlayer, false, false)
addCommandHandler('car', createVehicleForPlayer, false, false)
addCommandHandler('cc', createVehicleForPlayer, false, false)

-- Delete Cars (Those which Are Without Driver)

function loopVehicles(p)
	local count = 0
	for i, v in ipairs (getElementsByType ("vehicle")) do
		if v then
			local occupants = countOccupants(v)
			if not occupants or occupants == 0 then
				if getVehicleType(v) == "Trailer" then
					if not getVehicleTowingVehicle(v) then
							destroyElement (v)
							count = count+1
					end
				else
						destroyElement (v)
						count = count+1
				end
			end
		end
	end
end
-- Commands For Deleting Cars
addCommandHandler ("dvall", loopVehicles)
addCommandHandler ("deletevehicles", loopVehicles)


function countOccupants(vehicle)
	if vehicle and getElementType(vehicle) == "vehicle" then
		local ppl = getVehicleOccupants(vehicle)
		if not ppl then
			return false
		else
			local counter = 0
			for seat, player in pairs(ppl) do
				counter = counter + 1
			end
			return counter
		end
	end
end

---------------------------------------------------  αυтнσя : αя∂αναη81  -----------------------------------------------
