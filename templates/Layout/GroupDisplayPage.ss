<% require javascript(hde/javascript/SpryTabbedPanels.js) %>
<% require css(themes/blackloyalist/css/SpryTabbedPanels.css) %>
<div id="Event">
<% control Group %>
            <h2>$Name </h2> 
            
     
                  <% if Year %>

    					<% include Date %>
                 <% end_if %>
 


                <div id="Event">  
                      <div class="about">
                          <% if Information %>
                           $Information
                          <% end_if %>	    
                          <% if Location %>
                                 <div id="Locaton"> Location: <a href="location/display/$Location.ID">$Location.Name</a></div> 
                          <% end_if %>	    
              </div>
              
     
       <% control Source %>
           <% if ID %>
           Source: 
                          <a href="sourceimagesdisplaypage/display/$ID">$Name</a>
           <% else %>
           $Name
           
           <% end_if %>
           <% end_control %>
           
           
           
           
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
    <h3 class="PeopleListHeading">List of $Name</h3>
    <div id="PeopleList">
            <ul>
            <% control People %>
              <li>
              <a href="person/display/$ID">$Name</a> 


                 <span class="" >
                 <% if Age %> $Age <% end_if %>
                  <% control BON %>
                        <% if Description %>, $Description<% end_if %>  
        
                  <% end_control %>
                                  <% if CurrentMember %><strong>PERSON ID = $ID</strong><% end_if %>
        
                  </span>
          
              </li>
            <% end_control %>
  
<% end_control %>


<% control GroupEvent %>
              <li>
              <a href="person/display/$KnownAS.ID">$KnownAs.Name</a> 
                 <span class="" >
                  </span>
          
              </li>
  <% end_control %>
            
     </ul>
    
    </div>

</div>