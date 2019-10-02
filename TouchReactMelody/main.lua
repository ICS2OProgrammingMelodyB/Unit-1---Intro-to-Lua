-- Title: TouchAndReact
-- Name: Melody Berhane
-- Course: ICS2O
-- This program does something when I click on the button

-- set bachground colour
display.setDefault ("background", 50/255, 255/255, 50/255 )

--hide status bar
display.setStatusBar(display.HiddenStatusBar)

--create blue button, set its positions and make it visible
local blueButton = display.newImageRect("Images/Fast Button Inactive@2x.png", 198, 98)
blueButton.x = display.contentWidth/2
blueButton.y = display.contentHeight/2
blueButton.isVisible = true 


-- Completion listener function(I got it from https://docs.coronalabs.com/api/library/audio/loadSound.html)
local function CorrectAnswer( event )
    print( "CorrectAnswer Finished on channel", event.channel )
    if ( event.completed ) then
        print( "CorrectAnswer completed playback naturally" )
    else
        print( "CorrectAnswer was stopped before completion" )
    end
end
 
-- Load two audio streams and one sound(I got it from the same wedsite but I made some changes.)
local backgroundMusic = audio.loadStream( "Images/Correct Answer Sound Effect.MP3" )

--create red button, set its positions and make it visible
local redButton = display.newImageRect("Images/Fast Button Active@2x.png", 198, 98)
redButton.x = display.contentWidth/2
redButton.y = display.contentHeight/2
redButton.isVisible = false

--create text object, set its position and make it invisible
local textObject = display.newText("Clicked!", 0, 0, nil, 50)
textObject.x = display.contentWidth/2
textObject.y = display.contentHeight/3
textObject:setTextColor(5/255, 120/255, 255/255)
textObject.isVisible = false

-- Function: BlueButtonListener
-- Input: touch listener
-- Output: none
-- Description: when blue button is clicked, it will make the text appear with the red button,
-- and make the blue button disappear
local function BlueButtonListener(touch)
	if (touch.phase == "began") then
		blueButton.isVisible = false
		redButton.isVisible = true
		textObject.isVisible = true
		backgroundMusic1 = true
		-- Play the background music on channel 1, and fades out in 3 seconds 
        local backgroundMusicChannel = audio.play( backgroundMusic, { channel=1, loops=0, fadeout=3000 } )

	end

	if (touch.phase == "ended") then
		blueButton.isVisible = true
		redButton.isVisible = false
		textObject.isVisible = false
		backgroundMusic1 = false
	end
end

--add the respextive listener to each object
blueButton:addEventListener("touch", BlueButtonListener)

-- Function: RedButtonListener
-- Input: touch listener
-- Output: none
-- Description: when Red button is clicked, it will make the text appear with the blue button,
-- and make the Red button disappear
local function RedButtonListener(touch)
	if (touch.phase == "began") then
		redButton.isVisible = false
		blueButton.isVisible = true
		textObject.isVisible = true
	end

	if (touch.phase == "ended") then
		redButton.isVisible = true
		blueButton.isVisible = false
		textObject.isVisible = false
	end
end

--add the respextive listener to each object
redButton:addEventListener("touch", RedButtonListener)