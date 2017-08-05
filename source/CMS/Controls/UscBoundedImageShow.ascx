<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UscBoundedImageShow.ascx.cs" Inherits="CMS.Controls.UscBoundedImageShow" %>

   <img class="<%# this.CssClass %>" style="float:<%= Float %>" src="<%#  CMS.CMSLogic.TItem.GetImageClientPath(Eval("PhotoPath")) %>" title="<%#  Eval("ItemTopic")  %>" alt="<%#  Eval("ItemTopic")  %>" />

