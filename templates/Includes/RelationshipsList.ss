 <% if Relationships || Rel %>
     <div id="Relationships"> 
      <h5>$FirstName $LastName's Relationships</h5>
      <ul>
              <% control Relationships %>
                      <li> 
                            <% if Assumed %>
                             <span class="assumed">
                            <% end_if %>
    
                                 <strong>$Type.Name:</strong>
            
                                    <a href="person/display/$Relative.ID">$Relative.Name</a> $ID 
                                   <% if Assumed %>
                                      [Assumed] 
                                      
                                   <% control AssumedType %>
												 <% if Middle %>
                                              			  , $Name
                                                	<% else %>
                                                    	 $Name                      
                                                   <% end_if %>
							        <% end_control %>


                                      
                                      </span>
                                <% end_if %>
                  </li>
                  
             <% end_control %>
    
    