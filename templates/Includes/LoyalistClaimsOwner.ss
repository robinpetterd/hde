 
 <div id="LoyalistClaims">
       <table>
  <tr>
    <th scope="col" class="DoubleColumn">Transcript</th>
     <th scope="col" class="DoubleColumn"><span class="assumed">Slaves that this may relate to.</span></th>

    <th scope="col"  class="Column"><% if SourceFile %>Source<% end_if %></th>

  
  </tr>
            
              <tr>
            
                <td class="DoubleColumn">$Transcript</td>
                      
                 <td>
                   <span class="assumed"> 
                   <% control RunAways %>
                      <p class="RunAways">  <a href="person/display/$ID">$Name</a> </p>
    
                    <% end_control %> 
                    </span>               
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
              
</table>
 
 </div>
 <% if Narrative %><div class="assumed Narrative"><strong>Remarks:</strong> [$Narrative]</div><% end_if %>    
     
       