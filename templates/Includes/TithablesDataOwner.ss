 
 
 
       <table >
  <tr>
    <th scope="col" class="Column Start">Name</th>
    <th scope="col" class="DoubleColumn">Owner</th>
    <th scope="col"><span class="assumed"><% if Narrative %>[Narrative]<% end_if %></span></th>
    
  
  </tr>
      <% control Slaves %>
            
              <tr>
            
                <td class="Start"><a href="person/display/$KnownAs.ID">$FirstName  $LastName</a></td>
                <td>  <% control Owner %>
                                   $Name - <a href="location/display/$Location.ID">$Location.Name</a>
                           <% end_control %></td>
                <td><span class="assumed"> <% if Narrative %>[$Narrative]</span><% end_if %></td>
                
              
              </tr>
              
  	<% end_control %> 
</table>
 
     
     <!-- Now for the relationships we have found at this stage--> 
  

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
            
                                    <a href="person/display/$Relative.ID">$Relative.Name</a>
                                      <% if CurrentMember %><strong>RELATIONSHIP ID = $ID</strong><% end_if %>

                                   <% if Assumed %>
                                      [Assumed] 
                                      
                                        <% control AssumedType %><% if Middle %>, $Name<% else %>, $Name<% end_if %><% end_control %>



                                      
                                      </span>
                                <% end_if %>
                  </li>
                  
             <% end_control %>
    
          <!--Start of the other side of the relationship -->         
           <% control Rel %>
              <li>
              <% if Assumed %>
                             <span class="assumed">
                            <% end_if %>

  				     <!--Type  -->         
                                 <strong>
                                     <% if Type.Name %>
                                   		 Parent
                                     <% else %>
                                     	$Type.Name:
                                      <% end_if %>

                                 </strong>
                                 
                                 
            					  <% control EventData %>
                                 
                                    <a href="person/display/$KnownAs.ID"> $KnownAs.Name</a>  
                                   <% if Assumed %>
                                      [Assumed] 
                                   <% control AssumedType %><% if Middle %>, $Name<% else %>, $Name<% end_if %><% end_control %>

					

                                      
                                      </span>
                                <% end_if %>
                             <% end_control %>

                                
				<% end_control %>
                               
			
      <ul>
     </div>
  
      <% end_if %>
 
 
       