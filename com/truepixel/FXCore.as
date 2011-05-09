//
// Author: Dariusz Rusin // truepixel.pl
//

package com.truepixel  {
	import flash.display.MovieClip;
	import flash.display.Shape;
	
	public class FXCore extends MovieClip{

		public function FXCore() {
			// Make a smile :)
		}	
		
		public function doStripAnimation(animMC:MovieClip, strips:Number):void{
			var _stripAnimation = new StripAnimation(animMC, strips);
		}
		
		public function killProcess(_class:*):void{
			_class = null;		
		}

	}
	
}
