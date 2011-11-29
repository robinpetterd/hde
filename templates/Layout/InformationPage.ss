<% require javascript(hde/javascript/jwplayer.js) %>

      <h2>$Title</h2>
            
        <div id="information">
          
         
     <% if Media %>
        <div id="player">

        </div>    
         <script type="text/javascript">
            jwplayer("player").setup({
                flashplayer: "hde/flash/mediaplayer.swf",
                 <% control Media %>
                      <% if Media %>
                         file: "$Media.URL",
                      <% else %>
                           file: "$URL",
                      <% end_if %>

                    <% if Still %>
                        image :"$Still.URL",

                     <% end_if %>

                     <% end_control %>
                controlbar: "over",
                stretching: "uniform",
                width: 720,
                height: 405,
            });
        </script>


     <% else %>
               
      <% if Image %>
              
                <% control Image %>
                       <% control SetWidth(300) %>
                        <img class="information" src="$URL" alt="$Title" /> 
                        <% end_control %>
                 <% end_control %>
                 
            <% else_if Icon  %>


             
             
              
                <% control Icon %>
                       <% control SetWidth(70) %>
                        <img class="information" src="$URL" alt="$Title" /> 
                        <% end_control %>
                 <% end_control %>
                 



            <% end_if %>


     <% end_if %>
     
     
     
     
         

             
		$Content
		$Form
		$PageComment
        
  	</div>
	
<script type="text/javascript">

var currentUrl = location.href; 
var As = document.links;
//document.write(document.links);

//document.write("test2");
for(i = 0; i < As.length; i++) { 
		var A = As[i]; 
		
		//document.write(A);
		//alert(A); 

		//document.write(A.href);
		var afterHash = A.href.split("#")[1]; 
		
		//document.write(A.href);
		
		if(afterHash) { 
			if(afterHash.length > 0) { 
				A.href = currentUrl + "#" + afterHash; 
			//	document.write(A.href);
				}
		}
		 
} 



 


</script>