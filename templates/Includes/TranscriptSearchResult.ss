 <div id="Transcript"  > 
            <div id="SourceName $Event.Name"> <a href="sourcedetail/display/$mySource.ID"> <h4>$mySource.Name</h4></a></div>
                
                 <div id="sourcePage"> 
                 
                                <a href="source-image-display/display/$ID">
                                 <% control Image %>
                              <% control SetWidth(100)  %>
                                       <img src="$URL" alt="Thumbnail of $Name" width="$Image.Width" height="$Image.Height" />
                           <% if CurrentMember %><strong>$URL</strong><% end_if %>
                                      <% end_control %>
                                 <% end_control %>
                                </a>
                                
                                
                            <a href="source-image-display/display/?file=$SourceFileID">
                            <span class="SourceInformation">See Original</span> 
                        </a>
                        
                        
                        <% if Transcript %>
                             <div id="TextFromImageTranscript"> 
                                <div id="Transcript Entry">
                                     <h3 id ="Field Transcript">Transcript: </h3>
                                     <div id="Record Transcript">$Transcript</div>
                                    </div> 
                                                        </div> 
            
                            <% end_if %>
                 </div>           
                
                
            </div>