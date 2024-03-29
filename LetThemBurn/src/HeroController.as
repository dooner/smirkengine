package
{
	import com.mindfunction.smirkengine.general.KeyboardController;
	
	import flash.display.Stage;
	import flash.ui.Keyboard;
	
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
					Hero(entity).platform.xSpeed=-3;
					leftPressed=true;
					break;
				case rightCode:
					Hero(entity).platform.xSpeed=3;
					rightPressed=true;
					break;
				case upCode:
					Hero(entity).platform.ySpeed=-3;
					upPressed=true;
					break;
				case downCode:
					Hero(entity).platform.ySpeed=3;
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
		private var counter:int=0;
		public virtual override function update():void{
			
		
			
			if(spacePressed){
				
				
				
					if(counter>5){
						
					
						var bullet:Bullet2=new Bullet2();
						bullet.platform.xSpeed=0;
						bullet.platform.ySpeed=0;
						
						bullet.platform.xSpeed=8;
				
						bullet.platform.x=Hero(entity).platform.x+23;
						bullet.platform.y=Hero(entity).platform.y;
						entity.parent.addChild(bullet);
						
						
						var bullet2:Bullet=new Bullet();
						bullet2.platform.xSpeed=0;
						bullet2.platform.ySpeed=-2;
						
						bullet2.platform.xSpeed=7;
						
						bullet2.platform.x=Hero(entity).platform.x+23;
						bullet2.platform.y=Hero(entity).platform.y;
						entity.parent.addChild(bullet2);

						
						bullet2=new Bullet();
						bullet2.platform.xSpeed=0;
						bullet2.platform.ySpeed=2;
						
						bullet2.platform.xSpeed=7;
						
						bullet2.platform.x=Hero(entity).platform.x+23;
						bullet2.platform.y=Hero(entity).platform.y;
						entity.parent.addChild(bullet2);

						
			
						SoundEngine.singleton.playFire1();
							
						counter=0;
					}
					counter++;	
				
			}else{
				counter=5;
			}	
		}
		
	}
}