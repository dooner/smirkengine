package
{
	import com.mindfunction.smirkengine.collider.ColliderBehaviour;
	import com.mindfunction.smirkengine.general.LifeTimeBehaviour;

	public class Bullet extends ShotemUpEntity
	{
		
		private var coll:ColliderBehaviour;
		public function Bullet()
		{
			super();
			addBehaviour(new LifeTimeBehaviour(40));
			var coll:ColliderBehaviour=new ColliderBehaviour();
			coll.channel=1;
			addBehaviour(coll);
			
			
			behaviours[ColliderBehaviour].width=20;
			behaviours[ColliderBehaviour].height=20;
		}
		
		
		
	}
}