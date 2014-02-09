package {
	
	import flash.display.*;
	import flash.geom.*;
	import flash.events.*;
	
	public class MiniGame1 extends MovieClip{
		
		private var _root:MovieClip;
		private var timer:int = 300;
		
		private var tileSheet:BitmapData;	
		private var backgroundBD:BitmapData;
		private var backgroundRect:Rectangle;
		private var backgroundPoint:Point;		
		private var canvasBD:BitmapData;
		private var canvasBitmap:Bitmap;
		
		public function MiniGame1 (root:MovieClip){
			_root = root;
			tileSheet = new spriteSheet(864, 432);
			backgroundBD = new BitmapData(288,432,false,0x000000);
			backgroundRect = new Rectangle(0,0,288,432);
			backgroundPoint = new Point(0, 0);
			canvasBD = new BitmapData(288,432,false,0x000000);	
			canvasBitmap = new Bitmap(canvasBD);
			prepareMiniGame();
			
            _root.addChild(canvasBitmap);			
			
			canvasBD.copyPixels(tileSheet, backgroundRect, backgroundPoint);
		}	
		
		private function prepareMiniGame():void{
			trace("Loaded MiniGame 1");
			addEventListener(Event.ENTER_FRAME, eFrame);
		}
		
		private function eFrame(e:Event):void{
            timer--;
			_root.timerText.text = ""+timer;
			_root.setChildIndex(_root.timerText, _root.numChildren-1);
			
			if(timer <= 0){
				nextGame();
			}
		}
		
		private function nextGame():void{
			_root.removeChild(this);
			_root.minigame1 = null;
			removeEventListener(Event.ENTER_FRAME, eFrame);
			_root.nextFrame();
		}
	}		
}