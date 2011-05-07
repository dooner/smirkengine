package
{
	import flash.display.Stage;
	import flash.ui.Keyboard;
	import com.mindfunction.smirkengine.general.KeyboardController;
	
	public class HeroController extends KeyboardController
	{
		public function HeroController(_stage:Stage)
		{
			super(_stage);
		}
		
		private var leftCode:Number=Keyboard.LEFT;
		private var rightCode:Number=Keyboard.RIGHT;
		private var upCode:Number=Keyboard.UP;
		private var downCode:Number=Keyboard.DOWN;
		
		
		private var leftPressed:Boolean=false;
		private var rightPressed:Boolean=false;
		private var upPressed:Boolean=false;
		private var downPressed:Boolean=false;
	
		private var spacePressed:Boolean=false;
		
		protected override virtual function doKeyDown(key:Number):void {
			
			switch(key){
				case leftCode:
					Hero(entity).platform.xSpeed=-4;
					leftPressed=true;
					break;
				case rightCode:
					Hero(entity).platform.xSpeed=4;
					rightPressed=true;
					break;
				case upCode:
					Hero(entity).platform.ySpeed=-4;
					upPressed=true;
					break;
				case downCode:
					Hero(entity).platform.ySpeed=4;
					downPressed=true;
					break;
				case Keyboard.SPACE:
					spacePressed=true;
					
					break;
			}
			
		}
		
		protected override virtual function doKeyUp(key:Number):void {
			switch(key){
				case leftCode:
					leftPressed=false;
					break;
				case rightCode:
					rightPressed=false;
					break;
				case upCode:
					upPressed=false;
					break;
				case downCode:
					downPressed=false;
					break;
				case Keyboard.SPACE:
					spacePressed=false;
					break;
			}
			if(!(leftPressed || rightPressed)){
				Hero(entity).platform.xSpeed=0;
			}
			if(!(upPressed || downPressed)){
				Hero(entity).platform.ySpeed=0;
			}
		}	
		
		public virtual override function update():void{
			if(spacePressed){
				var bullet:Bullet=new Bullet();
				bullet.platform.xSpeed=0;
				bullet.platform.ySpeed=0;
				if(leftPressed){		
					bullet.platform.xSpeed=10;
					
				}
				if(rightPressed){		
					bullet.platform.xSpeed=-10;
					
				}
				if(downPressed){		
					
					bullet.platform.ySpeed=-10;
				}
				if(upPressed){		
					
					bullet.platform.ySpeed=10;
				} 
					bullet.platform.x=Hero(entity).platform.x;
					bullet.platform.y=Hero(entity).platform.y;
					entity.parent.addChild(bullet);
			
			
		
			}	
		}
		
	}
}