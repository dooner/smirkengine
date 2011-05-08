package com.mindfunction.smirkengine.statemachine
{
	import flash.display.MovieClip;
	import flash.events.Event;

	public class SceneState extends GameState
	{
		
		private var _view:MovieClip;
		
		public function set view(__view:MovieClip):void{
			_view=__view;
		}
		
		public function get view():MovieClip{
			return _view;
		}
 		
		public function SceneState(__view:MovieClip)
		{
			super();
			view = __view;
		}
		
		protected virtual override function beforeEnter():void{
			view.visible=true;
			view.alpha=0;
			view.addEventListener(Event.ENTER_FRAME,fadeInEvent);
		}
		
		protected virtual override function afterExit():void{
			view.alpha=0;
			view.addEventListener(Event.ENTER_FRAME,fadeOutEvent);
			view.mouseEnabled=false;
			
		}
		
		private function fadeInEvent(e:Event):void{
			view.alpha+=0.05;
			if(view.alpha>=1.0){
				view.removeEventListener(Event.ENTER_FRAME,fadeInEvent);
				view.mouseEnabled=true;
			}
			
		}
		
		private function fadeOutEvent(e:Event):void{
			view.alpha-=0.05;
			if(view.alpha<=1.0){
				view.removeEventListener(Event.ENTER_FRAME,fadeOutEvent);
				view.visible=false;
			}
		}
		
	}
}