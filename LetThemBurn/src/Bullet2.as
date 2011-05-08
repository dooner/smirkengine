package
{
	import com.mindfunction.smirkengine.collider.ColliderBehaviour;
	import com.mindfunction.smirkengine.general.LifeTimeBehaviour;

	public class Bullet2 extends ShotemUpEntity
	{
		public function Bullet2()
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