package com.mindfunction.smirkengine.movingPlatform
{
	import com.mindfunction.smirkengine.EntityBehaviour;

	public class MovingPlatformBehaviour extends EntityBehaviour
	{
		
		public var x:Number=0;
		public var y:Number=0;
		
		public var xSpeed:Number=0;
		public var ySpeed:Number=0;
		
		public function MovingPlatformBehaviour()
		{
			super();
		}
		
		protected virtual override function activationFunction():void{
		
		}
		
		protected virtual override function deactivationFunction():void{
		
		}
		
		protected virtual override function updateFunction():void{
		
		}
	}
}