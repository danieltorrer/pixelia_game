-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

local storyboard = require "storyboard"

local scene = storyboard.newScene()

local function onSceneTouch( self, event )
	if event.phase == "began" then
		
		storyboard.gotoScene( "menu2", "slideLeft", 800  )
		
		return true
	end
end

function scene:createScene( event )
	local screenGroup = self.view
	
	image = display.newImage( "bg.jpg" )
	screenGroup:insert( image )
	
	image.touch = onSceneTouch
	
	text1 = display.newText( "Caballeros de Pixelia", 0, 0, Silkscreen, 24 )
	text1:setTextColor( 255 )
	text1:setReferencePoint( display.CenterReferencePoint )
	text1.x, text1.y = display.contentWidth * 0.5, 50
	screenGroup:insert( text1 )
	
	text2 = display.newText( "Tap to start.", 0, 0, Silkscreen, 18 )
	text2:setTextColor( 255 ); text2.isVisible = false
	text2:setReferencePoint( display.CenterReferencePoint )
	text2.x, text2.y = display.contentWidth * 0.5, display.contentHeight - 100
	screenGroup:insert( text2 )
	
end

function scene:enterScene( event )

	image:addEventListener( "touch", image )

	local showtext = function()
		text2.isVisible = true
	end
	memTimer = timer.performWithDelay( 800, showtext, 1 )

end


-- Called when scene is about to move offscreen:
function scene:exitScene( event )
	
	image:removeEventListener( "touch", image )

	timer.cancel( memTimer ); memTimer = nil;

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