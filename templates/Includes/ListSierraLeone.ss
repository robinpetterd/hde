
<table >
      <tr>
        <th scope="col" class="Column  Start" >Name</th>
        <th scope="col" class="SmallColumn">Age</th>
        <th scope="col" class="MediumColumn">Where Born</th>
        <th scope="col"class="SmallColumn">Number Of Children</th>
        <th scope="col" class="SmallColumn">Age Of Eldest </th>
        <th scope="col" class="Column" >Occupation</th>
        <th scope="col" class="LongColumn" >Property</th>

      </tr>
      <tr>
        <td class="Start">$Name</td>
       <td>   $Age</td>
       <td><a href="location/display/$WhereTheyWhereBorn.ID">$WhereTheyWhereBorn.Name</a></td>
       <td> $NumberOfChildren  </td>
       <td> $AgeOfEldest  </td>
       <td> $Occupation  </td>
       <td> $Property  </td>
    
      </tr>
      </table>

   <% if Narrative %>
	<div id="Narrative">  Remarks:[$Narrative]</div>
 <% end_if %>

     
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
     </div>
  
      <% end_if %>