<%@ Control Language="C#" CodeBehind="GoogleMap.ascx.cs" Inherits="CMS.DynamicData.FieldTemplates.GoogleMap" %>


  <script type="text/javascript"   src="http://maps.googleapis.com/maps/api/js?key=AIzaSyB2DiT3FNLpHAw407Iph1GNo8OT12ijhQg"></script>
  

<script type ="text/javascript">
    var map;
    google.maps.event.addDomListener(window, 'load', initialize);
    var center = new google.maps.LatLng('<%= Y %>', '<%= X %>');
 

    function initialize() {
        var mapOptions = {
            zoom: 7,
            center: center
        }
        var marker = new google.maps.Marker({
            position: center,
            map: map,
            animation: google.maps.Animation.DROP
        });
        var doc = document.getElementById('map-canvas');
        map = new google.maps.Map(doc,
            mapOptions);
    }
</script>
<style type="text/css">
    .map-convas {
    width:100px;
    height:100px;
    background-color:black;
    }
</style>
<asp:Panel ID="plhMap" runat="server">
      <div  class="map-convas" id="map-canvas"></div>
</asp:Panel>
