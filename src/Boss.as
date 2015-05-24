package  {
	
	import flash.display.Stage;
	import flash.display.MovieClip;
	
	public class Boss extends MovieClip {
		
		public function Boss() {
			// constructor code
		}
		
		public function init (xE:int, yE:int):void {
			this.x = xE;
			this.y = yE;
		}
		
		public function destroy():void{
			this.parent.removeChild(this);
		}
	}
	
}
