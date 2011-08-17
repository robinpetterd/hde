<?xml version="1.0" encoding="UTF-8"?>
<kml xmlns="http://earth.google.com/kml/2.1">
<Document>
     <name></name>
	<Style id="Icon">
          <IconStyle>
             <scale>.75</scale>
             <Icon>
                <href></href>
             </Icon>
          </IconStyle>
       </Style>
	   <% control People %>
	      <% control Locations %>
              <Placemark>
                 <name></name>
                 <styleUrl></styleUrl>
                <description>
                        <![CDATA[     
                                <a href="location/display/$ID" onclick='return false;' >$Name</a> 
                        ]]>
                </description>
                <Point>
                  <coordinates>$Longitude,$Latitude</coordinates>
                </Point>
              </Placemark>
            <% end_control %>
        <% end_control %>
        
	      <% control Location %>
              <Placemark>
                 <name>$Name</name>
                 <styleUrl>#diveIcon</styleUrl>
                <description>
                        <![CDATA[    
                                <a href="location/display/$ID" onclick='return false;' >$Name</a> 
                        ]]>
                </description>
                <Point>
                  <coordinates>$Longitude,$Latitude</coordinates>
                </Point>
              </Placemark>
            <% end_control %>
        
        
</Document>
</kml>



    
              
                
                
             



