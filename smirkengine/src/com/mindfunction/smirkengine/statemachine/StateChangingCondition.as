package com.mindfunction.smirkengine.statemachine
{
	public class StateChangingCondition
	{
		public static var TrueCondition:Function=function():Boolean{
			return true;
		}
		
		public static var FalseCondition:Function=function():Boolean{
			return false;
		}
		
		public var condition:Function;
		public var state:GameState;
		public function StateChangingCondition(_state:GameState,_condition:Function){
			
			condition=_condition;
			state=_state;
		}
	}
}