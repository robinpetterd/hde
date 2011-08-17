  <% require javascript(hde/javascript/shiftzoom/shiftzoom.js) %>

  <% require javascript(hde/javascript/jcarousel/lib/jquery1.2.3.pack.js) %>
  
  <% require javascript(hde/javascript/jcarousel/lib/jquery.jcarousel.pack.js) %>

  <% require css(hde/javascript/jcarousel/lib/jquery.jcarousel.css) %>
  <% require css(hde/javascript/jcarousel/skins/bon/skin.css) %>

<% control Source %>


       <% if mySourceImages %>
       <% if ClassName == SourceImages %>

         <ul id="mycarousel" class="jcarousel-skin-tango">
        
                            <% control mySourceImages %>
                                
                            <li><a href="source-image-display/display/$ID">
                             <% control Image %>
                              <% control SetWidth(75)  %>
                               <img src="$URL" alt="Thumbnail of $Name" width="$Width" height="$Height" />
                              <% end_control %>
                             <% end_control %>
                            </a></li>
                           
                              <% end_control %>
         </ul>
                
                     
         <script type="text/javascript">
        
                jQuery(document).ready(function() {
                    jQuery('#mycarousel').jcarousel({
                                                    
                    visible: 10
                    });
                    
                });
        
        </script>
			
        <% end_if %>
     <% end_if %>
            
                   
                   
<div id="Source">


       
         <h2 id="SourceName $Name">$Name </h2>
        
           <% if ClassName == SourceWeb %>
               Location:<a href="$URL">$URL</a> Last visited:$DateLastVisited
          <% end_if %>
                     
                     
                     
   <% if Archive %>        
        <div id="Entry">
            <span id="Field Archive">Archive:</span> 
            <span id ="Record Archive">$Archive</span>
         </div>
    <% end_if %>
        
     <% if Code %> <div id="Entry">
            <span id="Field Code"> Code:</span> 
            <span id ="Record Code ">$Code</span>
     </div>	
    <% end_if %>

      <% if Explaination %>
    
         <div id="Entry">
             <span id ="Record Explaination">$Explaination</span>
     </div>
    
    <% end_if %>
    
    
    <% if Transcript %>
         
        <div id="Entry">
             <span id ="Field Transcript">Transcript: </span>
             <span id ="Record Transcript">$Transcript</span>
      </div>
    <% end_if %>
	
	
	    <% if Transcription %>
         
        <div id="Entry">
             <h3 id ="Field Transcript">Transcription </h3>
             <div id ="Record Transcript">$Transcription</h3>
      </div>
    <% end_if %>
	
	
    
    <% if IsThereTranscripts == yes   %>
  	 	<p>Read the <a href="sourceimagesdisplaypage/transcript/$ID">transcription</a></p>
        
         

       <% end_if %>

     
</div>
    
     
        <% if AllAsZip %>
         
        <div id="Entry">
     <p id="AllAsZip"><a href="$AllAsZip.URL">Download all the images</a> (98mb ZIP)</p>

      </div>
    <% end_if %>

<% end_control %>

