<table >
      <tr>
        <th scope="col" class="Column  Start" >Name</th>
        <th scope="col" class="SmallColumn">Age</th>
        <th scope="col" class="MediumColumn">Occupation</th>
        <th scope="col"class="Column">Families they lived with</th>
        <th scope="col" class="LongColumn">Companies they belong to</th>
        <th scope="col">Remarks</th>
         <th scope="col" class="Column" >Company They Are Now With</th>

      </tr>
      <tr>
        <td  class="Start">$FirstName $LastName</td>
       <td>   <% if Age !=  0 %>$CorrectedAge <% end_if %></td>
       <td>$Occupation</td>
       <td>
       	    <% if Owner %>
           		  <% control  Owner %>
                   <a href="person/display/$ID">$Name</a>
                <% end_control %>
			  <% end_if %>


       </td>
       <td>
           	    <% if  CompaniesTheyBelongTo %>
           		  <% control CompaniesTheyBelongTo %>
                 <a href="group/display/$ID">$Name</a> 
                <% end_control %>
			  <% end_if %>
       </td>
       <td>$Remarks</td>
       <td><a href="group/display/$CompanyTheyAreNowWith.ID">$CompanyTheyAreNowWith.Name</a></td>
      </tr>
      </table>

   <% if Narrative %>
	<div id="Narrative">  Remarks:[$Narrative]</div>
 <% end_if %>
 
  <!--Now for to show who we think this person is traveling with  -->
    
     <% if travelingWith || Traveling  %>
   <span class="assumed">
    <h5>Listed With</h5>
                <ul>
                    <% control  TravelingWith %>
                      <li><a href="person/display/$ID">$Name</a>$URLSegment</li>
                    <% end_control %>
                    
                    <% control Traveling %>
                            <% control KnownAs %>
                     			 <li><a href="person/display/$ID">$Name</a>$URLSegment</li>
   		                  <% end_control %>
                    <% end_control %>
                </ul>
                
            </span>
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
                                      [Assumed
                                      
												  <% control AssumedType %>$Name <% end_control %>                                      
                                      ] 
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
                                      [Assumed
												  <% control AssumedType %>$Name <% end_control %>    
												  
												  ]                                   
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