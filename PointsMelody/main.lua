-- Title: Points
-- Name: Melody Berhane
-- Course: ICS2O
-- This program displays a math question and asks the user to answer in a numeric textfield
--terminal and gives points for every correct answer

--hide the status bar
display.setStatusBar(display.HiddenStatusBar)

--set the background colour
display.setDefault("background", 250/255, 250/255, 15/255)

----------------------------------------------------------------------------------
--LOCAL VARIABLES
----------------------------------------------------------------------------------

--create local variable
local questionObject
local correctObject
local numericField
local randomNumber1
local randomNumber2
local userAnser
local correctAnswer = 0
local incorrectObject
local points = 0
local lives = 3
--create sound(I got this code from https://docs.coronalabs.com/api/library/audio/play.html)
local correctSound = audio.loadSound( "Sound/correctSound.MP3" )
local wrongSound = audio.loadSound( "Sound/wrongSound.MP3" )


-----------------------------------------------------------------------------------
--LOCAL FUNCTIONS
-----------------------------------------------------------------------------------

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
end

local function HidecorrectAnswer()
	correctAnswerObject.isVisible = false
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
	    	-- Play the correct soud on any available channel
       	    local correctSoundChannel = audio.play( correctSound )
			timer.performWithDelay(1000, Hidecorrect)
		if (points == 4 ) then
	  		    WinObject.isVisible = true 
	  		    incorrectObject.isVisible = false
	  		    correctObject.isVisible = false
	  		    questionObject.isVisible = false
	  		    numericField.inputtype = false
	  		    correctSoundChannel = audio.play( correctSound )
	  	    end
	    	-- give a point if user gets the correct answer
	    	points = points + 1

	    	--update it in the display object
	    	pointsText.text = "Points = " .. points			
			
        else 
        	if (lives == 1 ) then
	  		    gameOverObject.isVisible = true 
	  		    incorrectObject.isVisible = false
	  		    correctObject.isVisible = false
	  		    questionObject.isVisible = false
	  		    numericField.inputtype = false
	  		    local wrongSoundChannel = audio.play( wrongSound )
			else

        	 --if the users answer and the correct answer are not the same:
             incorrectObject.isVisible = true
		     timer.performWithDelay(1000, Hideincorrect) 
		     wrongSoundChannel = audio.play( wrongSound )
		     correctAnswerObject.text = "The correct answer is" ..  correctAnswer
		     correctAnswerObject.isVisible = true
		     timer.performWithDelay(1500, HidecorrectAnswer)


		     -- take a life if user gets the incorrect answer
	    	 lives = lives - 1

	    	 --update it in the display object
	    	 livesText.text = "lives = " .. lives
	    	end
		end
		--clear text field
		event.target.text = ""
	end
end



------------------------------------------------------------------------------------------------
--OBJECT CREATION
-------------------------------------------------------------------------------------------------

--display a question and sets the colour
questionObject = display.newText( "", display.contentWidth/3, display.contentHeight/2, nil, 50)
questionObject:setTextColor(5/255, 5/255, 200/255)

--display GameOver! and sets the colour
gameOverObject = display.newText( "Game Over!", display.contentWidth/2, display.contentHeight*3/4, nil, 150)
gameOverObject:setTextColor(5/255, 5/255, 200/255)
gameOverObject.isVisible = false


--display You win! and sets the colour
WinObject = display.newText( "You Win!", display.contentWidth/2, display.contentHeight*3/4, nil, 150)
WinObject:setTextColor(5/255, 5/255, 200/255)
WinObject.isVisible = false

--create the correct text object and make it invisble
correctObject = display.newText( "Correct!", display.contentWidth/2, display.contentHeight*2/3, nil, 50)
correctObject:setTextColor(5/255, 5/255, 200/255)
correctObject.isVisible = false

--create the incorrect text object and make it invisble
incorrectObject = display.newText( "InCorrect!", display.contentWidth/2, display.contentHeight*2/3, nil, 50)
incorrectObject:setTextColor(5/255, 5/255, 200/255)
incorrectObject.isVisible = false

--create numeric field
numericField = native.newTextField( display.contentWidth/2, display.contentHeight/2, 170, 100)
numericField.inputtype = false

--display the amount of points as a text object
pointsText = display.newText("Points = " .. points, 900, 20, nil, 50)
pointsText:setTextColor(5/255, 5/255, 200/255)

--display the amount of lives as a text object
livesText = display.newText("Lives = " .. lives, 120, 20, nil, 50)
livesText:setTextColor(5/255, 5/255, 200/255)

--display the correct answer
correctAnswerObject = display.newText( "The correct answer is" ..  correctAnswer, display.contentWidth/2, display.contentHeight*3/4, nil, 50)
correctAnswerObject:setTextColor(5/255, 5/255, 200/255)
correctAnswerObject.isVisible = false

--add the event listener for thr numeric field
numericField:addEventListener( "userInput", NumericFieldsListener)

--FUNCTION CALLS

-- call the function to ask the question
AskQuestion()