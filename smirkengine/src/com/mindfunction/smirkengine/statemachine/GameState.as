package com.mindfunction.smirkengine.statemachine
{
	import flash.display.MovieClip;
	
	
	public class GameState
	{
		
		private var exitFunctions:Array=new Array();
		private var enterFunctions:Array=new Array();
		private var exitStates:Array=new Array();
		
		public final function addExitState(_state:GameState,_condition:Function=null):void{
			var stateChangingCondition:StateChangingCondition=new StateChangingCondition(_state,_condition);
			exitStates.push(stateChangingCondition);
		}
		
		public function addExitFunction(f:Function):void{
			exitFunctions.push(f);
		}
		
		public function addEnterFunction(f:Function):void{
			enterFunctions.push(f);
		}
		
		private var currentCondition:Function;
		private var currentFunction:Function;
		
		public final function exitState():void{
			trace("MAMAMA");
			for each(currentFunction in exitFunctions){
				trace("MAMAMA4");
				this.currentFunction();
			}
			trace("MAMAMA3");
			for each(var stateChangingCondition:StateChangingCondition in exitStates){
				
				this.currentCondition=stateChangingCondition.condition;
				
				if( this.currentCondition==null || this.currentCondition()) {
						stateChangingCondition.state.enterState();	
				}
			}
			trace("MAMAMA2");
			afterExit();
		}
		
		public final function enterState():void{
			
			beforeEnter();
			for each(currentFunction in enterFunctions){
				this.currentFunction();
			}
			
		}
		
		protected virtual function beforeEnter():void{
			
		}
		
		protected virtual function afterExit():void{
			
		}
		
		
		public function GameState()
		{
			super();
		}
	}
}