


			
	
		<h2>$Title</h2>
        
        
     $Content
     
     <ul>      
     
      <% control Children %>
   
       <li class="InformationSummary">
         
         
           <a href="$Link"> <h3>$Title
		                    
              </h3></a>
              
              
          
          <% if Icon %>
             <a href="$Link">
              
                <% control Icon %>
                       <% control SetWidth(70) %>
                        <img class="information" src="$URL" alt="$Title" /> 
                        <% end_control %>
                 <% end_control %>
                 
                 </a>
             
            <% else_if Image  %>
            
             <a href="$Link">
              
                <% control Image %>
                       <% control SetWidth(70) %>
                        <img class="information" src="$URL" alt="$Title" /> 
                        <% end_control %>
                 <% end_control %>
                 
                 </a>
             
            <% end_if %>



		<span class="Details">
              
              <% if Summary %>

            	 <span class="Explaination">$Summary<a href="$Link">More Information >></a>
</span>
              
            <% end_if %>
     
	     </span>

</li>  


                 <% end_control %>

<ul>
             
		$Form
		$PageComment
        
  
	
    
