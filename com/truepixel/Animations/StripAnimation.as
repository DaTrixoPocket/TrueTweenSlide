﻿//
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
	import flash.sampler.NewObjectSample;
	import com.truepixel.Events.AnimationEvent;
	import com.truepixel.FXCore;
	
	public class StripAnimation extends Animation{
		private var strips:Number;
		private var stripsArray:Array = new Array();
		private var stripsArray2:Array = new Array();
		private var currentShape:Number = 0;
		private var currentShape2:Number = 0;

		private var timerOne:Timer;
		private var timerTwo:Timer;
		
		private var myTweenY:Tween;
		
		public function StripAnimation(mc:MovieClip, parts:int, sName:String, parentClass:FXCore) {
			super(mc, sName, parentClass);
			strips = parts;	
			drawStrips();
		}
		
		private function drawStrips():void{
			var stripPos:Number;
			stripPos = mcWidth / strips;
			
			for (var i:int = 0; i < strips; i++){
				var maskingShape:Shape = new Shape();
				maskingShape.cacheAsBitmap = true;
				
				maskHolder.addChild(maskingShape);				
				maskingShape.graphics.lineStyle();
				maskingShape.graphics.beginFill(0xf28c07,1);
				maskingShape.graphics.drawRect(0,0,stripPos,mcHeight);
				maskingShape.graphics.endFill();
				maskingShape.x = i * stripPos;
				maskingShape.y = -mcHeight;
				maskingShape.alpha = 0.5;
				
				stripsArray.push(maskingShape);
			}
			
			for (var q:int = 0; q < strips; q++){
				var maskingShape2:Shape = new Shape();
				maskingShape2.cacheAsBitmap = true;
				
				maskHolder.addChild(maskingShape2);				
				maskingShape2.graphics.lineStyle();
				maskingShape2.graphics.beginFill(0xf28c07,1);
				maskingShape2.graphics.drawRect(0,0,stripPos,mcHeight);
				maskingShape2.graphics.endFill();
				maskingShape2.x = q * stripPos;
				maskingShape2.y = -mcHeight;
				maskingShape2.alpha = 1;
				
				stripsArray2.push(maskingShape2);
			}
			
			doAnimation();
		}
		
		private function doAnimation():void{
			timerOne = new Timer(140,strips);
			timerOne.addEventListener(TimerEvent.TIMER, doNextTween);

			timerTwo = new Timer(220,strips);
			timerTwo.addEventListener(TimerEvent.TIMER, doNextTween2);
			
			doNextTween();
			doNextTween2();
		}
		
		private function doNextTween(e:Event = null):void{
			if (currentShape == 0){
				timerOne.start();
			}
			if (currentShape !== strips){
				var shapeToAnim:Shape = stripsArray[currentShape];
				var myTweenX:Tween = new Tween(shapeToAnim, "y", Strong.easeOut, -mcHeight, 0, 1, true);
				currentShape = currentShape + 1;
			} 
		}
		
		private function doNextTween2(e:Event = null):void{
			if (currentShape2 == 0){
				timerTwo.start();
			}
			if (currentShape2 !== strips){
				var shapeToAnim:Shape = stripsArray2[currentShape2];
				var myTweenX:Tween = new Tween(shapeToAnim, "y", Strong.easeOut, -mcHeight, 0, 1, true);
				currentShape2 = currentShape2 + 1;
			} else {
				// Help Garbage Collector To Clean Unused Objects
				timerOne = null;
				timerTwo = null;
				maskHolder = null;
				mcToAnim = null;
				stripsArray = null;
				stripsArray2 = null;
				myTweenY = null;
				_core.callEndEvent(animationName);
				_core.killProcess(this);
				_core = null;
			}
		}

	}
	
}
