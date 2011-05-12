package  {
	import flash.display.MovieClip;
	import com.truepixel.FXCore;
	import flash.display.SimpleButton;
	import flash.text.TextField;
	import flashx.textLayout.formats.TextAlign;
	import com.truepixel.Events.AnimationEvent;
	import flash.events.Event;

	
	public class StartClass extends MovieClip{

		private var _tweenManager:FXCore = new FXCore();
		
		public var _img:exampleImage;
		public var _img2:exampleImage2;

		public function StartClass() {
	
			
			_img = new exampleImage();
			addChild(_img);
			_img.cacheAsBitmap = true;
			
		
			_tweenManager.addEventListener(AnimationEvent.END, doSomething, false, 0, true);
			//_tweenManager.doStripAnimation(_img, "stripAnimation", 8); 
			_tweenManager.doSquareAnimation(_img, "squareAnimation"); 
			
			var simpleButton:SimpleButton = new SimpleButton();
			addChild(simpleButton);
		}
		
		private function doSomething(event:AnimationEvent):void
		{
/*
				trace("Anim name:" + event.target);
				if (event.animationName == "supaSlide"){
					removeChild(_img);
					_img2 = new exampleImage2();
					addChild(_img2);
					_img2.cacheAsBitmap = true;
					_tweenManager.doStripAnimation(_img2, "supaSlide2", 4); 
				} else {
					removeChild(_img2);
					_img = new exampleImage();
					addChild(_img);
					_img.cacheAsBitmap = true;
					_tweenManager.doStripAnimation(_img, "supaSlide", 8); 
				}
				
				 // _tweenManager.removeEventListener(AnimationEvent.END, doSomething);
*/
		}


	}
	
}
