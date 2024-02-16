//18 is max zoom
var zoom=18;  
var fromProjection = new OpenLayers.Projection("EPSG:4326");   // Transform from WGS 1984
var toProjection   = new OpenLayers.Projection("EPSG:900913"); // to Spherical Mercator Projection
map = new OpenLayers.Map("mapdiv");
map.addLayer(new OpenLayers.Layer.OSM());
var markers = new OpenLayers.Layer.Markers("Markers");
/*unused by now, but problably used in future with markers
deviceID = points_data[0];*/
for (var i = 0; i < points_data.length; i++) {
  lat_point = points_data[i]["lat"];
  lon_point = points_data[i]["lon"];
  var position_point = new OpenLayers.LonLat(lon_point, lat_point).transform( fromProjection, toProjection);
  var trackers = new OpenLayers.Layer.Markers("Trakers"); 
  trackers.addMarker(new OpenLayers.Marker(position_point));
  map.addLayer(trackers);
}



var marker = new ol.Feature(new ol.geom.Point(ol.proj.fromLonLat([lon_point, lat_point])));
markers.getSource().addFeature(marker);
map.setCenter (position_point, zoom);