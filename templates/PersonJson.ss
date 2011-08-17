{
    "items" : [
    
    	<% control EventData %>
        {   type :          "Event",
            label :         "$Event.Name",
			 <% control Event %>
                <% if Name == Born %> 
                	  year : "$Top.Person.Born", 
                     <% else_if  Name == Ran %>
           				 year : "$Top.Person.Ran",
                     <% else  %>
           				 year : "$Year",
                    <% end_if %>
	  	  <% end_control %>                     

                    
                    
            day:			"$Event.Day",
            month:			"$Event.Month",
            information:	"$Event.Information",
			SourceFileId:	"$SourceFileID",
            <% control Event %>
       		       <% control Location %>
     		Location:		"$Name",
            LatLng:        "$Latitude,$Longitude",
                  <% end_control %>
     		  <% end_control %>  
              
              
              <% if ClassName != CustomEvent %>
              
          		        <% if ClassName != EventData %>
              details:	"<p class='EventDataTable'><table> <tr><th>Name</th><th >Owner</th> <th><% if Narrative %>[Narrative]<% end_if %></span></th></tr> <tr> <td class='Start'>$FirstName  $LastName</td><td>  <% control Owner %>  <a href='person/display/$ID\'>$Name</a> - $Location.Name <% end_control %></td>  <td><span class='assumed'> <% if Narrative %>[$Narrative]</span><% end_if %></td> </tr></table></p>",
         			    <% end_if %>

              <% end_if %>
           
           
           Source: 
            <% control Event.Source %>
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

    
    ]
}


     


