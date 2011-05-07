package com.mindfunction.smirkengine
{
	import flash.display.BitmapData;
	import flash.display.Sprite;

	public class ParallaxBackground
	{
		public var sprite:Sprite;
		public var distance:Number=0;
		public var bitmapData:BitmapData;
		public function ParallaxBackground(s:Sprite,d:Number)
		{
			sprite=s;
			distance=d;
			bitmapData=new BitmapData(s.width,s.height,true,0x00000000);
			bitmapData.draw(s);
		}
	}
}