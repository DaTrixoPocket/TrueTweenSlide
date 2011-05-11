//
// Author: Dariusz Rusin // truepixel.pl
//

package com.truepixel  {
	import flash.display.MovieClip;
	import flash.display.Shape;
	import com.truepixel.Events.*;
	import com.truepixel.Animations.*;
	
	public class FXCore extends MovieClip{

		public function FXCore() {
			
		}	
		
		public function doStripAnimation(animMC:MovieClip, slideName:String, strips:Number):void{
			var _stripAnimation:StripAnimation = new StripAnimation(animMC, strips, slideName, this);
			trace(_stripAnimation);
		}
		
		public function doCircleAnimation(animMC:MovieClip):void{
			// var _circleAnimation = new CircleAnimation(animMC);
		}
		
		public function callStartEvent():void{
			var startEvent:AnimationEvent = new AnimationEvent("onStart", true);
			dispatchEvent(startEvent);
		}
		
		public function callEndEvent():void{
			var endEvent:AnimationEvent = new AnimationEvent("onEnd", true);
			dispatchEvent(endEvent);
		}
		
		public function killProcess(_class:*):void{          
			_class = null;		
		}	

	}
	
}
