//
// Author: Dariusz Rusin // truepixel.pl
//

package com.truepixel.Animations{
	import flash.display.MovieClip;
	import com.truepixel.FXCore;
	
	public class Animation extends MovieClip{
		
		public var animationName:String = "StripAnimation";
		public var urlPath:String = "";
		
		protected var mcWidth:Number;
		protected var mcHeight:Number;
		protected var mcX:Number;
		protected var mcY:Number;
			
		protected var maskHolder:MovieClip = new MovieClip();
		protected var mcToAnim:MovieClip = new MovieClip();

		protected var _core:FXCore;
		
		public function Animation(mc:MovieClip, sName:String, parentClass:FXCore) {
			_core = parentClass;
			animationName = sName;
			mcWidth = mc.width;
			mcHeight = mc.height;
			mcX = mc.x;
			mcY = mc.y;
			mcToAnim = mc;
			
			mcToAnim.addChild(maskHolder);
			mcToAnim.mask = maskHolder;
			
			maskHolder.cacheAsBitmap = true;
		}
		
		public function addUrl(passedUrl:String):void{
			urlPath = passedUrl;
		}
		
	}
}
		