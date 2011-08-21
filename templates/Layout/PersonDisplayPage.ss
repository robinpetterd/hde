<% require javascript(hde/javascript/SpryTabbedPanels.js) %>
<% require css(themes/blackloyalist/css/SpryTabbedPanels.css) %>
 
<div id="Person">
<% control Person %>
            <h2>$Name </h2> 
                <% if CustomImage %>
                        <% control CustomImage %>
                                <% control ResizedImage(100,100) %>
                                         <img src="$URL" alt="Icon of the Person"/>
                                <% end_control %>
                          <% end_control %>
    	                <% end_if %>

                  <% if DateofBirth %>
                     <div id="Entry">
                        <span id="Field DateofBirth">Date of Birth</span> 
                        <span id ="Record  DateOfBirth"> $DateOfBirth</span>
                     </div>     
   			      <% end_if %>
   
                     <div id="Entry Remarks"><span id ="Record  Remark">$Remarks</span>
				</div>     
                  
                  
                      <% if Relationships %>
                         <div id="Relationships">
                          <h5>$Name Relationships</h5>
                          <ul>
                                  <% control Relationships %>
                                      <li> 
                                           <% if Assumed %>
                                             <span class="assumed">
                                            <% end_if %>
                                                 <strong>$Type.Name:</strong>
												
												<a href="person/display/$getRelative.ID">$getRelative.Name</a>,  
												<% if Assumed %>
                                             		Assumed [<% end_if %>

												  <% control AssumedType %><% if Middle %>, $Name<% else %> $Name<% end_if %><% end_control %>                                      
                                                   <% if Assumed %>
                                                        ]</span><% end_if %> , Source: $Source.Name

                                                  <% if CurrentMember %><strong>ID = $ID</strong><% end_if %>

                                                 
                                               
                                  </li>
							  <% end_control %>

                    
                          <ul>
                         </div>
                       <% end_if %>
   
 				<% if myGroups %>
                   
                    <div id="Groups">
						  <h5>Groups $Name was part of</h5>
                          
                          <ul>
                           <% control MyGroups %>
                              <li> 
                               <a href="group/display/$ID"> $Name</a> 
                                 <% if Day %>$Day<% end_if %> 
  				  				 <% if Month %>$year<% end_if %>
  				  				 <% if Year %>$Year<% end_if %>
                                 
                                 
                         	 </li>
              			   x
                            <% end_control %>
           
              		</div>
                   <% end_if %>
                 
           
        
 <% if InformationPage %>
                  <div class="InformationPage">
                  <br />      
                   <h4>Related Background Information</h4>
                         <ul>
                             <% control InformationPage %>
                                <li> 
                                
                                   <% if Icon %>

                                     <a href="$URLSegment">
                                      
                                        <% control Icon %>
                                               <% control SetWidth(40) %>
                                                <img class="informationicon" src="$URL" alt="$Title" /> 
                                                <% end_control %>
                                         <% end_control %>
                                         
                                         </a>
                                     
                                    <% else_if Image  %>
                                    
                                     <a href="$URLSegment">
                                      
                                        <% control Image %>
                                               <% control SetWidth(40) %>
                                                <img class="informationicon" src="$URL" alt="$Title" /> 
                                                <% end_control %>
                                         <% end_control %>
                                         
                                         </a>
                                     
                                    <% end_if %>
										
                                        <a href="$URLSegment">$Title</a> - $Summary

                                
                                </li>
                             <% end_control %>
                         <ul>
                         </div>
             <% end_if %>   <% end_control %>

 


        
   <!-- Now we start to look in the other date for information --->
   
      <!-- It's time for the viz's --->
    
 

<script type="text/javascript"> var myData = 

		<% include  PersonJson %>

</script> 

  
    
  <div id="TabbedPanels1" class="TabbedPanels">
              <ul class="TabbedPanelsTabGroup">
                
                              
                 <li class="TabbedPanelsTab" tabindex="0">Network Visualisation</li>
                <li class="TabbedPanelsTab" tabindex="0">Timeline</li>

              </ul>
          <div class="TabbedPanelsContentGroup">

 
            <div class="TabbedPanelsContent">
            
           		<% include  PersonNetworkVis %>
            
            </div>
			
            <div class="TabbedPanelsContent">

                Timeline

                    <% include  PersonTimeline %>
                       <script type="text/javascript">
                            window.database = Exhibit.Database.create();
                            window.database.loadData(myData);
                            window.exhibit = Exhibit.create();
                            window.exhibit.configureFromDOM();


                    </script>

</div>
          </div>
		</div>
        

  <script type="text/javascript">
var TabbedPanels1 = new Spry.Widget.TabbedPanels("TabbedPanels1");
</script>








<% control EventData %>
	
    <div class="EventData  $ID" id="$ClassName">
   
          <% control Event %>
                <% if Name == Born  %> 
              		<div class="Date">
                      <h4> 
                       <span class="Year">$Top.Person.Born</span>
                       </h4>
                 </div>
                 
                  <% else_if Name == Ran  %> 
              		<div class="Date">
                      <h4>
                    
                      <span class="Year"> $Top.Person.Ran</span>
                       </h4>
                 </div>
                 
                  <% else  %>
            		    		<% include Date %>

                    <% end_if %>
                    
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
         
         
     <div class="EventInformation">
       <div class="EventTitle">
       <h3>$Event.Name 
       <% control Event %>
            	  
                   <% if Name != Born %>
                   	<% if  Name != Ran %>   
                       <% control Location %>
                         <% if Name != Unknown %> - <a href="location/display/$ID">$Name</a> <% end_if %>    
                      <% end_control %>
                     <% end_if %>
                 <% end_if %> 
                 
             <% if Name == Ran %>
				<!--This is where the bit about who the person ran from will go -->	         <% end_if %> 
                 
                 
   
       <% end_control %>                     
		</h3>       </div>
       
       
       <span class="Source"> 
         
        
         
         <span class="SourceInformation">
         
       <p class="information"> $Event.Information</p>
         
           <% if Event.InformationPage %>
         
           <ul>
             <% control Event.InformationPage %>
             <li>
             
               <% if Icon %>
             <a href="$Link">
              
                <% control Icon %>
                       <% control SetWidth(35) %>
                        <img class="information" src="$URL" alt="$Title" /> 
                        <% end_control %>
                 <% end_control %>
                 
                 </a>
             
            <% else_if Image  %>
            
             <a href="$Link">
              
                <% control Image %>
                       <% control SetWidth(35) %>
                        <img class="information" src="$URL" alt="$Title" /> 
                        <% end_control %>
                 <% end_control %>
                 
                 </a>
             
            <% end_if %>


             
             <span class="summary"><a href="$URLSegment">$Title</a> - $Summary</span>

             
               
             </li>
             <% end_control %>
             </ul>
         
         
           <% end_if %>                          
           
         
           
           
           <% control Event.Source %>
           <% if ID %>
           Source for this event: 
                          <a href="sourceimagesdisplaypage/display/$ID">$Name</a>
           <% else %>
           $Name
           
           <% end_if %>
           <% end_control %>
         </span>
         
        </span>
          <span class="EventDataTable">
                                         
                          
                    <% if ClassName == CustomEvent %>
                  	 <% include CustomEvent %>
                   <% end_if %>
                   
                   
                   
                   
                   
       
     </span>
     </div>
   </div>
   <% end_control %>
</div>

 <script class="example" type="text/javascript">
// Create the tooltips only on document load
$(document).ready(function() 
{
   // Match all link elements with href attributes within the content div
   $('.assummed a' ).qtip(
   {
      content: {
		  text: 
		  '<p> <% control Page(how-assumptions-are-made) %>$Content<% end_control %>'

		  
		  } // 
   });
});
</script>
