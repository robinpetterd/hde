
 <% if Transcript %>
	<div id="Transcript">$Transcript</div>
 <% end_if %>

	 
 <% if Narrative %>
	<div id="Narrative">  Remarks:[$Narrative]</div>
 <% end_if %>


 
     <!-- Now for the relationships we have found at this stage-->   
 



<% if Groups %>
                    <div id="Groups">
						  <h5>Groups $KnownAs.Name was part of</h5>
                          
                          <ul>
                           <% control Groups %>
                              <li> 
                                $Name 
                                 <% if Day %>$Day<% end_if %> 
  				  				 <% if Month %>$year<% end_if %>
  				  				 <% if Year %>$Year<% end_if %>
                                 
                                 
                         	 </li>
              			   
                            <% end_control %>
           
              		</div>
                   <% end_if %>
                   
                   
     
     
     
     
    
       