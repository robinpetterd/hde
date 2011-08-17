package legend
{
	 import mx.core.UIComponent;
	 import mx.controls.listClasses.IListItemRenderer;

	 public class LegendItemView extends UIComponent      
					{
						public var myalpha:int;
						public var color:int;
						public var thickness:int;

						override protected function updateDisplayList(unscaledWidth:Number, unscaledHeight:Number):void
						{
							graphics.lineStyle(thickness/2, color, 1);
							graphics.beginFill(0);
							graphics.moveTo(7, 7);
							graphics.lineTo(80,7);
							graphics.endFill();
			
						}
					}
				

}