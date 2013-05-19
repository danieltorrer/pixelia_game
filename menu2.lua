-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

local storyboard = require "storyboard"
local widget = require( "widget" )

local scene = storyboard.newScene()

local button1Release = function( event )
storyboard.gotoScene( "oneplayer", "slideLeft", 800  )
end

local button2Release = function( event )
storyboard.gotoScene( "multiplayer", "slideLeft", 800  )
end

local button3Release = function( event )
storyboard.gotoScene( "extras", "slideLeft", 800  )
end

local button4Release = function( event )
storyboard.gotoScene( "options", "slideLeft", 800  )
end

local group = display.newGroup()

function scene:createScene( event )
	local screenGroup = self.view

	image = display.newImage( "bg2.jpg" )
	screenGroup:insert( image )
	
	text1 = display.newText( "Caballeros de Pixelia", 0, 0, Silkscreen, 24 )
	text1:setTextColor( 255 )
	text1:setReferencePoint( display.CenterReferencePoint )
	text1.x, text1.y = display.contentWidth * 0.5, 50
	screenGroup:insert( text1 )

	image:addEventListener( "touch", image )
	
end

function scene:enterScene( event )

		button1 = widget.newButton {
		defaultFile = "buttonBlue.png",
		overFile = "buttonBlueOver.png",
		onPress = button1Press,
		onRelease = button1Release,
		label = "One-player",
		left = 10,
		top = 160,
	}
	
	

		button2 = widget.newButton{
		defaultFile = "buttonBlue.png",
		overFile = "buttonBlueOver.png",
		onPress = button2Press,
		onRelease = button2Release,
		label = "Multiplayer",
		left = 10,
		top = 160 + 65,
	}
	
	group:insert(button1)
	group:insert(button2)
	--	local button3 = widget.newButton{
	--	default = "buttonBlue.png",
	--	over = "buttonBlueOver.png",
	--	onRelease = button3Release,
	--	label = "Extras",
	--	emboss = true
	--}
	--	local button4 = widget.newButton{
	--	default = "buttonBlue.png",
	--	over = "buttonBlueOver.png",
	--	onRelease = button4Release,
	--	label = "Options",
	--	emboss = true
	--}

	--screenGroup:insert(button1)
	--button1.x = 160; button1.y = 160
	--button2.x = 160; button2.y = 225
	--button3.x = 160; button3.y = 290
	--button4.x = 160; button4.y = 355

end


-- Called when scene is about to move offscreen:
function scene:exitScene( event )
	display.remove(button1)
	display.remove(button2)

--	
end


-- Called prior to the removal of scene's "view" (display group)
function scene:destroyScene( event )
end

---------------------------------------------------------------------------------
-- END OF YOUR IMPLEMENTATION
---------------------------------------------------------------------------------

-- "createScene" event is dispatched if scene's view does not exist
scene:addEventListener( "createScene", scene )
-- "enterScene" event is dispatched whenever scene transition has finished
scene:addEventListener( "enterScene", scene )
-- "exitScene" event is dispatched before next scene's transition begins
scene:addEventListener( "exitScene", scene )
-- "destroyScene" event is dispatched before view is unloaded, which can be
-- automatically unloaded in low memory situations, or explicitly via a call to
-- storyboard.purgeScene() or storyboard.removeScene().
scene:addEventListener( "destroyScene", scene )

---------------------------------------------------------------------------------

return scene