package  {
	import flash.display.Stage;
	import flash.display.Sprite;
	import flash.display.MovieClip;
	import flash.ui.*;
	import flash.events.*;
	import flash.utils.*;
	
	public class enBulletManager extends Sprite{ 
		
		public function enBulletManager() {
			// constructor code
		}
		public function createBullet(xDir:int, yDir:int, enemyManager:EnemyManager):void { 
			//trace("tested");
			var tmpEnm:Enemy;
			for(var i:int = 0; i < enemyManager.numChildren; i++){
				if(enemyManager.getChildAt(i) is Enemy){
					var tmpBullet:enBullet = new enBullet(xDir, yDir, enemyManager.getChildAt(i).x, enemyManager.getChildAt(i).y + 20,0);
					addChild(tmpBullet);
				}
				else if(enemyManager.getChildAt(i) is Boss){
					//trace("Boss shoot");
					for(var j:int = 0; j < 3; j++){
						var tmpBBullet:enBullet = new enBullet(xDir, yDir,enemyManager.getChildAt(i).x, enemyManager.getChildAt(i).y + 50,j);
						addChild(tmpBBullet);
					}
				}
			}
		}
		
		public function moveBullets():void{	
			var tmpBullet:enBullet;
			var bulletNum:int;
			for(bulletNum = 0; bulletNum < this.numChildren; bulletNum ++) {
				tmpBullet=(this.getChildAt(bulletNum) as enBullet);
				tmpBullet.moveBullet();
			}
		}
		
		public function checkCollisions(player:Player):void {
			var tmpBullet:enBullet;
			var bulletNum:int;
			// check each missile..
			for (bulletNum= 0; bulletNum< this.numChildren; bulletNum++) {
				// ...against each enemy
					tmpBullet=(this.getChildAt(bulletNum) as enBullet);
					if (tmpBullet.hitTestObject(player)) {
						tmpBullet.destroy();
						player.hit();
						break;
					}
			}
		}
		
		
		public function destroy():void {
			this.parent.removeChild(this);
		}

	}
	
}