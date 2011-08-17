

 <h2>$Title</h2>

  <% require javascript(themes/blackloyalist/javascript/css3-multi-column.js) %>
  
  $Content
	


<script type="text/javascript"> var myData = 

		<% include  EventJson %>

</script> 

<% include  EventTimeline %>
 
   <script type="text/javascript"> 
  			window.database = Exhibit.Database.create();
            window.database.loadData(myData);
            window.exhibit = Exhibit.create();
            window.exhibit.configureFromDOM();
            
	
</script> 



    <% control Events %>

<div class="previousandnext">
<% if Events.MoreThanOnePage %>
  <p>
  <% if  Events.PrevLink %>
    <a href="$Events.PrevLink">&lt;&lt; Prev</a> | 
  <% end_if %>
 
  <% control  Events.Pages %>
    <% if CurrentBool %>
      <strong>$PageNum</strong> 
    <% else %>
      <a href="$Link" title="Go to page $PageNum">$PageNum</a> 
    <% end_if %>
  <% end_control %>
 
  <% if  Events.NextLink %>
    | <a href="$Events.NextLink">Next &gt;&gt;</a>
  <% end_if %>
  </p>
<% end_if %>
</div>



<div id="EventsList">

    <ul>
    <% control  Events %>
        <li >
        <a href="event/display/$ID">$Year - $Name</a> 

        </li>
    <% end_control %>
    
    <ul>
</div>



<div class="previousandnext">
<% if Events.MoreThanOnePage %>
  <p>
  <% if  Events.PrevLink %>
    <a href="$Events.PrevLink">&lt;&lt; Prev</a> | 
  <% end_if %>
 
  <% control  Events.Pages %>
    <% if CurrentBool %>
      <strong>$PageNum</strong> 
    <% else %>
      <a href="$Link" title="Go to page $PageNum">$PageNum</a> 
    <% end_if %>
  <% end_control %>
 
  <% if  Events.NextLink %>
    | <a href="$Events.NextLink">Next &gt;&gt;</a>
  <% end_if %>
  </p>
<% end_if %>
</div>
    <% end_control %>

