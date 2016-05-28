
#Import "../renderwindow>"
#Import "<mojo>"

Using mojo..
Using std..

Class TestWindow Extends RenderWindow

	Method New()					
		Super.New( "Test", 1280, 720, False, False )		'name, width, height, filterTextures, renderToTexture
		bgColor = Color.DarkGrey
	End
	
	Method OnUpdate() Override
		If Keyboard.KeyHit( Key.T )
			renderToTexture = Not renderToTexture
		End
		If Keyboard.KeyHit( Key.D )
			debug = Not debug
		End
		If Keyboard.KeyHit( Key.L )
			CycleLayout()
		End
		If Keyboard.KeyHit( Key.R )
			Select Height
				Case 480
					SetVirtualResolution( 256, 192 )
				Case 192
					SetVirtualResolution( 1280, 720 )
				Default
					SetVirtualResolution( 640, 480 )
			End
		End
		
		'Camera animation
		camera.X = Sin( Millisecs()/500.0 ) * 50.0
		camera.Y = Cos( Millisecs()/500.0 ) * 50.0
	End
	
	Method OnDraw() Override
		Echo( "Press T to toggle Render To Texture," )
		Echo( "Press D to toggle this info" )
		Echo( "Press L to cycle layouts" )
		Echo( "Press R cycle virtual resolutions" )
		Echo( "" )
		
		'Layer 1
		DrawGrid( 32, 12, 8, "parallax = 1.0" )
		
		'Layer 2
		Parallax = 0.25
		canvas.Color = New Color( 1.0, 1.0, 1.0, 0.5 )
		DrawGrid( 32, 12, 8, "parallax = 0.25" )
	End
	
	Method DrawGrid( cellSize:Float, rows:Int, columns:Int, label:String = "" )
		Local xStart := -cellSize * ( rows/2 )
		Local yStart := -cellSize * ( columns/2 )
		Local xEnd := cellSize * ( rows/2 )
		Local yEnd := cellSize * ( columns/2 )
		For Local x := xStart To xEnd Step cellSize
			canvas.DrawLine( x, yStart , x, yEnd )
		Next
		For Local y := yStart To yEnd Step cellSize
			canvas.DrawLine( xStart, y, xEnd, y )
		Next
		If label Then canvas.DrawText( label, xEnd, yEnd, 1.0, 0 )
	End

End

Function Main()
	New AppInstance
	New TestWindow()
	App.Run()
End


