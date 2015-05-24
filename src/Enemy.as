package  {
	import flash.display.Stage;
	import flash.display.MovieClip;
	
	
	public class Enemy extends MovieClip {
		
		public function Enemy() {
			// constructor code
		}
		
		public function init (xE:int, yE:int):void {//remove the stage as parameter if not needed later on
			this.x = xE;
			this.y = yE;
		}
		
		public function destroy():void{
			this.parent.removeChild(this);
		}
	}
}
