package  {
	import flash.display.Stage;
	import flash.display.MovieClip;
	import flash.ui.*;
	import flash.events.*;
	
	public class enBullet extends MovieClip{
		
		private const bulletSpeed:int =6;
		private var dX:int;
		private var dY:int;
		private var angle1:int = 160;
		private var angle2:int = 135;
		private var rads:Number;
		private var degs:Number;
		
		public function enBullet(tX:int, tY:int, ex:int, ey:int, type:int){
				this.x = ex;
				this.y = ey;
				//calculating the angle of the direction between the starting position of the bullet
				//and the player's position
				var angDir:Number = Math.atan((-ey + tY)/(ex - tX));
				switch(type){
					case 0:
						dX = Math.cos(angDir) * bulletSpeed;
						dY = Math.sin(angDir) * bulletSpeed;
						break;
					case 1: 
						angDir += toRads(20);
						dX = Math.cos(angDir) * bulletSpeed;
						dY = Math.sin(angDir) * bulletSpeed;
						break;
					case 2: 
						angDir -= toRads(20);
						dX = Math.cos(angDir) * bulletSpeed;
						dY = Math.sin(angDir) * bulletSpeed;
						break;
				}
		}
		
		//function to convert an angle in degrees to radians to use the in-built Math functions
		public function toRads(angle:int):Number{
			rads = (angle*Math.PI) / 180;
			return rads;
		}
		//function to convert an angle from radians to degrees if needed
		public function toDegs(angle:Number):Number{
			degs = (angle * 180) / Math.PI;
			return degs;
		}
		
		//moving the bullet
		public function moveBullet():void{
			this.x -= dX;
			this.y += dY;
			if(this.x<0){
				this.destroy();
			}
		}
		
		public function destroy():void{
			this.parent.removeChild(this);
			//trace("killed");
		}

	}
	
}

