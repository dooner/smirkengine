package
{
	import com.mindfunction.smirkengine.EntityBehaviour;
	
	public class BasicEnemyBehaviour extends EntityBehaviour
	{
		public function BasicEnemyBehaviour()
		{
			super();
			
		}
		
		protected virtual override  function activationFunction():void{
			ShotemUpEntity(entity).platform.xSpeed=-(Math.random()*2+2);
		}
		
		protected virtual override function updateFunction():void{
			
				
			if(ShotemUpEntity(entity).platform.x<-180){
				entity.parent.removeChild(entity);
			}
		}
	}
}