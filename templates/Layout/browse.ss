
HERE
<% if Menu(2) %>
		<% include SideBar %>
	<% end_if %>

    		<div id="Content">
			
	
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
</div>
	
    
