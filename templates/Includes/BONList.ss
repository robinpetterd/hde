      
         <table class="BONdataTable Owner" >
  <tr>
    <th scope="col" class="Column Start">Vessel Names and their Commanders</th>
    <th scope="col" class="Column">Where Bound</th>
    <th scope="col" class="Column">Names</th>
    <th scope="col" class="SmallColumn">Age</th>
    <th scope="col" class="Column">Description</th>
    <th scope="col" class="Column">Names of the Person in whose Possession they now are</th>
    <th scope="col">Remarks</th>
     <th scope="col"  class="Column" >Source</th>
    
  
  </tr>
          <% control Data %>
                
                
                          <tr>
                            <td class="Start">$TravelingOn.Name <br/>
                             <% if TravelingOn.Captain %>Master: $TravelingOn.Captain<% end_if %></td>
                            <td>
                               <% control TravelingOn %>
                                        <a href="location/display/$Location.ID">$Location.Name</a>
                               <% end_control %>
                        
                            </td>
                            
                            <td><a href="person/display/$KnownAs.ID">$FirstName $LastName</a> </td>
                            <td>$CorrectedAge</td>
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
                          
                          <td>
                            <% if SourceFile %>
         
                     <span class="SourceIcon">
                       <a href="source-image-display/display/?file=$SourceFileID">
                         <% control SourceFile %>
                                  <% control SetWidth(50)  %>
                                       <img src="$URL" alt="Thumbnail of $Name" width="$Image.Width" height="$Image.Height" />
                          <% end_control %>
                         <% end_control %>
                         </a>
                          
                          <br />
                                      
                        <a href="source-image-display/display/?file=$SourceFileID">
                            See Original 
                        </a>
            
                       
           
           </span>
         <% end_if %>
                          </td>
                          </tr>
                  
                  
       	 <% end_control %>

</table>
 
 
 
        			     
    
       