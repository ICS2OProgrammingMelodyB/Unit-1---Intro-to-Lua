-- Title: PhysicsAndCollisions
-- Name: Melody Berhane
-- Course: ICS2O
-- This program displays four balls that roll across the screen.
----------------------------------------------------------------------------

--hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- load physics
local physics = require("physics")

-- start physics
physics.start()

----------------------------------------------------
--SOUNDS
----------------------------------------------------
local backgroundSound = audio.loadSound( "Sound/backgroundMusic.MP3" )
local backgroundSoundChannel = audio.play( backgroundSound )

-----------------------------------------------------
--OBJECTS
-----------------------------------------------------
--ground
local ground = display.newImage("Images/ground.png", 0, 0)
-- set the x and y location of the ground
ground.x = display.contentWidth/2
ground.y = 750
--change the width to be the same as the screen
ground.width = display.contentWidth

-- Add to physics
physics.addBody(ground, "static", {friction=0.5, bounce=0.3})

---------------------------------------------------------
-- beam1
local beam1 = display.newImage("Images/beam.png", 0, 0)
-- set the x and y location of the ground
beam1.x = display.contentCenterX/5
beam1.y = display.contentCenterY*1.65
--change the width to be half of the ipad width
beam1.width = display.contentWidth/2
beam1.height = display.contentHeight * 1/10
-- rotate the beam -60 degrees so its on an angle
beam1:rotate(45)

-- send it to the back layer
beam1:toBack()

--add to physics
physics.addBody(beam1, "static", {friction=0.5, bounce=0.3})

--------------------------------------------------------------------------------------
-- beam1
local beam2 = display.newImage("Images/beam.png", 0, 0)
-- set the x and y location of the ground
beam2.x = 900
beam2.y = display.contentCenterY*1.65
--change the width to be half of the ipad width
beam2.width = display.contentWidth/2
beam2.height = display.contentHeight * 1/10
-- rotate the beam 60 degrees so its on an angle
beam2:rotate(-45)

-- send it to the back layer
beam2:toBack()

--add to physics
physics.addBody(beam2, "static", {friction=0.5, bounce=0.3})

--------------------------------------------------------------
-- background
local background = display.newImage("Images/bkg.png", 0, 0)

--set the x and y position
background.x = display.contentCenterX
background.y = display.contentCenterY

--change the width and the height of the background
background.width = display.contentWidth
background.height = display.contentHeight

--set to the back
background:toBack()

-------------------------------------------------------------------
--FUNCTIONS
--------------------------------------------------------------------

-- create the first ball
local function firstBall()
	-- creating first ball
	local ball1 = display.newImage("Images/super_ball.png", 0, 0)
	ball1:scale(0.5, 0.5)

	-- add to physics
	physics.addBody(ball1, {density=1.0, friction=0.1, bounce=0.3, radius=12.5})
end

-----------------------------------------------------------------------------

-- create the second ball
local function secondBall()
	-- creating second ball
	local ball2 = display.newImage("Images/super_ball.png", 0, 0)
	


	-- add to physics
	physics.addBody(ball2, {density=1.0, friction=0.1, bounce=0.3, radius=25})

end

----------------------------------------------------------------------------

-- create the third ball
local function thirdBall()
	-- creating second ball
	local ball3 = display.newImage("Images/super_ball.png", 0, 0)
	ball3:scale(2, 2)



	-- add to physics
	physics.addBody(ball3, {density=1.0, friction=0.1, bounce=0.3, radius=50})

end

-----------------------------------------------------------------------------

-- create the fourth ball
local function fourthBall()
	-- creating second ball
	local ball4 = display.newImage("Images/super_ball.png", 0, 0)
	ball4:scale(3, 3)



	-- add to physics
	physics.addBody(ball4, {density=1.0, friction=0.1, bounce=0.3, radius=75})

end














----------------------------------------------------------
--TIMER DELAY - call each function after the given millisecond
---------------------------------------------------------------
timer.performWithDelay(0, firstBall)
timer.performWithDelay(1000, secondBall)
timer.performWithDelay(2000, thirdBall)
timer.performWithDelay(3000, fourthBall)
