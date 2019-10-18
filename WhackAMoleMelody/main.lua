-- Title: WhackAMole
-- Name: Melody Berhane
-- Course: ICS2O
-- This program places a random object on the screen. If the user clicks on it in time,
--the score increases by 1

--hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-------------------------------------------------------------------
--LOCAL VARIABLE
--------------------------------------------------------------------
local background
local mole
local pointsText
local points = 0
local hitSound = audio.loadSound( "Sound/hitSound.MP3" )
local hitSoundChannel = audio.play( hitSound )
local backgroundSound = audio.loadStream( "Sound/background.MP3" )
local backgroundSoundChannel = audio.play( backgroundSound, {loop = -1} )

-------------------------------------------------------------------------
--LOCAL FUNCTIONS
-------------------------------------------------------------------------


--This function makes the mole appear in a randon (x,y) position on the screen
-- before calling the hide function 
function PopUp()
	-- choosing random positions on the screen between 0 and the size of the screen
	mole.x = math.random( 0, display.contentWidth )
	mole.y = math.random( 0, display.contentHeight)

	--make the mole visible 
	mole.isVisible = true

	-- hides the mole
	timer.performWithDelay(1000, HideMole)

end

--This function calls the PopUp function after 3 seconds
function PopUpDelay()
	timer.performWithDelay(1000, PopUp)
end


-- This function starts the game
function GameStart()
	PopUpDelay()
	EndGame()
end

-- This function makes the mole invisible and then calls the PopUpDelay function 
function HideMole()
	--changing visibility
	mole.isVisible = false
	timer.performWithDelay(1000, PopUpDelay)
end

--this function increments the score only if the mole is clicked. It then displays the
-- new score.
function Whacked( event )
	-- If touch phase just started
	if (event.phase == "began")then
		-- give a point if user whacks the mole
	    points = points + 1

	    --update it in the display object
	    pointsText.text = "Points = " .. points	
	    hitSoundChannel = audio.play( hitSound )
	end

end

function EndGame()
	--end the game
	if (points == 20 ) then
		mole.isVisible = false
		audio.stop(backgroundSoundChannel)
	end

end

-----------------------------------------------------
--OBJECT CREATION
-----------------------------------------------------
-- creating background
background = display.newRect( 200/255, 67/255, 15/255, display.contentWidth, display.contentHeight )

--set the background colour
display.setDefault("background", 200/255, 120/255, 95/255)

--Setting position
background.anchorX = 0
background.anchorY = 0
background.x = 0
background.y = 0

-- creating mole
mole = display.newImage( "Image/mole.png", 0, 0)

-- Setting position
mole.x = display.contentCenterX
mole.y = display.contentCenterY
mole:scale(0.25, 0.25)
mole.isVisible = false

-- creating points
--display the amount of points as a text object
pointsText = display.newText("Points = " .. points, 900, 20, nil, 50)
pointsText:setTextColor(5/255, 5/255, 200/255)

-------------------------------------------------------
--EVENT LISTENERS
----------------------------------------------------------
--when the mole is touched, the Whacked function is called
mole:addEventListener( "touch", Whacked)

-- start the game
GameStart()