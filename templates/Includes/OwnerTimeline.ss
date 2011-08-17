	    <div ex:role="coder" ex:coderClass="Icon" id="service-icons" style="display:none;">
                  <span ex:icon="/themes/blackloyalist/images/eventIcon.png">Event</span>
        </div> 
              
           <span ex:role="viewPanel">
           
           
              <div ex:role="view"
                   ex:viewClass="Timeline"
                   ex:start=".year"
                   ex:showHeader="false"
                   ex:showFooter="false"
                   ex:timelineHeight="220"
                   
                   ex:topBandUnit="year"
                   ex:topBandPixelsPerUnit="40"

				   ex:bottomBandUnit="decade"
                   ex:bottomBandPixelsPerUnit ="100"
                   
                   ex:bubbleWidth="600"
    			   ex:bubbleHeight="300"
                  
                   ex:iconCoder="service-icons" 
                   ex:iconKey=".type"
                                         
                                         
                 >
               </div>
               
                   
                <div ex:role="lens" ex:itemTypes="Event" style="display:none;"> 
                   
                  <div class="EventTitle">  <h4 style=color:#8a0c0c;padding-top:10px;"><span ex:content=".year" class="year" ></span> - 
                   <span  ex:content=".label" class="label"></span>
                   
                  </h4></div>
                   
                   <p><span ex:content=".information" style="font-size:.85em;"></span></p>

                   <span ex:content=".Source" style="font-size:.75em;"></span>



               </div>
                                
               
            </span>
 

