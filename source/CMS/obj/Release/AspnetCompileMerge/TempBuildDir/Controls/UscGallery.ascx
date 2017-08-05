<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UscGallery.ascx.cs" Inherits="CMS.Controls.UscGallery" %>

<div id="grid" class="gallery-isotope grid-3 gutter clearfix">
<asp:ListView ID="attachView"  runat="server" >
            <LayoutTemplate>
                   <div id="itemPlaceholder" runat="server"> </div>
               </LayoutTemplate>
    <ItemTemplate>
                              <div class="gallery-item <%# new CMS.CMSLogic.GalleryHelpers().putCss(DataBinder.Eval(Container.DataItem,"VirtualAddress")) %>">
                  <div class="thumb">
                      <img id="Img1"    runat="server" src='<%# putThumbnail( DataBinder.Eval(Container.DataItem,"FileName") )%>' alt='<%# DataBinder.Eval(Container.DataItem,"FileName") %>'>
                    
                    <div class="overlay-shade"></div>
                          <div class="text-holder text-center">
                      <h5 class="title"><%#  CMS.CMSLogic.StringHeplers.RemoveExtension(  DataBinder.Eval(Container.DataItem,"FileName") ) %></h5>
                     
                    </div>
                    <div class="icons-holder">
                      <div class="icons-holder-inner">
                        <div class="styled-icons icon-sm icon-dark icon-circled icon-theme-colored">
                          <a  href="<%#  CMS.CMSLogic.TItem.GetImageClientPath(DataBinder.Eval(Container.DataItem,"VirtualAddress")) %>" download><i class="fa fa-2x fa-download"></i></a>
                          
                            <%# new CMS.CMSLogic.GalleryHelpers().PutFile(DataBinder.Eval(Container.DataItem,"VirtualAddress"),DataBinder.Eval(Container.DataItem,"FileName")) %>
                        
                        </div>
                      </div>
                    </div>
                    <%--<a class="hover-link" data-lightbox="image" href="<%#  CMS.CMSLogic.TItem.GetImageClientPath(DataBinder.Eval(Container.DataItem,"VirtualAddress")) %>">اطلاعات بیشتر</a>--%>
                  </div>
                </div>
    </ItemTemplate>
</asp:ListView>
    </div>