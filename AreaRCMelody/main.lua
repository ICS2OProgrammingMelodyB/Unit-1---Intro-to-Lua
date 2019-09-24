-- Title: AreaOfRectangleAndCircle
-- Name: Melody Berhane
-- Course: ICS2O
-- This program displays a rectangle and shows the area

--create my local varable
local areaText
local textSize =50
local myRectangle
local widthofRectangle =350
local heightofRectangle =200
local areaOfRectangle
local radius =150
local AreaofCircle
local PI = 3.14

--set the background colour of my screen remember that colours are between 0 and 1
display.setDefault("background",200/255, 0/255, 0/255)

--to remove status bar
display.setStatusBar(display.HiddenStatusBar)

--draw the rectangle that is half width and height of the screen size
myRectangle = display.newRect(0, 0, widthofRectangle, heightofRectangle)

--anchor the rectangle in the top left corner of the screen and set its (x,y) position
myRectangle.anchorX =0
myRectangle.anchorX =0
myRectangle.x =10
myRectangle.y =120

--set the width of the border
myRectangle.strokeWidth = 20

--set the colour of the rectangle
myRectangle:setFillColor(0.7, 0.1, 0.3)

--set the color of the border
myRectangle:setStrokeColor(0, 12, 0)

--calculate the area
areaOfRectangle = widthofRectangle * heightofRectangle

--write the area on the screen. Take into consideration the size of the font when positioning it on the screen
areaText = display.newText("The area of this rectangle with a width of \n" ..
	widthofRectangle .. " and a height of " .. heightofRectangle .. " is " ..
	areaOfRectangle .. " pixel².", 200, 400, Arial, textSize)

--anchor the text and set its (x,y) position
areaText.anchorX = 0
areaText.anchory = 0
areaText.x = 20
areaText.y = display.contentHeight/2

local myCircle = display.newCircle( 100, 100, radius )
myCircle.x = 160
myCircle.y = display.contentHeight*3/4
myCircle:setFillColor( 0.5 )
myCircle.strokeWidth = 5
myCircle:setStrokeColor( 1, 0, 0 )

--set the width of the border
myRectangle.strokeWidth = 20

--set the colour of the rectangle
myCircle:setFillColor(0.7, 0.1, 0.3)

--set the color of the border
myCircle:setStrokeColor(0, 12, 0)

--calculate the area
AreaofCircle = PI * radius * radius