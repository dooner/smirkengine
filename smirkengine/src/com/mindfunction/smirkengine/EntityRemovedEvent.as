package com.mindfunction.smirkengine
{
	import flash.events.Event;
	
	public class EntityRemovedEvent extends Event
	{
		
		public var entity:Entity;
		
		public function EntityRemovedEvent(type:String, e:Entity, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			entity=e;
		}
	}
}