package skins {
	import assets.btn_rounded_blue;
	import assets.btn_rounded_black;
	
	import spark.skins.mobile.ButtonSkin;
	
	public class BlackButtonSkin extends ButtonSkin {
		public function BlackButtonSkin() {
			super();
			
			upBorderSkin = btn_rounded_black;
			downBorderSkin = btn_rounded_blue;
		}
		
		override protected function drawBackground(unscaledWidth:Number, unscaledHeight:Number):void {
			//do nothing here, let the FXG skins do the work...
		}
	}
}