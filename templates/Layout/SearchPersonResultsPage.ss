  <% require javascript(themes/blackloyalist/javascript/css3-multi-column.js) %>
  
  $Content

<div id="PeopleSearch">

  $PeopleSearchForm
  </div>
	<p></p>
	<h3>The search results for $theSearch</h3>


        <% control People %>
       <% if Count != 0  %>

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
                       
            <% end_if %>
        <% else %>
            
    
    <% end_if %>
    
    
    
    <div id="PeopleList">
    
        <ul>
        <% control Person %>
            <li> 
            <a href="person/display/$ID">$Name</a> 
    
    
             <span class="">
              <% control BON %>
                    <% if Age %>$Age<% end_if %><% if Description %>, $Description<% end_if %>  
    
              <% end_control %>
                              <% if CurrentMember %><strong>PERSON ID = $ID</strong><% end_if %>
    
              </span>
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

        <% else %>
			<h2> Sorry, your search for 
           	"$theSearch" did not return any results.</h2>

      <% end_if %>

        <% end_control %>
