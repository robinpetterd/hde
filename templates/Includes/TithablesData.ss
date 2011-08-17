 
 
 
       <table >
  <tr>
    <th scope="col" class="Column Start">Name</th>
    <th scope="col" class="DoubleColumn">Owner</th>
    <th scope="col"><span class="assumed"><% if Narrative %>[Narrative]<% end_if %></span></th>
    
  
  </tr>
  
  <tr>

    
    <td class="Start">
	      <% if CurrentMember %><strong>ID = $ID</strong><% end_if %>

	
	$FirstName  $LastName</td>
  	<td>  <% control Owner %>
                        <a href="person/display/$ID">$Name</a> - <a href="location/display/$Location.ID">$Location.Name</a>
               <% end_control %></td>
    <td><span class="assumed"> <% if Narrative %>[$Narrative]</span><% end_if %></td>
    
  
  </tr>
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
              <% if Assumed %>
                             <span class="assumed">
                            <% end_if %>
            					  <% control MyEvents %>
                                        <li> 
                                          <% control Type %>
                                          <strong>
                                         <% if  MyType == Child %>
                                                 Parent:  
                                             <% else %>
                                                 <% if  MyType ==  Grandchild %>
                                                    Grandparent:
                                                   <% else %>
                                                     $MyType
                                                   <% end_if %>
                                            <% end_if %>
                                         </strong>
                                     <% end_control %>
                                         
                                          <a href="person/display/$Relative.KnownAs.ID">$Relative.KnownAs.Name</a>
                                             <% if CurrentMember %><strong>GENERATED (data entry completed on the other side) </strong><% end_if %>
                                             
                                         <% if Assumed %>
                                      [Assumed] 
                                   <% control AssumedType %><% if Middle %>, $Name<% else %>, $Name<% end_if %><% end_control %>                                      
                                <% end_if %>
                                
                                
       						<% if Assumed %>
                             	< /span>
                            <% end_if %>                             
                            
                            </li>

                  <% end_control %>
                  <% end_control %>
      </ul>
                               
			
      </ul>
     </div>
  
      <% end_if %>
 
 
       