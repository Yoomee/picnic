GoogleMapsHelper.module_eval do
  
  def google_map(objects, options ={})
    puts "options = #{options.inspect}"
    @map_index  = (@map_index || -1) + 1
    objects = [*objects]
    options.reverse_merge!(
      :canvas_id => "map_canvas#{map_index}",
      :width => 300,
      :height => 300,
      :map_type => "roadmap",
      :zoom => 4,
      :interactive => true,
      :disable_default_ui => true
    )
    options[:canvas_id] = "map_canvas#{map_index}" #force it for now
    
    
    if !options[:centre]
      if objects.size == 1 && objects.first.has_lat_lng?
        options[:centre] = objects.first.lat_lng
      else
        options[:centre] = [54.47,-4.53]
      end
    end
    
    puts "disableDefaultUI = #{options[:disable_default_ui]}"
    
    map_js = <<-JAVASCRIPT
      map#{map_index} = new google.maps.Map(document.getElementById('#{options[:canvas_id]}'),{
        zoom: #{options[:zoom]},
        center: new google.maps.LatLng(#{options[:centre].join(',')}),
        mapTypeId: google.maps.MapTypeId.#{options[:map_type].upcase},
        minZoom:2,
        scrollwheel:false,
        disableDefaultUI:#{options[:disable_default_ui]}
        #{',draggable:false,scrollwheel:false,disableDoubleClickZoom:true,keyboardShortcuts:false' if !options[:interactive]}
        #{',' + options[:map_options] unless options[:map_options].blank?}
      });
      
      function PicnicMarker(opts) {
        opts.image = new google.maps.MarkerImage(
          '/images/marker_heart.png',
          new google.maps.Size(20,38),
          new google.maps.Point(0,0),
          new google.maps.Point(10,38)
        );

        opts.shadow = new google.maps.MarkerImage(
          '/images/marker_heart_shadow.png',
          new google.maps.Size(42,38),
          new google.maps.Point(0,0),
          new google.maps.Point(10,38)
        );

        opts.shape = {
          coord: [17,1,18,2,19,3,19,4,18,5,19,6,19,7,19,8,19,9,19,10,19,11,19,12,19,13,19,14,19,15,18,16,18,17,18,18,19,19,19,20,19,21,18,22,18,23,18,24,17,25,17,26,16,27,16,28,15,29,15,30,14,31,14,32,14,33,13,34,13,35,12,36,7,36,6,35,6,34,5,33,5,32,5,31,4,30,4,29,3,28,3,27,2,26,2,25,1,24,1,23,1,22,0,21,0,20,0,19,1,18,1,17,1,16,0,15,0,14,0,13,0,12,0,11,0,10,0,9,0,8,0,7,0,6,1,5,0,4,0,3,1,2,2,1,17,1],
          type: 'poly'
        };
        this.setOptions(opts); 
      } 

      PicnicMarker.prototype = new google.maps.Marker;
      
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
      map_js << "map#{map_index}.fitBounds(bounds);" if options[:auto_bounds]
    end
    map_js_tag = javascript_tag do 
      <<-JAVASCRIPT
      var map#{map_index};
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

        map#{map_index}.mapTypes.set('gray', grayMapType);
        map#{map_index}.setMapTypeId('gray');
      });
      JAVASCRIPT
    end
    content_for :head do
      @included_google_maps_js ? map_js_tag : "#{header_tag}#{map_js_tag}"
    end
    @included_google_maps_js = true
    options[:width] = "#{options[:width]}px" if options[:width].is_a?(Integer)
    options[:height] = "#{options[:height]}px" if options[:height].is_a?(Integer)
    content_tag(:div, "",:id => options[:canvas_id], :style => "width:#{options[:width]};height:#{options[:height]}#{options[:style].blank? ? '' : ";#{options[:style]}"}", :class => "map_canvas #{options[:class]}")
  end
  
  private
  
  def marker(object, marker_options_hash = {})
    marker_options_hash ||= {}
    marker_options = "position: markerLatLng,map: map#{map_index}, title:''"
    if marker_options_hash[:draggable]
      marker_options << ", draggable: true"
    end
    marker_image_method = "#{object.class.to_s.underscore}_marker_image"
    if (methods.include?(marker_image_method)) && (marker_image = send(marker_image_method, object))
      icon_string = (marker_image =~ /^new/) ? marker_image : "'#{marker_image}'" 
      marker_options << ", icon:#{icon_string}"
    end
    "new PicnicMarker({#{marker_options}});"
  end
  
end
