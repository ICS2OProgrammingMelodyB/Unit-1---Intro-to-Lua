-- Title: MovingImages
-- Name: melody berhane
-- Course: ICS2O
-- This program displays an image that moves across the screen

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

--glodal varables
scrollSpeed = 3

--background image with width an height
local backgroungImage = display.newImageRect("Image/background.png", 2048, 1536)

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
local function moveship(event)
    -- adds the scroll speed to the x-value of the ship
    beetleship.x = beetleship.x + scrollSpeed
    -- change the transparency of the ship every time it moves so that it fades out
    beetleship.alpha = beetleship.alpha + 0.01
end 

--MoveShip will be called over and over again
Runtime:addEventListener("enterFrame", MoveShip)