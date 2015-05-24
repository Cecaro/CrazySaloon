package  {
	import flash.display.Stage;
	import flash.display.MovieClip;
	import flash.ui.*;
	import flash.events.*;
	
	public class Bullet extends MovieClip{
		private const bulletSpeed:int =6;
		private var dX:int;
		private var offStage:int;
		
		public function Bullet(xPos:int, yPos:int, sta:Stage){
			this.x = xPos;
			this.y = yPos;
			dX = bulletSpeed;
			offStage = sta.stageWidth;
		}
			
		public function moveBullet():void{
			this.x += dX;
			if(this.x>offStage){
				this.destroy();
			}
		}
		
		public function destroy():void{
			this.parent.removeChild(this);
			trace("killed");
		}

	}
	
}
