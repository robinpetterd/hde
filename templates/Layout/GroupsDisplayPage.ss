  <% require javascript(themes/blackloyalist/javascript/css3-multi-column.js) %>
  
  $Content


    <% control Groups %>

<div class="previousandnext">
<% if Person.MoreThanOnePage %>
  <p>
  <% if Person.PrevLink %>
    <a href="$Person.PrevLink">&lt;&lt; Prev</a> | 
  <% end_if %>
 
  <% control Person.Pages %>
    <% if CurrentBool %>
      <strong>$PageNum</strong> 
    <% else %>
      <a href="$Link" title="Go to page $PageNum">$PageNum</a> 
    <% end_if %>
  <% end_control %>
 
  <% if Person.NextLink %>
    | <a href="$Person.NextLink">Next &gt;&gt;</a>
  <% end_if %>
  </p>
<% end_if %>
</div>

<% if Person.MoreThanOnePage %>
      <% if Person.PrevLink %>
                <% else %>
                    <div id="FeaturedList">
                    <h3>Featured</h3>
                        <ul class="list">
                        <% control Featured %>
                            <li>
                                    <h3> <a href="person/display/$ID">$Name</a>  </h3>          

                                    <% if CustomImage %>
                                            <% control CustomImage %>
                     									 <% control SetWidth(175)  %>
                                                             <img src="$URL" alt="Icon of $Top.Name"/>
                                                    <% end_control %>
                                              <% end_control %>
                                        <% else %>
                                
                                       <% control Visual %>
                                            <% control Image %>
                     										 <% control SetWidth(175)  %>
                                                                         <img src="$URL" alt="Icon of the $Top.Name"/>
                                                                <% end_control %>
                                              <% end_control %>
                                       <% end_control %>
                                                            <% end_if %>
                    
                    		                                     <span class="Explaination">$Remarks.FirstSentence </span>

                    		  <p><a href="person/display/$ID" class="MoreInfo">Read more about $Name</a></p>
                              
                             </li>
                        <% end_control %>
                        
                        </ul>
                    </div>
        <% end_if %>
    <% else %>
        
         
<% end_if %>



<div id="PeopleList">

    <ul>
    <% control  Groups %>
        <li  > 
        <a href="group/display/$ID">$Name</a> 

        </li>
    <% end_control %>
    
    <ul>
</div>



<div class="previousandnext">
<% if Person.MoreThanOnePage %>
  <p>
  <% if Person.PrevLink %>
    <a href="$Person.PrevLink">&lt;&lt; Prev</a> | 
  <% end_if %>
 
  <% control Person.Pages %>
    <% if CurrentBool %>
      <strong>$PageNum</strong> 
    <% else %>
      <a href="$Link" title="Go to page $PageNum">$PageNum</a> 
    <% end_if %>
  <% end_control %>
 
  <% if Person.NextLink %>
    | <a href="$Person.NextLink">Next &gt;&gt;</a>
  <% end_if %>
  </p>
<% end_if %>
</div>
    <% end_control %>
<div id="PeopleSearch">
  $PeopleSearchForm
</div>