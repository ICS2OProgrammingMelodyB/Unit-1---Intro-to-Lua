-- Title: MovingImages
-- Name: melody berhane
-- Course: ICS2O
-- This program displays an image that moves across the screen

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

--glodal varables
scrollSpeed = 3
scrollSpeed2 = 4 - 8 

--background image with width an height
local backgroungImage = display.newImageRect("Images/background.png", 2048, 1536)

--create sound(I got this code from https://docs.coronalabs.com/api/library/audio/play.html)
local backgroundSound = audio.loadSound( "Sound/bkgMusic.MP3" )

-- Play the correct soud on any available channel
local backgroundSoundChannel = audio.play( backgroundSound,{loop= -1} )

--character image with width and height
local beetleship = display.newImageRect("Images/beetleship.png", 200, 200)

--set the image to be transparent
beetleship.alpha = 0

--set the initial x and y position of beetleship
beetleship.x = 0
beetleship.y = display.contentHeight/3

-- Function: Moveship
-- Input: this function accepts an event listener
-- Out: none
-- Description: This function adds the scroll speed to the x-value of the ship
local function MoveShip(event)
    -- adds the scroll speed to the x-value of the ship
    beetleship.x = beetleship.x + scrollSpeed
    -- change the transparency of the ship every time it moves so that it fades out
    beetleship.alpha = beetleship.alpha + 0.05
    beetleship.xScale = beetleship.xScale + 0.01
    beetleship.yScale = beetleship.yScale + 0.01 
end 

--MoveShip will be called over and over again
Runtime:addEventListener("enterFrame", MoveShip)

--character image with width and height
local octopus = display.newImageRect("Images/octopus.png", 200, 200)

--set the image to be transparent
octopus.alpha = 0

--set the initial x and y position of beetleship
octopus.x = 1000
octopus.y = 500

-- Function: MoveShips
-- Input: this function accepts an event listener
-- Out: none
-- Description: This function adds the scroll speed to the x-value of the ship
local function MoveShips(event)
    -- adds the scroll speed to the x-value of the ship
    octopus.x = octopus.x + scrollSpeed2
    -- change the transparency of the ship every time it moves so that it fades out
    octopus.alpha = octopus.alpha + 0.01
    octopus.xScale =  octopus.xScale - 0.001
     octopus.yScale =  octopus.yScale - 0.001
end 

--MoveShips will be called over and over again
Runtime:addEventListener("enterFrame", MoveShips)

-- Make octupus change direction
octopus:scale(-1, 1)

