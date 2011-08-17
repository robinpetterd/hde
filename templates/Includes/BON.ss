		

       
       <table class="BONdataTable" >
  <tr>
    <th scope="col" class="Column Start">Vessel Names and their Commanders</th>
    <th scope="col" class="Column">Where Bound</th>
    <th scope="col" class="Column">Names</th>
    <th scope="col" class="SmallColumn">Age</th>
    <th scope="col" class="Column">Description</th>
    <th scope="col" class="Column">Names of the Person in whose Possession they now are</th>
    <th scope="col">Remarks</th>
    
  
  </tr>
  
  <tr>
    <td class="Start">$TravelingOn.Name <br/>
     <% if TravelingOn.Captain %>Master: $TravelingOn.Captain<% end_if %></td>
   	<td>
       <% control TravelingOn %>
    			<a href="location/display/$Location.ID">$Location.Name</a>
       <% end_control %>

    </td>
    
    <td>$FirstName $LastName </td>
  	<td>$CorrectedAge  </td>
    <td>$Description</td>
  	<td>
                <% control Sponsor %>
                 	  <a href="person/display/$ID">$Name</a>
               <% end_control %>
    
    </td>
    <td>
               <% control Owner %>
                   Formerly Slave to 
                   <a href="person/display/$ID">$Name</a>, <a href="location/display/$Location.ID">$Location.Name</a>.
               <% end_control %>

             <% if  TimeLeft %>
         			Left $TimeLeft years ago. 
                 <% end_if %>
                 
                 <% if  Service %>
        			 <a href="group/display/$Service.ID">$Service.Name.</a> 

                 <% end_if %>

         <% if CertificateOfFreedom %>
       		 Certificate from General Birch.
         <% end_if %>

             <% if CertificateOfFreedomMusgrave %>
       		 Certificate from General Musgrave.
         <% end_if %>
         
         
        <% if BornFree %>
			Born free in $BornLocation.Name.
         <% end_if %>

        $Remarks
    
    
    </td>
  
  </tr>
</table>
 
    

 <% if Narrative %>
	<div id="Narrative">  Remarks:[$Narrative]</div>
 <% end_if %>

 <% if AssumedRanDate %>
	<div id="AssumedRanDate" class="assumed"> [We think $FirstName $LastName actual ran in: $AssumedRanDate]</div>
 <% end_if %>
 
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


 <% if travelingWith || Traveling  %>
   <span class="assumed">
         <h5>Assumed to be traveling in the Book of Negroes with:</h5>
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
     
     
     
     
     
    
       