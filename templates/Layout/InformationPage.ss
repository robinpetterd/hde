	
		<h2>$Title</h2>
            
            <div id="information">
          
         

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



 


</script