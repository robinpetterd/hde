  <% require javascript(hde/javascript/shiftzoom/shiftzoom.js) %>
  <% require javascript(hde/javascript/jcarousel/lib/jquery1.2.3.pack.js) %>


 <!--$SourceImage-->
    
 
 
      <div id="pan">   
          
          
          <img onLoad="shiftzoom.add(this,{zoom:5});" id="zoomimage" class="shiftzoom" src="$SourceImage"
                 alt="$SourceImage" width="90%" height="90%" class="preserve" />
      </div>
      
      
<script>
$(document).ready(function () {

    //$('#zoomimage').width() = $('#pan').width();
    //$('#zoomimage').height() = $('#pan').height();

    //$('#zoomimage').height() = $('#pan').height();

  
 
});

</script>


        



