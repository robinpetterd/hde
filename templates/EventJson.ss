{
    "items" : [
    <% control Events %>
    	<% control Events %>
            {   type :          "Event",
                label :         "$Name",
                ID :         "$ID",

                
                year :			 "$Year",                     
                day:			"$Day",
                month:			"$Month",
                information:	"$Information <a href='event/display/$ID'>More Information</a>",
                SourceFileId:	"$SourceFileID",
                       <% control Location %>
                Location:		"$Name",
                LatLng:        "$Latitude,$Longitude",
                      <% end_control %>
               Source: 
                    <% control Source %>
                       <% if ID %>
                       "Source for this event: $Name"
                       <% else %>
                       "$Name"
                       <% end_if %>
                  <% end_control %>
               
          <% if Last %>
           } 
           <% else %>  
           },
          <% end_if %>  
          <% end_control %>

       <% end_control %>

    
    ]
}


     


