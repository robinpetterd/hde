
  <% require javascript(hde/javascript/jcarousel/lib/jquery1.2.3.pack.js) %>
  
  <% require javascript(hde/javascript/jcarousel/lib/jquery.jcarousel.pack.js) %>

  <% require css(hde/javascript/jcarousel/lib/jquery.jcarousel.css) %>
  <% require css(hde/javascript/jcarousel/skins/hde/skin.css) %>
  
<% control SourceImages %>
	

	 <ul id="mycarousel" class="jcarousel-skin-tango">
       <% control mySourceImages %>  
             <li><a href="source-image-display/display/$ID"  class="$LinkingMode">
             <% control Image %> 
                <% control SetWidth(75) %>
                  <img src="$URL" height="$Height" alt="Thumbnail of $Name" width="$Width" />   
                 <% end_control %> 
       			 <% end_control %> 
		
		
		
        </a> </li>  
    <% end_control %>
</ul>

	<script type="text/javascript">
	
	jQuery(document).ready(function() {
			jQuery('#mycarousel').jcarousel({
											
			visible: 10
		    });
			
		});
			
			
	</script>
			

<div id="Source">
         <h2 id="SourceName $Name">$Name</h2>
        
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
            <span id="Field Explaination"> Explaination: </span>
             <span id ="Record Explaination">$Explaination</span>
     </div>
    
    <% end_if %>
    
    
    <% if Transcript %>
         
        <div id="Entry">
             <span id ="Field Transcript">Transcript: </span>
             <span id ="Record Transcript">$Transcript</span>
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