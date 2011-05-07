package com.mindfunction.smirkengine.movingPlatform
{
	import com.mindfunction.smirkengine.Entity;
	
	public class MovingPlatform extends Entity
	{
		
		public var platform:MovingPlatformBehaviour = new MovingPlatformBehaviour();
		public function MovingPlatform()
		{
			super();
			addBehaviour(platform);
		}
	}
}