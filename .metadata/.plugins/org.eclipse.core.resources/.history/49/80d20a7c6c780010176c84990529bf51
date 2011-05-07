package com.mindfunction.smirkengine.general
{
	import com.mindfunction.smirkengine.EntityBehaviour;
	
	public class LifeTimeBehaviour extends EntityBehaviour
	{
		
		private var lifeTime:Number;
		public function LifeTimeBehaviour(t:Number)
		{
			super();
			
			lifeTime=t;
		}
		
		public virtual override function update():void{
			
			
			lifeTime--;
			if(lifeTime<=0){
				entity.parent.removeChild(entity);
			}
			
		}
	}
}