package
{
	import com.mindfunction.smirkengine.EntityBehaviour;
	
	public class FaderBehaviour extends EntityBehaviour
	{
		public function FaderBehaviour(_nextFader:FaderBehaviour=null)
		{
			super();
			nextFader=_nextFader;
		}
		
		private var fadeStarted:Boolean=false;
		private var fadingPhase:int=0;
		private var waitCounter:int=0;
		private var nextFader:FaderBehaviour;
		public function startFade(){
			fadeStarted=true;	
		}
		
		protected override function updateFunction():void{
			if(fadeStarted){
				if(fadingPhase==0){
					ShotemUpEntity(entity).renderer.alpha+=0.05;
					if(ShotemUpEntity(entity).renderer.alpha>=1){
						ShotemUpEntity(entity).renderer.alpha=1;
						fadingPhase=1;
						waitCounter=0;
					}
				}else if(fadingPhase==1){
					if(nextFader){
						waitCounter++;
						if(waitCounter>80){
							fadingPhase=2;
						}
					}
				}else if(fadingPhase==2){
					ShotemUpEntity(entity).renderer.alpha-=0.05;
					if(ShotemUpEntity(entity).renderer.alpha<=0){
						ShotemUpEntity(entity).renderer.alpha=0;
						fadeStarted=false;
						waitCounter=0;
						if(nextFader){
							nextFader.startFade();
						}
					}
				}
					
			}
		}
	}
}