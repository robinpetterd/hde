 <div id="SideBar" >
    <div id="Form" class="section-source" >

    $SourceSearchForm
        </div>

    </div>
    		<div id="Content" >
            <h2>$Title</h2>

              $Content
        
        <span id="Sources" >
            <% control Sources %>
                       <% if Count != 0  %> 
                           <ul >
                                <% control Source %>
                                     <li class="SourceSummary" ><% include SourceSummary %> </li>
                                    <% end_control %>
                              </ul>    
                              <div class="clear"></div>
           
                                <% control Transcripts %>
                                                   <h3>Found in these transcripts</h3>
            
                                     <% include TranscriptSearchResult %> 
                                <% end_control %>
                                
                                
                    <% else %>
                        <h2> Sorry, your search for 
                        "$theSearch" did not return any results.</h2>
            
                  <% end_if %>
                  
                <% end_control %>


		</span>

  $Form
  $PageComments
</div>
