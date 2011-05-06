GoogleMapsHelper.module_eval do
  
  def google_map(objects, options ={})
    objects = [*objects]
    options.reverse_merge!(
      :canvas_id => "map_canvas",
      :width => 300,
      :height => 300,
      :map_type => "roadmap",
      :zoom => 6,
      :interactive => true
    )
    
    if !options[:centre]
      if objects.size == 1 && objects.first.has_lat_lng?
        options[:centre] = objects.first.lat_lng
      else
        options[:centre] = [54.47,-4.53]
      end
    end
    
    map_js = <<-JAVASCRIPT
      var map = new google.maps.Map(document.getElementById('#{options[:canvas_id]}'),{
        zoom: #{options[:zoom]},
        center: new google.maps.LatLng(#{options[:centre].join(',')}),
        mapTypeId: google.maps.MapTypeId.#{options[:map_type].upcase},
        scrollwheel:false,
        disableDefaultUI:true
        #{',draggable:false,' if !options[:interactive]}
        #{',' + options[:map_options] unless options[:map_options].blank?}
      });
      
    JAVASCRIPT
    
    if options[:infoboxes]
      (options[:infobox_options] ||= {}).reverse_merge!({:offset => [0,0]})
      map_js << "var infoBox = new InfoBox({pixelOffset: new google.maps.Size(#{options[:infobox_options][:offset].join(',')})});"
    end
    
    if objects
      objects = objects.select(&:has_lat_lng?)
      options[:auto_bounds] = false if objects.size <= 1
      map_js <<   "var bounds = new google.maps.LatLngBounds();" if options[:auto_bounds]
      objects.each_with_index do |object, index|
        lat, lng = object.lat_lng
        map_js << "var markerLatLng = new google.maps.LatLng(#{lat}, #{lng});"
        map_js << "var marker#{index} = #{marker(object)}"
        map_js << infobox("marker#{index}", object) if options[:infoboxes]
        map_js << "bounds.extend(markerLatLng);" if options[:auto_bounds]
      end
      map_js << "map.fitBounds(bounds);" if options[:auto_bounds]
    end
    map_js_tag = javascript_tag do 
      <<-JAVASCRIPT
      $(document).ready(function() {
        #{map_js}
        #{options[:other]}
        var grayStyles = [
          {
            featureType: "water",
            elementType: "geometry",
            stylers: [
              { lightness: 0 },
              { saturation: -90 }
            ]
          },
          {
            featureType: "landscape",
            elementType: "geometry",
            stylers: [
              { lightness: +100 }
            ]
          },
          {
            featureType: "poi",
            elementType: "geometry",
            stylers: [
              { lightness: +100 }
            ]
          },
          {
            featureType: "road",
            elementType: "all",
            stylers: [
              { saturation: -100 },
              { hue: "#333333" }
            ]
          },
          {
             featureType: "administrative",
             elementType: "geometry",
             stylers: [
               { lightness: 100 }
             ]
           },
           {
              featureType: "transit.line",
              elementType: "geometry",
              stylers: [
                { lightness: 100 }
              ]
            }
        ];


        var styledMapOptions = {
          name: "Gray Map"
        }

        var grayMapType = new google.maps.StyledMapType(
        grayStyles, styledMapOptions);

        map.mapTypes.set('gray', grayMapType);
        map.setMapTypeId('gray');
      });
      JAVASCRIPT
    end
    content_for :head do
      @included_google_maps_js ? map_js_tag : "#{header_tag}#{map_js_tag}"
    end
    @included_google_maps_js = true
    content_tag(:div, "",:id => options[:canvas_id], :style => "width:#{options[:width]}px;height:#{options[:height]}px", :class => options[:class])
  end
  
end