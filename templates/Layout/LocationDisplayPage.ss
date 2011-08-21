<div id="Location">
<% control Location %>
            <h2>$Name</h2> 
 
                          <% if Information %>
                             <div class="about">
                       				  <p>  $Information</p>
                             </div>             
                          <% end_if %>	
                          
 <div id="map" style="width:100%;height:350px;" class="gmap"></div>
    <script type="text/javascript">
    //<![CDATA[

      if (GBrowserIsCompatible()) {
        
		var map = new GMap2(document.getElementById("map"));
        
		map.setUIToDefault();
		map = new GMap2(document.getElementById("map"));
		map.setCenter(new GLatLng($Latitude,$Longitude),13);
	    geoXml = new GGeoXml("$BaseHref/places/map");
				map.setMapType(G_SATELLITE_MAP);

		map.addOverlay(geoXml);
        map.setUIToDefault();
		
		  GEvent.addListener(map,"infowindowprepareopen", function(iwtabs) {
  iwtabs[0].contentElem.innerHTML = iwtabs[0].contentElem.innerHTML.replace("_blank", "_parent");
  });



			 
      }
      else {
        alert("Your browser is not compatible with the mapping tool.");
      }
	  
	 //]]>
   </script>
   
                             <% if Assummed %>
                            <span class="assumed"> <p>The location of this place has been estimated.  </p></span>
                             <% end_if %>	


              
  <% end_control %>

       <% if People %>
       <div class="clear"></div>
            
                 
                                 
       <% control People %>
         <% if LocEvents %>

                 <div class="clear"></div>

            <h4>Events</h4>
                                        <div class="clear"></div>
            <div id="EventsList">
                <ul>
                           <% control LocEvents %>
  					<% if RuleShowInLists == 0 %><li><a href="event/display/$ID">$Year - $Name</a></li> <% end_if %>
                            <% end_control %>
               
                <ul>
            </div>
            
 		 <% end_if %>
         
       <% end_control %>


                            
       <% control People %>
         <% if Ships %>
            <div id="EventsList">
            <h4>Ships</h4>
                <ul>
                           <% control Ships %>
  								<li><% if Year || 0 %>$Year  - <% end_if %>$Name - From: <a href="/location/display/$LeavesFrom.ID">$LeavesFrom.Name</a>  To <a href="/location/display/$Location.ID">$Location.Name</a> </li> 
                            <% end_control %>
               
                <ul>
            </div>
            
 		 <% end_if %>
         
       <% end_control %>
       
       
         
 	 <% end_if %>
</div> 



