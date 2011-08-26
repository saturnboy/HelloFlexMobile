package comps {
	import flash.geom.Point;
	
	import mx.core.UIComponent;
	
	public class AreaGraph extends UIComponent {
		private var _data:Array = [];
		private var _xMin:Number = 0;
		private var _xMax:Number = 1;
		private var _yMin:Number = 0;
		private var _yMax:Number = 0;

		public var backgroundColor:uint = 0x000000;
		public var areaColor:uint = 0xffffff;
		
		public function AreaGraph() {
			super();
		}
		
		override protected function updateDisplayList(w:Number, h:Number):void {
			super.updateDisplayList(w,h);
			
			this.graphics.clear();
			
			//bg
			this.graphics.beginFill(backgroundColor);
			this.graphics.drawRect(0, 0, w, h);
			this.graphics.endFill();
			
			//graph
			if (_data.length > 0) {
				var a:Array = normalizeData();
				a.unshift(new Point(0,(a[0] as Point).y));
				a.push(new Point((a[a.length-1] as Point).x,0));
				
				//draw area
				this.graphics.beginFill(areaColor);
				this.graphics.moveTo(0,h);
				
				for each (var p:Point in a) {
					var px:Number = p.x * w;
					var py:Number = (1 - p.y) * h;
					
					this.graphics.lineTo(px, py);
				}
				
				this.graphics.lineTo(w,h);
				this.graphics.lineTo(0,h);
				
				this.graphics.endFill();
			}
		}
		
		private function normalizeData():Array {
			var a:Array = [];
			var deltaX:Number = _xMax - _xMin;
			var deltaY:Number = _yMax - _yMin;
			
			if (deltaX <= 0.01) { deltaX = 0.01; }
			if (deltaY <= 0.01) { deltaY = 0.01; }
			
			for each (var p:Point in _data) {
				a.push(new Point(p.x / deltaX - _xMin, p.y / deltaY - _yMin));
			}
			
			return a;
		}
		
		public function reset():void {
			_data = [];
			invalidateDisplayList();
		}
		
		public function addPoint(value:Point):void {
			_data.push(value);
			if (value.x < _xMin) { _xMin = value.x; }
			if (value.x > _xMax) { _xMax = value.x; }
			if (value.y < _yMin) { _yMin = value.y; }
			if (value.y > _yMax) { _yMax = value.y; }
			invalidateDisplayList();
		}
		
		public function get numPoints():Number {
			return _data.length;
		}
		
		public function set xMax(value:Number):void {
			if (value != _xMax) {
				_xMax = value;
				invalidateDisplayList();
			}
		}
	}
}