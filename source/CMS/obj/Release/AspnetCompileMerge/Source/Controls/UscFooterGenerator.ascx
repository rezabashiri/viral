<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UscFooterGenerator.ascx.cs" Inherits="CMS.Controls.UscFooterGenerator" %>
<!--=============== section contacts ===============-->

	<div id="contacts" class="sections">
		<div class="content">
			<div class="quote-icon to-top"><i class="fa fa-angle-up"></i></div>
			<div class="container">
			
				<!--contact form -->
									
				<div class="contactForm clear">
					<fieldset id="contact_form">											
								
						<div class="grid-half">
							<label for="name">نام</label>
							<input type="text" name="name" id="name" />
						</div>
								
						<div class="grid-half">
							<label for="email" class="em">ایمیل</label>
							<input type="text" name="email" id="email"  class="right" />
						</div>
								
						<label for="message" class="m-top">پیغام</label>
						<textarea name="message"  id="message" ></textarea>
								
						<div class="clear"></div>
															
						<label>
							<button class="submit_btn transition" id="submit_btn">SEND</button>
						</label>
						<div id="result"></div>
						
					</fieldset>
						
				</div>
		
				<div class="contact-details">
				
	     <asp:Repeater ID="FooterRepeater" runat="server" >
              <ItemTemplate>
                  <div class="grid-2">
                  <%#  Eval( "BodyTxt")  %>
                      </div>
              </ItemTemplate>
          </asp:Repeater>
				</div>						
			 
			</div>
			
			<!--map-->
			<div class="mapbox">
				<div class="map-decor"></div>
				<div class="close-map"><img src="/Viralme/Design/images/close-white.png" alt=""><div class="triangle"></div></div>
				<div id="map_canvas"></div>
			</div>
				
			<!--footer end-->

			<div class="footer clear">
			
				 طراحی شده توسط <a href="http://moroorgaran.com" rel="طراحی و اجرای سامانه های اطلاعاتی در ایران" >مرورگران</a>
				<div class="small-separator ws"></div>
				
			</div> <!--footer end-->
			
		</div>
	</div><!--=============== section contacts end ===============-->
 
