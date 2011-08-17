package utils
{
	import utils.DefaultValues;
 
	public class ImageResizer {
		/**
		 *  Calculate your new center registration point. calcX wants x, containerWidth, and w.
		 *  Those are your image's parent container x, and width, and then your image's width.
		 *
		 * */
		public static function calcX (x:Number,containerWidth:Number,w:Number) : Number {
			// half of image's parent containers width
			var newRegX:Number = Math.round((w / 2));
			// parent container's x minus your new registration X
			var newX:Number = Math.round(x - newRegX);
			// value for the default parent container's width divided by 2
			var center:Number = Math.round(containerWidth/2);
			// return your new centered X
			return Math.round(newX += center);
		}
		public static function calcY (y:Number,containerHeight:Number,h:Number) : Number {
			var newRegY:Number = Math.round(h / 2);
			var newY:Number = Math.round(y - newRegY);
			var center:Number = Math.round(containerHeight / 2);
			return Math.round(newY += center);
		}
	}
}