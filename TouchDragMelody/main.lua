-- Title: TouchAndDrag
-- Name: Melody Berhane
-- Course: ICS2O
-- This program displays images that react to a person's finger.

--hide the status bar
display.setStatusBar(display.HiddenStatusBar)

--local varables. I am still trying to get the x-value to be set properly
local backgroundImage = display.newImageRect("Images/spaceBackground.jpg", 2048, 1536)
local star = display.newImageRect("Images/star.png", 150, 150)
local starWidth = star.width
local starHeight = star.height

local rocketship = display.newImageRect("Images/rocketship.png", 150, 150)
local rocketshipWidth = rocketship.width
local rocketshipHeight = rocketship.height

-- my boolean variables to keep track of which object I touched first
local alreadyTouchedstar = false
local alreadyTouchedrocketship = false

-- set the initial x and y position of myImage
star.x = 400
star.y = 500

rocketship.x = 300
rocketship.y = 200

-- Function: starListener
--Input: touch listener
-- Output: none
-- Description: when star is touched, move it
local function starListener(touch)
	if(touch.phase == "began") then
		if (alreadyTouchedrocketship == false) then
			alreadyTouchedstar = true
		end
	end

	if ( (touch.phase == "moved") and (alreadyTouchedstar == true) ) then
		star.x = touch.x
		star.y = touch.y
	end

	if (touch.phase == "ended") then
		alreadyTouchedstar = false
		alreadyTouchedrocketship = false
	end
end

-- add the respective listeners to each object
star:addEventListener("touch", starListener)

-- Function: rocketshipListener
--Input: touch listener
-- Output: none
-- Description: when rocketship is touched, move it
local function rocketshipListener(touch)
	if(touch.phase == "began") then
		if (alreadyTouchedstar == false) then
			alreadyTouchedrocketship = true
		end
	end

	if ( (touch.phase == "moved") and (alreadyTouchedrocketship == true) ) then
		rocketship.x = touch.x
		rocketship.y = touch.y
	end

	if (touch.phase == "ended") then
		alreadyTouchedstar = false
		alreadyTouchedrocketship = false
	end
end

-- add the respective listeners to each object
rocketship:addEventListener("touch", rocketshipListener)