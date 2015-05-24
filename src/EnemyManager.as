package  {
	import flash.display.Stage;
	import flash.display.Sprite;
	import flash.display.MovieClip;
	import flash.ui.*;
	import flash.events.*;
	import flash.utils.*;
	
	public class EnemyManager extends MovieClip {
		public var enemyCount:int = 1;
		private const _ENEMYFREQUENCY=2000;
		private var _makeEnemiesTimer:Timer = new Timer(_ENEMYFREQUENCY);
		public var waveNum:int = 1;
		
		public function EnemyManager() {
			_makeEnemiesTimer.addEventListener(TimerEvent.TIMER, timerEvHandler);
			// Start the timer
			_makeEnemiesTimer.start();
		}
		
		public function getWaveNumber():int{
			return waveNum;
		}
		
		public function timerEvHandler(e:TimerEvent):void{
			//the if statment creates a wave system for the enemies with a boss wave every 5 waves
			if(this.numChildren == 0 && waveNum % 5 != 0) {
				for(var i:int = 0; i < enemyCount + waveNum; i++){
					var eX = Math.random() * 600; 
						if(eX < 250) eX = 250;
						if(eX > 535) eX = 535;
						if( i % 2 == 0 ){
						   createEnemy(eX , 248);
						   }
						 else {
							 createEnemy(eX, 198);
						 }  
				}
				waveNum++;
			trace(waveNum);
			}
			if(this.numChildren == 0 && waveNum % 5 == 0){
				createBoss(400, 90);
				waveNum++;
			}
		}
		public function checkEnemy():int{
			for(var j:int = 0; j < this.numChildren; j++){
				if(this.getChildAt(j) is Enemy){
					return 1;
				}
				else if (this.getChildAt(j) is Boss){
					return 2;
				}
			}
			return 0;
		}
		public function numEnemies():int{
			var count:int = 0;
			for(var i:int = 0; i < this.numChildren;i++){
				count++;
			}
			return count;
		}
		
		public function createEnemy (xE:int, yE:int):void{
			var tmpEnemy:Enemy = new Enemy();
			tmpEnemy.init(xE, yE);
			this.addChild(tmpEnemy);
		}
		
		public function createBoss (xB:int, yB:int):void{
			var tmpBoss:Boss = new Boss();
			tmpBoss.init(xB, yB);
			this.addChild(tmpBoss);
		}
		
		public function destroy():void {
			_makeEnemiesTimer.stop();
			this.parent.removeChild(this);
		}
	}
	
}
