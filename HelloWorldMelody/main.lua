-- Title: HelloWorld
-- Course: ICS2O
-- Name: Melody Berhane
-- This program displays Hello to the simulator 
--and to the command terminal.

--print to the command terminal
print("Hello Mom!")
print("How was your day?")

--hide the status bar
display.setStatusBar(display.HiddenStatusBar)

--change the background colour
display.setDefault("background", 100/255, 255/255, 200/255)

--create a text object
local textObject

--make the text object display my name
textObject = display.newText ("hello Mom!", 500, 200, "Comic Sans MS", 100)

--change the text colour
textObject:setTextColor(204/255, 0/255, 0/255)

--print to the command terminal
print("By: Melody Berhane")

--hide the status bar
display.setStatusBar(display.HiddenStatusBar)

--change the background colour
display.setDefault("background", 100/255, 255/255, 200/255)

--create a text object
local textObject

--make the text object display my name
textObject = display.newText ("By: Melody Berhane", 200, 500, "Comic Sans MS", 75)

--change the text colour
textObject:setTextColor(204/255, 0/255, 0/255)