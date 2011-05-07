package
{
	import com.mindfunction.smirkengine.EntityBehaviour;
	
	import com.mindfunction.smirkengine.collider.CollidedEvent;
	import com.mindfunction.smirkengine.collider.ColliderBehaviour;
	
	import com.mindfunction.smirkengine.movingPlatform.MovingPlatform;
	
	public class BulletTargetBehaviour extends EntityBehaviour
	{
		public function BulletTargetBehaviour()
		{
			super();
			
		}
		
		protected virtual override function activationFunction():void{
			
			var _collider:ColliderBehaviour;
			_collider = entity.behaviours[ColliderBehaviour]
			if(_collider){
			//	trace("HOOraaaaaaaa");
				_collider.addEventListener(ColliderBehaviour.COLLIDED,collidedEvent);
				
			}
		}
		
		private function collidedEvent(e:CollidedEvent):void{
			//trace("Bullet Carpti bana " + Object(e.targetCollider).constructor);
			if(Object(e.targetCollider.entity).constructor == Bullet){
			//	trace("Bullet Carpti bana");
				
				for(var i:Number=0;i<5;i++){
			//		trace("HOOOOOY");
					var p:Particle=new Particle();
					p.platform.x=MovingPlatform(entity).platform.x;
					p.platform.y=MovingPlatform(entity).platform.y;
					
					//trace(entity.parent);
					if(entity.parent)
						entity.parent.addChild(p);
					
				}
				
				
				//e.targetCollider.entity.destroy();
				entity.destroy();
				
			}
		}
		
		protected virtual override function deactivationFunction():void{
			var _collider:ColliderBehaviour;
			_collider = entity.behaviours[ColliderBehaviour]
			if(_collider){
				_collider.removeEventListener(ColliderBehaviour.COLLIDED,collidedEvent);
					
			}
		}
		
	}
}