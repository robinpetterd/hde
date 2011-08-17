
    
    
 <div id="SideBar" >
    <div id="Form" class="section-source" >

    $SourceSearchForm
        </div>

    </div>
    		<div id="Content" class="Sources">
  $Content

<div class="previousandnext">

<% if Sources.MoreThanOnePage %>

  <p>
  <% if Sources.PrevLink %>
    <a href="$Sources.PrevLink">&lt;&lt; Prev</a> | 
  <% end_if %>
 
  <% control Sources.Pages %>
    <% if CurrentBool %>
      <strong>$PageNum</strong> 
    <% else %>
      <a href="$Link" title="Go to page $PageNum">$PageNum</a> 
    <% end_if %>
  <% end_control %>
 
  <% if Sources.NextLink %>
    | <a href="$Sources.NextLink">Next &gt;&gt;</a>
  <% end_if %>
  </p>
<% end_if %>
</div>



<% if Person.MoreThanOnePage %>
      <% if Person.PrevLink %>
                <% else %>

                   <div id="FeaturedList">
                        <h3 class="title">Featured Sources</h3> 
                        <ul class="thelist">
                        <% control Featured %>
                            <li class="thelist"> 
                                    
                                  <h3><a href="sourcedetail/display/$ID">$Name</a> </h3>    

                                     <% if mySourceImages %>

                                             <a href="sourcedetail/display/$ID">
                                              
                                                <% control Icon %>
                                                       <% control ResizedImage(175,175) %>
                                                        <img src="$URL" alt="Thumbnail of $Name" width="165px" height="165px" /> 
                                                        <% end_control %>
                                                 <% end_control %>
                                                 
                                                 </a>
                                             
                                            <% end_if %>
                                     <p><a href="sourcedetail/display/$ID" class="MoreInfo">More information</a></p>


                             </li>
                        <% end_control %>
                        
                        </ul>
                </div>
                
                
        <% end_if %>
    <% else %>
        
                   <div id="FeaturedList">
     			    <h3 class="title">Featured Sources</h3> 
                        <ul class="list">
                        <% control Featured %>
                             <li class="thelist"> 
                                    
                                  <h3><a href="sourcedetail/display/$ID">$Name</a> </h3>    

                                     <% if mySourceImages %>

                                             <a href="sourcedetail/display/$ID">
                                              
                                                <% control Icon %>
                                                       <% control ResizedImage(175,175) %>
                                                        <img src="$URL" alt="Thumbnail of $Name" width="165px" height="165px" /> 
                                                        <% end_control %>
                                                 <% end_control %>
                                                 
                                                 </a>
                                             
                                            <% end_if %>
                                     <span class="Explaination">$Explaination.FirstSentence </span>
                                     <p><a href="sourcedetail/display/$ID" class="MoreInfo">More information</a></p>


                             </li>
                        <% end_control %>
                        
                        </ul>
                </div>
<% end_if %>

<div id="Sources">
<div class="clear"></div>
 <h3>Sources</h3>
    <ul>
            <% control Sources %>
		
              <% if mySourceImages  || Transcription  %>
                                 <li class="SourceSummary"><% include SourceSummary %> </li>
              <% end_if %>
                    
            <% end_control %>

    </ul>    
  </div> 
   <div class="previousandnext">
<% if Sources.MoreThanOnePage %>

  <p>
  <% if Sources.PrevLink %>
    <a href="$Sources.PrevLink">&lt;&lt; Prev</a> | 
              <% end_if %>
  <% control Sources.Pages %>
    <% if CurrentBool %>
      <strong>$PageNum</strong> 
    <% else %>
      <a href="$Link" title="Go to page $PageNum">$PageNum</a> 
    <% end_if %>
  <% end_control %>
 
  <% if Sources.NextLink %>
    | <a href="$Sources.NextLink">Next &gt;&gt;</a>
  <% end_if %>
  </p>
<% end_if %>
</div>



  $Form
  $PageComments
  
</div>
