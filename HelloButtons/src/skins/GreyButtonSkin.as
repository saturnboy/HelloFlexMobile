package skins {
	import assets.btn_rounded_blue;
	import assets.btn_rounded_grey;
	
	import spark.skins.mobile.ButtonSkin;
	
	public class GreyButtonSkin extends ButtonSkin {
		public function GreyButtonSkin() {
			super();
			
			//set text color, shadow color, and shadow alpha
			setStyle('color', 0x111111);
			setStyle('textShadowColor', 0xffffff);
			setStyle('textShadowAlpha', 0.4);
			
			upBorderSkin = btn_rounded_grey;
			downBorderSkin = btn_rounded_blue;
		}
		
		override protected function commitCurrentState():void {   
			super.commitCurrentState();
			
			//change text color and shadow color for down state vs up state
			if (currentState == 'down') {
				setStyle('color', 0xffffff);
				setStyle('textShadowColor', 0x333333);
			} else {
				setStyle('color', 0x111111);
				setStyle('textShadowColor', 0xffffff);
			}
		}
		
		override protected function drawBackground(unscaledWidth:Number, unscaledHeight:Number):void {
			//do nothing here, let the FXG skins do the work...
		}
	}
}