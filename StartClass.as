package  {
	import flash.display.MovieClip;
	import com.truepixel.FXCore;
	import flash.display.SimpleButton;
	import flash.text.TextField;
	import flashx.textLayout.formats.TextAlign;

	
	public class StartClass extends MovieClip{

		private var _fxCore:FXCore = new FXCore();

		public function StartClass() {
	
			
			var _img:exampleImage = new exampleImage();
			addChild(_img);
			_img.cacheAsBitmap = true;
		
			_fxCore.doStripAnimation(_img, 8);

			
			var simpleButton:SimpleButton = new SimpleButton();
			

			
			addChild(simpleButton);
		}

	}
	
}
