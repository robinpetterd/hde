<% require javascript(hde/javascript/SpryTabbedPanels.js) %>
<% require css(themes/blackloyalist/css/SpryTabbedPanels.css) %>
 
<div id="Event">
<% control Event %>
            <h2>$Name </h2> 
            
     
    		<% include Date %>

             

                   <div id="Event">  
                      <div class="about">
                          <% if Information %>
                           $Information
                          <% end_if %>	    
                          <% if Location %>
                                 <div id="Locaton"> Location: <a href="location/display/$Location.ID">$Location.Name</a></div> 
                          <% end_if %>	    
              </div>
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
	    
                 
          </div> 
        
                  
 <% if InformationPage %>
                  <div id="information">
                             <% control InformationPage %>
                                
                                    <% if Image  %>
                                    
                                     <a href="$URLSegment">
                                      
                                        <% control Image %>
                                               <% control SetWidth(300) %>
                                                <img class="informationicon" src="$URL" alt="$Title" /> 
                                                <% end_control %>
                                         <% end_control %>
                                         
                                         </a>
                                     
                                    <% end_if %>
										
                                         $Content

                                
                             <% end_control %>
                         </div>
             <% end_if %>   

                 
    

<% end_control %>

<% if EventData %>

    <% control EventData %>
    
       <% if EventType != None %>
                     <span class="EventDataTable">
                                
                <h3 >People in this repository that where part of this event</h3>
                
                                 
                                   
                                    <% if EventType == CustomEvent %>
                                     <% include CustomEvent %>
                                   <% end_if %>
                                   
                                 
                                   
                                   
                                   <!-- Now for the relationships that relate to bon  found at this stage--> 
                                                                      
                                 
								   
								                                  
                     </span>
             <% end_if %>
        <% end_control %> 
        
<% end_if %> 

    
</div>