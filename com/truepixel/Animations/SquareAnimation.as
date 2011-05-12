//
// Author: Dariusz Rusin // truepixel.pl
//

package com.truepixel.Animations{
	import flash.display.MovieClip;
	import flash.display.Shape;
	import fl.transitions.Tween;
	import flash.utils.Timer;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import fl.transitions.easing.Strong;
	import com.truepixel.Events.AnimationEvent;
	import com.truepixel.FXCore;
	import fl.transitions.easing.None;
	
	public class SquareAnimation extends Animation{
		private var strips:Number = 8;
		private var stripsArray1:Array = new Array();
		private var stripsArray2:Array = new Array();
		private var stripsArray3:Array = new Array();
		private var stripsArray4:Array = new Array();
		private var currentShape1:Number = 0;
		private var currentShape2:Number = 0;
		private var currentShape3:Number = 0;
		private var currentShape4:Number = 0;
		
		private var timer1:Timer;
		private var timer2:Timer;
		private var timer3:Timer;
		private var timer4:Timer;
		
		private var myTweenY:Tween;
		private var stripPos:Number;
		private var totalRects:int;

		
		public function SquareAnimation(mc:MovieClip, sName:String, parentClass:FXCore) {
			super(mc, sName, parentClass)
			drawStrips();
		}	
		
		private function drawStrips():void{
			
			stripPos = mcWidth / strips;
			var cols:int = Math.round(mcHeight / stripPos);
			totalRects = cols * strips;
			trace(totalRects);
			
			for (var b:int = 0; b < cols; b++){
				for (var i:int = 0; i < strips; i++){
					var maskingShape:Shape = new Shape();
					maskingShape.cacheAsBitmap = true;
					
					maskHolder.addChild(maskingShape);				
					maskingShape.graphics.lineStyle();
					maskingShape.graphics.beginFill(0xf28c07,1);
					maskingShape.graphics.drawRect(0,0,1,1);
					maskingShape.graphics.endFill();
					maskingShape.x = i * stripPos;
					maskingShape.y = b * stripPos;
					maskingShape.alpha = 1;
					
					if (b == 0){
						stripsArray1.push(maskingShape);
					} else if (b == 1){
						stripsArray2.push(maskingShape);
					} else if (b == 2){
						stripsArray3.push(maskingShape);
					} else if (b == 3){
						stripsArray4.push(maskingShape);
					}
					
					
				}
				
			}
			trace(stripsArray2.length);
			  doAnimation();
		}
		
		private function doAnimation():void{
			timer4 = new Timer(220,strips);
			timer4.addEventListener(TimerEvent.TIMER, doNextTween4);
			

			doNextTween4();
		}
		

		
		private function doNextTween4(e:Event = null):void{
			if (currentShape4 == 0){
				timer4.start();
			}
			if (currentShape4 !== strips){
				var shapeToAnim:Shape = stripsArray4[currentShape4];
				var myTweenX:Tween = new Tween(shapeToAnim, "scaleX", None.easeNone, 45, stripPos + 6, 0.3, true);
				var myTweenY:Tween = new Tween(shapeToAnim, "scaleY", None.easeNone, -40, stripPos + 6, 0.3, true);
				currentShape4 = currentShape4 + 1;
				trace(currentShape4);
			} else {
				// Help Garbage Collector To Clean Unused Objects
				timer1 = null;
				timer2 = null;
				stripsArray1 = null;
				stripsArray2 = null;

				_core.callEndEvent(animationName);
				_core.killProcess(this);
				_core = null;
			}
		}

	}
	
}
