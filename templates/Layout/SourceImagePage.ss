  <% require javascript(hde/javascript/shiftzoom/shiftzoom.js) %>

  <% require javascript(hde/javascript/jcarousel/lib/jquery1.2.3.pack.js) %>
  
  <% require javascript(hde/javascript/jcarousel/lib/jquery.jcarousel.pack.js) %>

  <% require css(hde/javascript/jcarousel/lib/jquery.jcarousel.css) %>
  <% require css(hde/javascript/jcarousel/skins/hde/skin.css) %>



 
<% control SourceImage %>
    
   
<h2>Image from $mySource.Name </h2>

               
 <ul id="mycarousel" class="jcarousel-skin-tango">
       <% control mySource.mySourceImages %>  
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
        

    
          <div>   <img   onLoad="shiftzoom.add(this,{zoom:90});" id="zoomimage" class="shiftzoom" src="$Image.URL" alt="$mySource.Name"  width="100%" height="600px" class="preserve" /></div>



    
    
    
    


  <div id="SourceImageDownload">Download the full sized <a href=" $Image.URL">image</a></div>


<% if Keywords %>
	<div id="keywords">Keywords: $Keywords</div>
<% end_if %>


<% if Transcript %>
	<h3>Transcript</h3>
    <div id="transcript $ID">
        $Transcript
    
    </div>
<% end_if %>

<% end_control %>