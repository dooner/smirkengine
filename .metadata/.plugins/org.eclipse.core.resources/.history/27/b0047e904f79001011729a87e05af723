package com.mindfunction.smirkengine.general
{
	import com.mindfunction.smirkengine.EntityBehaviour;
	
	import flash.display.Stage;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	
	public class KeyboardController extends EntityBehaviour
	{
		
		private var stage:Stage;
		public function KeyboardController(_stage:Stage)
		{
			super();
			stage=_stage;
		}
		
		
		
		protected virtual override function activationFunction():void{
			//trace("KeyboardBehaviour Activated");
			stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDownHandler);
			stage.addEventListener(KeyboardEvent.KEY_UP, keyUpHandler);
		}
		
		protected virtual override function deactivationFunction():void{
		//	trace("KeyboardBehaviour deActivated");
			stage.removeEventListener(KeyboardEvent.KEY_DOWN, keyDownHandler);
			stage.removeEventListener(KeyboardEvent.KEY_UP, keyUpHandler);
			
		}
		
		private function keyDownHandler(event:KeyboardEvent):void {
			doKeyDown(event.keyCode);
		}
		protected virtual function doKeyDown(key:Number):void{
			
		}
		private function keyUpHandler(event:KeyboardEvent):void {
			doKeyUp(event.keyCode);
		}
		protected virtual function doKeyUp(key:Number):void{
			
		}
		
	}
}