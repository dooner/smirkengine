package
{
	import com.mindfunction.smirkengine.Entity;
	import com.mindfunction.smirkengine.GameRenderer;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.MovieClip;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.utils.Dictionary;

	public class ShotemUpGameRenderer extends GameRenderer
	{
				
		private var entityArray:Array=new Array();
		private var entityDictionary:Dictionary=new Dictionary();


		[Embed(source="SpriteSet.png")]
		private var SpriteSet:Class;
		private var spriteSet:Bitmap=new SpriteSet();
		
		
		[Embed(source="BulletSpriteSet.png")]
		private var BulletSpriteSet:Class;
		private var bulletSpriteSet:Bitmap=new BulletSpriteSet();
		
		
		[Embed(source="opening1.png")]
		private var Opening1:Class;
		private var opening1:Bitmap=new Opening1();
		
		[Embed(source="opening2.png")]
		private var Opening2:Class;
		private var opening2:Bitmap=new Opening2();
		
		[Embed(source="opening3.png")]
		private var Opening3:Class;
		private var opening3:Bitmap=new Opening3();
		
		public function ShotemUpGameRenderer()
		{
			/*
			for(var i:int=0;i<400;i++){
				viewPort.graphics.lineStyle(1,0x0000FF,( i/4)/100);
				viewPort.graphics.moveTo(-1000,0+i);
				viewPort.graphics.lineTo(1000,-0+i);
			}*/
			
			
			
		}
		
		
		private function getSprite(x:int,y:int,width:int,height:int,set:Bitmap=null):Sprite{
			
			var bitmapData:BitmapData=new BitmapData(width,height);
			if(!set){
				bitmapData.copyPixels(spriteSet.bitmapData,new Rectangle(x,y,width,height),new Point(0,0));
			}else{
				bitmapData.copyPixels(set.bitmapData,new Rectangle(x,y,width,height),new Point(0,0));
			}
			
			var bitmap:Bitmap=new Bitmap(bitmapData);
			
			var view:Sprite=new Sprite();
			
			view.addChild(bitmap);
			bitmap.x=-bitmap.width/2;
			bitmap.y=-bitmap.height/2;
			return view;
			
		}
		
		private function getRandomEnemy():Sprite{
			switch(Math.floor(Math.random()*5)){
				
				case 0:
					return getSprite(206,3,24,22);
					break;
				case 1:
					return getSprite(234,3,26,22);
					break;
				case 2:
					return getSprite(264,3,20,22);
					break;
				case 3:
					return getSprite(289,3,13,22);
					break;
				case 4:
					return getSprite(188,3,14,21);
					break;
				
			}
			return new Sprite();
		}
				
		protected virtual override function entityAddedFunction(b:Entity):void{
			var view:Sprite=new Sprite();
			if(Object(b).constructor == Hero){
				
				view=getSprite(3,3,46,22);
				
			}
			else if(Object(b).constructor == Enemy){
				
				
				view=getRandomEnemy();
				
			}
			else if(Object(b).constructor == Bullet){
				
				view=getSprite(459,3,14,9,bulletSpriteSet);
				
			}else if(Object(b).constructor == Bullet2){
				
				
				view=getSprite(421,3,34,11,bulletSpriteSet);
				
			}else if(Object(b).constructor == Particle){
			
				view=getSprite(244,18,7,7,bulletSpriteSet);
				
			}else if(Object(b).constructor == OpeningScreen1){
				trace("opening1");
				view.addChild(opening1);
				
			}else if(Object(b).constructor == OpeningScreen2){
				
				view.addChild(opening2);
				
			}else if(Object(b).constructor == OpeningScreen3){
				
				view.addChild(opening3);
				
			}else{
				return;
			}
			
			
			 
			
			viewPort.addChild(view);
			entityArray.push(b);
			entityDictionary[b]=view;
			updateEntity(ShotemUpEntity(b));
			
		}
		
		protected virtual override function entityRemovedFunction(b:Entity):void{
			entityArray.splice(entityArray.indexOf(b),1);
			viewPort.removeChild(entityDictionary[b]);
			entityDictionary[b]=null;
			
		}
		
		protected virtual override function updateFunction():void{
			for each(var e:ShotemUpEntity in entityArray){
				updateEntity(e);
			}
		}
		
		private function updateEntity(e:ShotemUpEntity){
			var view:Sprite=entityDictionary[e];
			view.x=e.platform.x;
			view.y=e.platform.y;
			
			view.alpha=e.renderer.alpha;
		}
		
		
		
		
	}
}