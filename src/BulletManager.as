package  {
	import flash.display.Stage;
	import flash.display.Sprite;
	import flash.display.MovieClip;
	import flash.ui.*;
	import flash.events.*;
	import flash.utils.*;
	
	public class BulletManager extends Sprite{
		
		private var bossHit:int;
		private var _enemyManager:EnemyManager;
		public var enemyDead:int = 0;
		
		public function BulletManager(enemyMgr:EnemyManager) {
			// constructor code
			_enemyManager = enemyMgr;
		}
		public function getNumDeadEn():int{
			return enemyDead;
		}
		public function createBullet(x, y):void { 
			trace("tested");
			var tmpBullet:Bullet = new Bullet(x,y,stage);
			addChild(tmpBullet);
			trace(this.numChildren);
		}
		
		//call the moveBullet() function from Bullet class for all the player's bullets
		public function moveBullets():void{	
			var tmpBullet:Bullet;
			var bulletNum:int;
			for(bulletNum = 0; bulletNum < this.numChildren; bulletNum ++) {
				tmpBullet=(this.getChildAt(bulletNum) as Bullet);
				tmpBullet.moveBullet();
			}
		}
		
		//Handles all the player's bullets collisions with enemies, bosses and their bullets
		public function checkCollisionsE(enemyMgr:EnemyManager):void {
			var tmpBullet:Bullet;
			var tmpEnemy:Enemy;
			var tmpBoss:Boss;
			var bulletNum, enemyNum, bossNum:int;
			// check each missile..
			for (bulletNum= 0; bulletNum< this.numChildren; bulletNum++) {
				tmpBullet=(this.getChildAt(bulletNum) as Bullet);
				//checking against all the enemies
				for (enemyNum = 0; enemyNum< enemyMgr.numChildren; enemyNum++) {
					if(enemyMgr.getChildAt(enemyNum) is Enemy){
						tmpBullet=(this.getChildAt(bulletNum) as Bullet);
						tmpEnemy=(enemyMgr.getChildAt(enemyNum) as Enemy);
						if (tmpBullet.hitTestObject(tmpEnemy)) {
							tmpEnemy.destroy();
							tmpBullet.destroy();
							enemyDead++;
							break;
						}
					}
					else if(enemyMgr.getChildAt(enemyNum) is Boss){
						tmpBoss=(enemyMgr.getChildAt(enemyNum) as Boss);
						if (tmpBullet.hitTestObject(tmpBoss)) {
							bossHit++;
							tmpBullet.destroy();
							break;
						}
						if(bossHit == 2 * _enemyManager.getWaveNumber()){
							tmpBoss.destroy();
							enemyDead += 5;
						}
					}	
					else {
						trace("no enemies on screen");
						break;
					}
				}
			}
		}
		public function checkCollisionsBu(enBulletMgr:enBulletManager):void {
			var tmpBullet:Bullet;
			var tmpEnBullet:enBullet;
			var bulletNum, enBulletNum:int;
			// check each missile..
			for (bulletNum= 0; bulletNum< this.numChildren; bulletNum++) {
				//against all enemy bullets
				for (enBulletNum = 0; enBulletNum < enBulletMgr.numChildren; enBulletNum++){
					tmpBullet=(this.getChildAt(bulletNum) as Bullet);
					tmpEnBullet=(enBulletMgr.getChildAt(enBulletNum) as enBullet);
					if (tmpBullet.hitTestObject(tmpEnBullet)) {
						tmpBullet.destroy();
						tmpEnBullet.destroy();
						break;
					}
				}
				
			}
		}
		public function destroy():void {
			this.parent.removeChild(this);
		}

	}
	
}
