//
// Author: Dariusz Rusin // truepixel.pl
//

package com.truepixel  {
	import flash.display.MovieClip;
	import flash.display.Shape;
	import com.truepixel.Events.AnimationEvent;
	import flash.events.Event;
	
	public class FXCore extends MovieClip{

		public function FXCore() {
			
		}	
		
		public function doStripAnimation(animMC:MovieClip, strips:Number):void{
			var _stripAnimation:StripAnimation = new StripAnimation(animMC, strips, this);
			trace(_stripAnimation);
		}
		
		public function doCircleAnimation(animMC:MovieClip):void{
			// var _circleAnimation = new CircleAnimation(animMC);
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
