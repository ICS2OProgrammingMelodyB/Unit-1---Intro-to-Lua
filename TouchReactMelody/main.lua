-- Title: TouchAndReact
-- Name: Melody Berhane
-- Course: ICS2O
-- This program does something when I click on the button

-- set bachground colour
display.setDefault ("background", 178/255, 50/255, 100/255 )

--hide status bar
display.setStatusBar(display.HiddenStatusBar)

--create blue button, set its positions and make it visible
local blueButton = display.newImageRect("Images/Fast Button Inactive@2x.png", 198, 98)
blueButton.x = display.contentWidth/2
blueButton.y = display.contentHeight/2
blueButton.isVisible = true 

--create red button, set its positions and make it visible
local redButton = display.newImageRect("Images/Fast Button Active@2x.png", 198, 98)
redButton.x = display.contentWidth/2
redButton.y = display.contentHeight/2
redButton.isVisible = false

--create text object, set its position and make it invisible
local textObject = display.newText("Clicked!", 0, 0, nil, 50)
textObject.x = display.contentWidth/2
textObject.y = display.contentHeight/3
textObject:setTextColor(255/255, 120/255, 5/255)
textObject.isVisible = false

--create image, set its position and make it invisible
local checkMark = display.newImageRect("Images/checkmark.png", 150, 150)
checkMark.x = display.contentWidth/2
checkMark.y = 600
checkMark.isVisible = false

--create sound(I got this code from https://docs.coronalabs.com/api/library/audio/play.html)
local correctSound = audio.loadSound( "Sound/Correct Answer Sound Effect.MP3" )
 
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
		checkMark.isVisible = true
		-- Play the correct soud on any available channel
        local correctSoundChannel = audio.play( correctSound )
    end

	if (touch.phase == "ended") then
		blueButton.isVisible = true
		redButton.isVisible = false
		textObject.isVisible = false
		checkMark.isVisible = false
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
		redButton.isVisible = true
		blueButton.isVisible = false
		textObject.isVisible = true
		checkMark.isVisible = true
    end
	if (touch.phase == "ended") then
		redButton.isVisible = false
		blueButton.isVisible = true
		textObject.isVisible = false
		checkMark.isVisible = false
	end
end

--add the respextive listener to each object
redButton:addEventListener("touch", RedButtonListener)