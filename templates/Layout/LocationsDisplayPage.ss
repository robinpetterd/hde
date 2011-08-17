
  <% require javascript(themes/blackloyalist/javascript/css3-multi-column.js) %>
   <% require javascript(http://maps.google.com/maps?file=api&v=2.x&key=ABQIAAAAHwMDoJv7ztwpHkLRxQpwXhTd4Yb1hKwwc865J-MNGv4PuLdf3hTTpz1UPuxrXLma8Kx9rUatwRZ0ow %>

<h2>$Title</h2>

  $Content
<div id="map" style="width:100%;height:350px;" class="gmap"></div>
    <script type="text/javascript">
    //<![CDATA[

      if (GBrowserIsCompatible()) {
        
		var map = new GMap2(document.getElementById("map"));
        
		map.setUIToDefault();
		
		map = new GMap2(document.getElementById("map"));
		
		map.setCenter(new GLatLng(36.836767, -76.284256),8);
  	    
	    geoXml = new GGeoXml("$BaseHref/places/map");

        map.setUIToDefault();
		map.setMapType(G_SATELLITE_MAP);
		map.addOverlay(geoXml);
		
		  GEvent.addListener(map,"infowindowprepareopen", function(iwtabs) {
  iwtabs[0].contentElem.innerHTML = iwtabs[0].contentElem.innerHTML.replace("_blank", "_parent");
  });

      }
      else {
        alert("Your browser is not compatible with the mapping tool.");
      }
	  
	 //]]>
   </script>	

<div class="clear"></div>
    <% control People %>
<div id="LocationsList">

    <ul>
    <% control Locations %>
        <li> 
        <a href="location/display/$ID">$Name</a> 

			    <% control Events %>
                <% end_control %>


         <span class="" >
         
                          <% if CurrentMember %><strong>Location ID = $ID</strong><% end_if %>

          </span>
        </li>
    <% end_control %>
    
    <ul>
</div>

    <% end_control %>

