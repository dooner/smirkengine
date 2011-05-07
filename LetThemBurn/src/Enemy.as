package
{
	import com.mindfunction.smirkengine.collider.ColliderBehaviour;

	public class Enemy extends ShotemUpEntity
	{
		public function Enemy()
		{
			super();
			addBehaviour(new ColliderBehaviour(2));
			addBehaviour(new BulletTargetBehaviour());
			//addBehaviour(new JumpingBehaviour());
			addBehaviour(new BasicEnemyBehaviour());
			behaviours[ColliderBehaviour].width=16;
			behaviours[ColliderBehaviour].height=16;
		}
	}
}