<%@ Page Title="" Language="C#" MasterPageFile="~/Viralme/Design/MasterPages/HomeMaster.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CMS.Pages.Default" %>

<%@ Register Src="~/Controls/UscBoundedImageShow.ascx" TagPrefix="uc2" TagName="UscBoundedImageShow" %>


<asp:Content ContentPlaceHolderID="BodyContent" runat="server" ID="BodyHolder">
    <!--=============== intro slide ===============-->
        <em:MessageBox ID="msg" runat="server" ></em:MessageBox>
  
	<div id="intro">
	
		<div id="topSlide">
			<div id="slides">
				<ul class="slides-container">
				
				<!-- Slide 1 -->
				<asp:ListView ID="sliderlvw" runat="server" >
                    <ItemTemplate>
                        	<li>
						<div class="rester"></div>
							<div class="container">
								<h3><%# Eval("ItemTopic") %></h3>
								<h1 class="white"><%# Eval("SummaryTxt") %></span></h1>
								<div class="patern clear"><span></span></div>
							</div>
			
						<div style="background-image: url('<%# Eval("ClientPhotPath") %>');" class="slides-big-img bg-fx"></div>
					</li>
                        
                    </ItemTemplate>
                    
				</asp:ListView>
				
	
				 
				</ul>
				
				<div class="slides-navigation">
				  <a href="#" class="prev"><i class="fa fa-long-arrow-left fa-2x"></i></a>
				  <a href="#" class="next"><i class="fa fa-long-arrow-right fa-2x"></i></a>
				</div>
				
  			</div>
			<a href="#about" class="start"><img src="images/start.png" alt="" title=""></a>
			
		</div> 
		
	</div><!--===============intro end ===============-->

    <!--=============== section about ===============-->

	<div id="about" class="sections ws">
		<div class="content">
			<div class="container">
			<h3 class="sections-head">وایرال می چیست ؟</h3>
				 
				
					<div id="owl-demo" class="owl-carousel">
	 
					 
					<asp:ListView ID="Aboutlvw" runat="server" >
                        <ItemTemplate>

                            <div class="item">
                                <%# Eval("BodyTxt") %>
                                <uc2:UscBoundedImageShow  Float="none" runat="server" CssClass="present-block animaper img-responsive" ID="UscBoundedImageShow" />

                                <div class="customNavigation">
							        <a class="btn next-slide transition lanch-sklills">بعدی</a>
						        </div>
                            </div>
                        </ItemTemplate>
					</asp:ListView>
					   
	
				</div>
			
			</div>
		</div>
	</div><!--=============== section about end ===============-->
    <!--=============== section subscribe ===============-->
    <asp:ListView ID="Downloadlvw" runat="server">
        <ItemTemplate>
	<div id="subscribe" class="sections bg-fx">
		<div class="content">
		<div class="quote-icon"><i class="fa fa-rss"></i></div>
			<div class="rester"></div>
			<div class="rester black"></div>
			<div class="container">
					
				<h3 class="sections-head"><%# Eval("ItemTopic") %></h3>
				<div class="small-separator ws"></div>
				<div class="clear"></div>
							
				<div class="subcribe">
					<span class="overlay suboverlay"></span>
			        <%# Eval("BodyTxt") %>
				</div> 										
			</div>
		</div>	
	</div>	
              </ItemTemplate>
    </asp:ListView>
            <!--=============== section subscribe end ===============-->
    <!--=============== section servises ===============-->

	<div id="servises" class="sections bg-fx">
	
		<div class="content">
		
			<div class="quote-icon"><i class="fa fa-cogs"></i></div>
			<div class="rester"></div>
			<div class="rester red"></div>
			
				<div class="container">
				
					
				    <asp:ListView ID="ServiceHeadlvw" runat="server" >
                         
                        <ItemTemplate>
                            <h3 class="sections-head white"> <%# Eval("ItemTopic") %></h3>
					<h2 class="white"> <%# Eval("SummaryTxt") %></h2>
					<div class="small-separator ws"></div>
 
                             <%# Eval("BodyTxt") %>
                             
                        </ItemTemplate>
					</asp:ListView>
					<div   id="service_boxes">
			<asp:ListView ID="SubServiceTitlelvw" runat="server">
                <ItemTemplate>
                    <%# CreateLink(Eval("ItemTopic")) %>
                </ItemTemplate>
			</asp:ListView>
			
						
					</div> 
				</div>
				
				<div class="serviseslider-holder no-nav">
					<div class="container">
						<div class="serviseslider">
						
							<ul class="slides">
							
								<!-- fist-slide -->
								<asp:ListView ID="SubServiceBodylvw" runat="server">
                                    <ItemTemplate>
                                        <li>
                                         <uc2:UscBoundedImageShow runat="server" ID="UscBoundedImageShow" />
                                     <%--   <div class="icon-holder">
										<i class="fa fa-trophy fa-2x"></i>
									</div>--%>
                                        <h3><span></span><%# Eval("ItemTopic") %><span></span></h3>
                                        <p> <%# Eval("SummaryTxt") %> </p>
                                       <p><%# Eval("BodyTxt") %></p> 
                                            </li>
                                    </ItemTemplate>
								</asp:ListView>
				 
								
								<!-- second-slide -->
								
						 
									
						</ul>
						
					</div>
		
				</div>
				
			</div>
		</div>
	</div><!--=============== section servises end ===============-->

		<!--=============== section testimontals ===============-->
	<div id="brand" class="sections bg-fx">
		<div class="content">
			<div class="quote-icon"><i class="fa fa-quote-right"></i></div>
			<div class="rester"></div>
			<div class="rester black"></div>
			<div class="container">
                <div class="clear"></div>
                <h2 class="white">وایرال می" برای تبلیغ دهنده ها"</h2>
                <div class="small-separator ws"></div>
				<div class="clear"></div>
					<div id="clientsay" class="owl-carousel">
                        <asp:ListView ID="Brandlvw" runat="server" >
                           
                            <ItemTemplate>
                                	<div class="item">
                        <div class="grid-2">
                                        <uc2:UscBoundedImageShow CssClass="img-thumbnail" Float="none" runat="server" ID="UscBoundedImageShow" />
                            </div>					    
                        <div class="grid-4  ">
                            <h2 class="white"><%# Eval("ItemTopic") %></h2>
                           <span>   <%# Eval("BodyTxt") %>	</span>
                        </div>
                      
                                        
					
						</div>
                            </ItemTemplate>
                        </asp:ListView>
					</div>
				</div>			
		</div>
	</div><!--=============== section testimontal end ===============-->
    
        <!--=============== section portfolio end ===============-->
		

    <!--=============== section portfolio ===============-->

	<div id="portfolio" class="sections ws">
	
		<div class="content">
		
			<div class="quote-icon"><i class="fa fa-suitcase"></i></div>
			<div class="container grid1">
                <asp:ListView ID="UpperGallery" runat="server">
                    <ItemTemplate>
                <h3 class="sections-head"><%# Eval("ItemTopic") %></h3>
				<h2><%# Eval("SummaryTxt") %></h2>
				<div class="small-separator"></div>	
                         <span><%# Eval("BodyTxt") %></span>
				  </ItemTemplate>
                </asp:ListView>

			</div>
				
			<!-- portfolio filters -->

			<div id="options" class="clear">
		
			  <ul id="filters" class="option-set" data-option-key="filter">
                  <li class="filter actcat" data-filter="all">همه</li>
			  <asp:ListView ID="GallaryFilterslvw" runat="server" >
                  <ItemTemplate>
                      <li class="filter" data-filter="<%# Eval("GrpID") %>"> <%# Eval("GrpName") %> </li>
                  </ItemTemplate>
			  </asp:ListView>		
			  </ul>
			</div> 
			<!-- Projects links -->
			<div class="aih">
				<ul id="folio_container" class="grid-full animaper">
				<!-- 1 project -->
                    <asp:ListView ID="Gallarylvw" runat="server" >
                        <ItemTemplate>
                            <li class="box  mix  mix_all <%# Eval("GrpID") %>">
						<a href="#">
                            <uc2:UscBoundedImageShow runat="server"  CssClass="respimg" ID="UscBoundedImageShow" />
							<div class="folio-name clear">
								<div class="folio-overlay">
									<span class="overlay red"></span>
									<h4><%# Eval("ItemTopic") %></h4>							
									 <P><%# Eval("SummaryTxt") %> </P>
                                   
								</div>
							</div>
						</a>
						
					</li>
                        </ItemTemplate>
                    </asp:ListView>
				</ul>
			</div>
			 <!-- ajax-section -->
			 <div class="clear"></div>
			<div id="ajax-section">     
				<div id="loader"></div>
				<div id="ajax-content-outer">
					<div id="ajax-content-inner"></div>
				</div>
				<div id="project-navigation">
					<ul>
						<li id="prevProject"><a href="#"></a></li>
						<li id="nextProject"><a href="#"></a></li>
					</ul>  
				</div>
				<div id="closeProject">
					<div class="grid-3">
						<a href="#/">Close</a>
					</div>               
				</div>                  
			</div>
			<!-- ajax-section end -->
					
		</div>

	</div>

    
    			<!--=============== section testimontals ===============-->
	<div id="driver" class="sections bg-fx">
		<div class="content">
			<div class="quote-icon"><i class="fa fa-suitcase"></i></div>

			<div class="rester"></div>
			<div class="rester red"></div>
			<div class="container">
				 <div class="clear"></div>
                <h2 class="white">وایرال می " برای راننده"</h2>
                <div class="small-separator ws"></div>
				<div class="clear"></div>
					<div id="client-carusel" class="owl-carousel clientsay">
                        <asp:ListView ID="Driverlvw" runat="server" >
                            <ItemTemplate>
                                	<div class="item">
                        <div class="grid-2">
                                        <uc2:UscBoundedImageShow CssClass="img-thumbnail" Float="none" runat="server" ID="UscBoundedImageShow" />
                            </div>					    
                           <div class="grid-4  ">
                            <h2 class="white"><%# Eval("ItemTopic") %></h2>
                           <span>   <%# Eval("BodyTxt") %>	</span>
                        </div>
						</div>
                            </ItemTemplate>
                        </asp:ListView>
					</div>
				</div>			
		</div>
	</div><!--=============== section testimontal end ===============-->		
	
</asp:Content>