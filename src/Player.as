package {
	import flash.display.Stage;
	import flash.display.MovieClip;
	import flash.ui.*;
	import flash.events.*;
	
	public class Player extends MovieClip {
		
		var player:Player;
		var playerSpeed:int = 5;
		var playerBackSpeed:int = 3;
		var playerJumpSpeed:int = 0;
		var gravity:int = 1;
		var touchGround:Boolean = true;
		var f:int = 0;
		var playerAlive:Boolean = false;
		
		public function Player() {
			this.visible= false;
		}
		
		public function init() {
			this.visible = true; 
			this.addEventListener(Event.ENTER_FRAME, doPlayerJump);
			playerAlive = true;
		}
		
		public function hit() {
			playerAlive = false;
		}
		
		public function isPlayerAlive():Boolean{
			return playerAlive;
		}
		
		public function movePlayerLeft():void {
				this.x -= playerBackSpeed;
				if(this.x <= 50){
					this.x = 50;
				}
		}
		public function movePlayerRight():void {
				this.x += playerSpeed;
				if(this.x >= 590){
					this.x = 590;
				}
		}
		public function doPlayerJump(e:Event = null):void{
			if(f%2 == 0){
				playerJumpSpeed += gravity;
				this.y += playerJumpSpeed;
				if(this.y > 246){
					this.y = 246;
					touchGround = true;
					f = 0;
					playerJumpSpeed = 0;
				}
			}
			f ++;
		}
		
		public function playerJump():void{
			if (touchGround){
				playerJumpSpeed = -15; 
				touchGround = false;
			}
			
		}
		public function playerFall():void{
			if (playerJumpSpeed < -3){
				playerJumpSpeed = -3;
			}
		}

	}
	
}
