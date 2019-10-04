-- Title: NumericTextFields
-- Name: Melody Berhane
-- Course: ICS2O
-- This program displays a math question and asks the user to answer in a numeric textfield
--terminal.

--hide the status bar
display.setStatusBar(display.HiddenStatusBar)

--set the background colour
display.setDefault("background", 240/255, 5/255, 255/255)

--LOCAL VARIABLES

--create local variable
local questionObject
local correctObject
local numericField
local randomNumber1
local randomNumber2
local userAnser
local correctAnswer
local incorrectObject

--LOCAL FUNCTIONS

local function AskQuestion()
	--generate 2 random numbers between a max. and a min. number
	randomNumber1 = math.random(0, 7)
	randomNumber2 = math.random(0, 7)

	correctAnswer = randomNumber1 + randomNumber2

	--create question in text object
	questionObject.text = randomNumber1 .. " + " .. randomNumber2 .. " = "
end

local function Hidecorrect()
	correctObject.isVisible = false	
	AskQuestion()
end

local function Hideincorrect()
	incorrectObject.isVisible = false
	AskQuestion()
end

local function NumericFieldsListener( event )

	--User begins editing "numericField"
	if ( event.phase == "began" ) then

		--clear text field
		event.target.text = ""

	elseif ( event.phase == "submitted" ) then 

		--when the answer is submitted (enter key is pressed) set user input to user's answer
		userAnswer = tonumber(event.target.text)

		--if the users answer and the correct answer are the same:
	    if (userAnswer == correctAnswer) then
			correctObject.isVisible = true
			timer.performWithDelay(1000, Hidecorrect)				
			
        else 
        	--if the users answer and the correct answer are not the same:
        	incorrectObject.isVisible = true
		    timer.performWithDelay(1000, Hideincorrect)
		end
		
		--clear text field
		event.target.text = ""
		
	end
end

--OBJECT CREATION

--display a question and sets the colour
questionObject = display.newText( "", display.contentWidth/3, display.contentHeight/2, nil, 50)
questionObject:setTextColor(5/255, 255/255, 200/255)

--create the correct text object and make it invisble
correctObject = display.newText( "Correct!", display.contentWidth/2, display.contentHeight*2/3, nil, 50)
correctObject:setTextColor(5/255, 255/255, 200/255)
correctObject.isVisible = false

--create the incorrect text object and make it invisble
incorrectObject = display.newText( "InCorrect!", display.contentWidth/2, display.contentHeight*2/3, nil, 50)
incorrectObject:setTextColor(5/255, 255/255, 200/255)
incorrectObject.isVisible = false

--create numeric field
numericField = native.newTextField( display.contentWidth/2, display.contentHeight/2, 170, 100)
numericField.inputtype = false

--add the event listener for thr numeric field
numericField:addEventListener( "userInput", NumericFieldsListener)

--FUNCTION CALLS

-- call the funtion to ask the question
AskQuestion()