package com.mindfunction.smirkengine.collider
{
	import com.mindfunction.smirkengine.EntityBehaviour;
	
	import flash.geom.Rectangle;
	
	import com.mindfunction.smirkengine.movingPlatform.MovingPlatform;
	import com.mindfunction.smirkengine.movingPlatform.MovingPlatformBehaviour;

	public class ColliderBehaviour extends EntityBehaviour
	{
		
		public var channel:Number=0;
		
		public var width:Number=0;
		public var height:Number=0;

		public static const COLLIDED:String="COLLIDED";
		
		private function get platform():MovingPlatformBehaviour{
			return MovingPlatform(entity).platform;
		}
		
		
		public function ColliderBehaviour(c:int=0)
		{
			super();
			channel=c;

		}
		
		public function hitTest(target:ColliderBehaviour):Boolean{
			
			if(Math.abs(platform.x-target.platform.x)<(width+target.width)/2){
				if(Math.abs(platform.y-target.platform.y)<(height+target.height)/2){
					//var r:Rectangle=new Rectangle(platform.x,platform.y,width,height);
					//var r2:Rectangle=new Rectangle(target.platform.x,target.platform.y,target.width,target.height);
					return true;		
				}
			}
			
			
			
			//var a:Number=10+20+50/300;
			return false;
		}
		
		
	}
}