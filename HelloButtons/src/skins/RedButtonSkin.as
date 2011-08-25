package skins {
	import assets.btn_rounded_red;
	import assets.btn_rounded_darkred;
	
	import spark.skins.mobile.ButtonSkin;
	
	public class RedButtonSkin extends ButtonSkin {
		public function RedButtonSkin() {
			super();
			
			upBorderSkin = btn_rounded_red;
			downBorderSkin = btn_rounded_darkred;
		}
		
		override protected function drawBackground(unscaledWidth:Number, unscaledHeight:Number):void {
			//do nothing here, let the FXG skins do the work...
		}
	}
}