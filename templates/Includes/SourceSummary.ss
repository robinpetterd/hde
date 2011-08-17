								  							   <% if mySourceImages %>
                                     <a href="sourcedetail/display/$ID" >
                                      
                                        <% control Icon %>
                                               <% control ResizedImage(75,75) %>
                                                <img src="$URL" alt="Thumbnail of $Name" width="75px" height="75px" /> 
                                                <% end_control %>
                                         <% end_control %>
                                         
                                         </a>
                                    <% end_if %>                                     
                                <span class="Details" >
                                    <a href="sourcedetail/display/$ID"> <h3>$Name
                                                                             
                                       <span id ="Date">
                        
                                        <% if Day %>
                                                 Day /
                                                <% end_if %>
                                                
                                                <% if Month %>
                                                 $Month  /
                                                <% end_if %>
                        
                                                 <% if Year %>
                                                  $Year
                                                <% end_if %>
                                                
                                      </span>
                                      
                                      </h3></a>
                                      
                                      <% if Explaination %>
                       
                                   In Source Summary  <span class="Explaination">$Explaination.FirstSentence <a href="sourcedetail/display/$ID">More information</a></span>
                                      
                                                   <% end_if %>
                        
                                   <% if Archive %>
                                     <div id="Entry">
                                            <span id="Field Archive">Archive:</span> 
                                            <span id ="Record Archive">$Archive</span>
                                       </div>
                                     <% end_if %>
                                     
                                     
                                   <% if Code %>
                                         <div id="Entry">
                                            <span id="Field Code"> Code: :</span> 
                                            <span id ="Record Code ">$Code</span>
                                     </div>	
                                     <% end_if %>
                             
                             </span>
                            </span>
                        
