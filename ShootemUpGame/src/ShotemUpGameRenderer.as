package
{
	import com.mindfunction.smirkengine.Entity;
	import com.mindfunction.smirkengine.GameRenderer;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.MovieClip;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.utils.Dictionary;

	public class ShotemUpGameRenderer extends GameRenderer
	{
				
		private var entityArray:Array=new Array();
		private var entityDictionary:Dictionary=new Dictionary();

		
		
		public function ShotemUpGameRenderer()
		{
			/*
			for(var i:int=0;i<400;i++){
				viewPort.graphics.lineStyle(1,0x0000FF,( i/4)/100);
				viewPort.graphics.moveTo(-1000,0+i);
				viewPort.graphics.lineTo(1000,-0+i);
			}*/
			
		}
				
		protected virtual override function entityAddedFunction(b:Entity):void{
			var view:Sprite=new Sprite();
			if(Object(b).constructor == Hero){
				
				view.graphics.beginFill(0xff00ff,1.0);
				view.graphics.drawRect(-5,-5,10,10);
				
			}
			else if(Object(b).constructor == Enemy){
				
				
				view.graphics.beginFill(Math.random()*0xFFFFFF,1.0);
				view.graphics.drawRect(-3,-3,6,6);
				
			}
			else if(Object(b).constructor == Bullet){
				
				
				view.graphics.beginFill(Math.random()*0xFFFFFF,1.0);
				view.graphics.drawCircle(0,0,4);
				
			}else if(Object(b).constructor == Particle){
			
				view.graphics.beginFill(Math.random()*0xFFFFFF,1);
				view.graphics.drawRect(-2,-2,4,4);
				
			}else{
				return;
			}
			
			
			var bm:BitmapData=new BitmapData(view.width,view.height,true,0x00000000);
			bm.draw(view);
			var bb:Bitmap=new Bitmap(bm);
			var s:Sprite=new Sprite();
			s.addChild(bb);
			
			viewPort.addChild(view);
			entityArray.push(b);
			entityDictionary[b]=view;
			
		}
		
		protected virtual override function entityRemovedFunction(b:Entity):void{
			entityArray.splice(entityArray.indexOf(b),1);
			viewPort.removeChild(entityDictionary[b]);
			entityDictionary[b]=null;
			
		}
		
		protected virtual override function updateFunction():void{
			for each(var e:ShotemUpEntity in entityArray){
				var view:Sprite=entityDictionary[e];
				view.x=e.platform.x;
				view.y=e.platform.y;
			}
		}
		
		
		
		
		
	}
}