
#Import "../renderwindow"

Using mojo..
Using std..

Class Game Extends RenderWindow

	Method New()					
		Super.New( "Test", 1280, 720, False, False )		'name, width, height, filterTextures, renderToTexture
	End
	
	Method OnUpdate() Override
	End
	
	Method OnDraw() Override
	End

End

Function Main()
	New AppInstance
	New Game()
	App.Run()
End


