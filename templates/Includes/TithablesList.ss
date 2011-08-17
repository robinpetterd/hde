<table >
  <tr>
    <th scope="col" class="Column Start">Name</th>
    <th scope="col" class="DoubleColumn">Owner</th>
    <th scope="col"><span class="assumed"><% if Narrative %>[Narrative]<% end_if %></span></th>
  </tr>
       <% control Data %>
            
              <tr>
            
                <td class="Start"><a href="person/display/$KnownAs.ID">$FirstName  $LastName</a></td>
                <td>  <% control Owner %>
                                   <a href="person/display/$ID">$Name</a> - <a href="/location/display/$Location.ID">$Location.Name</a>
                           <% end_control %></td>
                <td><span class="assumed"> <% if Narrative %>[$Narrative]</span><% end_if %></td>
                
              
              </tr>
              
  	<% end_control %> 
</table>
 