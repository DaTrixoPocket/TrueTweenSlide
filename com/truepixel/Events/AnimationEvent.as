package com.truepixel.Events {
	import flash.events.Event;
	
	public class AnimationEvent extends Event{
		public static const START:String = "onStart";
		public static const END:String = "onEnd";  
		
		public var animationName:String = "";
		
		public function AnimationEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false):void {
				super(type, bubbles, cancelable);
		}
	}
}
