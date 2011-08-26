package comps {
	import mx.core.UIComponent;
	
	public class TimerBar extends UIComponent {
		private var _pct:Number = 0.0;

		public var backgroundColor:uint = 0x000000;
		public var barColor:uint = 0xffffff;
		
		public function TimerBar() {
			super();
		}
		
		override protected function updateDisplayList(w:Number, h:Number):void {
			super.updateDisplayList(w,h);
			
			this.graphics.clear();
			
			//bg bar
			this.graphics.beginFill(backgroundColor);
			this.graphics.drawRect(0, 0, w, h);
			this.graphics.endFill();
			
			//bar
			if (_pct > 0) {
				this.graphics.beginFill(barColor);
				this.graphics.drawRect(0, 0, w * _pct, h);
				this.graphics.endFill();
			}
		}
		
		[Bindable]
		public function get percent():Number {
			return _pct;
		}
		
		public function set percent(value:Number):void {
			if (value != _pct) {
				if (value < 0) {
					_pct = 0;
				} else if (value > 1) {
					_pct = 1;
				} else {
					_pct = value;
				}
				invalidateDisplayList();
			}
		}
	}
}
