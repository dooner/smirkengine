package
{
	import com.mindfunction.smirkengine.general.LifeTimeBehaviour;

	public class Particle extends ShotemUpEntity
	{
		public function Particle()
		{
			super();
			addBehaviour(new LifeTimeBehaviour(20));
			platform.xSpeed=Math.random()*6-3;
			platform.ySpeed=Math.random()*6-3;
		}
	}
}