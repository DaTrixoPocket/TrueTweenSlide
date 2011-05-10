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

		public function StartClass() {
	
			
			var _img:exampleImage = new exampleImage();
			addChild(_img);
			_img.cacheAsBitmap = true;
		
			_tweenManager.addEventListener(AnimationEvent.END, doSomething, false, 0, true);
			_tweenManager.doStripAnimation(_img, 8); 
			// no way :/
			
			var simpleButton:SimpleButton = new SimpleButton();
			addChild(simpleButton);
		}
		
		private function doSomething(event:AnimationEvent):void
		{
				trace("Śmiga kufka!");
		}

	}
	
}
