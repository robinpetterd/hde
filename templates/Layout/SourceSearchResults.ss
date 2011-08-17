
    <% if Results %>
	    <ul id="SearchResults">
	      <% control Results %>
	        <li>
                <a href="source-image-display/display/$ID">
             <% control Image %>
              <% control SetWidth(60)  %>
               <img src="$URL" alt="Thumbnail of $Name" width="$Image.Width" height="$Image.Height" />
              <% end_control %>
             <% end_control %>
			</a>
           
           <h4> $mySource.Name</h4>
        
        	               <p><a href="source-image-display/display/$ID" class="MoreInfo">Browse this page</a></p>


			  <% if Transcript %>
              
                         <h5> The Transcript</h5>

	            $Transcript
			  <% end_if %>
               <p><a href="source-image-display/display/$ID" class="MoreInfo">Browse this page</a></p>
	        </li>
	      <% end_control %>
	    </ul>
	  <% else %>
	    <p>Sorry, your search query did not return any results.</p>
	  <% end_if %>




	  <% if Results.MoreThanOnePage %>
	    <div id="PageNumbers">
	      <% if Results.NotLastPage %>
	        <a class="next" href="$Results.NextLink" title="View the next page">Next</a>
	      <% end_if %>
	      <% if Results.NotFirstPage %>
	        <a class="prev" href="$Results.PrevLink" title="View the previous page">Prev</a>
	      <% end_if %>
	      <span>
	        <% control Results.SummaryPagination(5) %>
	          <% if CurrentBool %>
	            $PageNum
	          <% else %>
	            <a href="$Link" title="View page number $PageNum">$PageNum</a>
	          <% end_if %>
	        <% end_control %>
	      </span>
      
	    </div>
	 <% end_if %>
