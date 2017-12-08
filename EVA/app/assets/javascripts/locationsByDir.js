 // This example requires the Places library. Include the libraries=places
      // parameter when you first load the API. For example:
      // <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_API_KEY&libraries=places">

      function initMap() { 
        var map = new google.maps.Map(document.getElementById('mapitap'), {
          center: {lat: -33.8688, lng: 151.2195},
          zoom: 13
        });
        
        var directionsService = new google.maps.DirectionsService;
        var directionsDisplay = new google.maps.DirectionsRenderer;

        var geocoder = new google.maps.Geocoder;
        var infowindow = new google.maps.InfoWindow;
      if($('#submitmapita').val()){
        document.getElementById('submitmapita').addEventListener('click', function() {
          console.log("L");
          geocodeLatLng(geocoder, map, infowindow);
        });}
        directionsDisplay.setMap(map);
        if($('#submittravel').val()){
          console.log("M");
        document.getElementById('submittravel').addEventListener('click', function() {
          calculateAndDisplayRoute(directionsService, directionsDisplay);
        });}
        var input = /** @type {!HTMLInputElement} */(
            document.getElementById('pac-inputmap'));

        var types = document.getElementById('type-selectormap');
        map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);
        map.controls[google.maps.ControlPosition.TOP_LEFT].push(types);

        var autocomplete = new google.maps.places.Autocomplete(input);
        autocomplete.bindTo('bounds', map);

        var infowindow = new google.maps.InfoWindow();
        var marker = new google.maps.Marker({
          map: map,
          anchorPoint: new google.maps.Point(0, -29)
        });

        autocomplete.addListener('place_changed', function() {
          
          infowindow.close();
          marker.setVisible(false);
          var place = autocomplete.getPlace();
          if (!place.geometry) {
            // User entered the name of a Place that was not suggested and
            // pressed the Enter key, or the Place Details request failed.
            window.alert("No details available for input: '" + place.name + "'");
            return;
          }

          // If the place has a geometry, then present it on a map.
          if (place.geometry.viewport) {
            map.fitBounds(place.geometry.viewport);
          } else {
            map.setCenter(place.geometry.location);
            map.setZoom(17);  // Why 17? Because it looks good.
          }
          marker.setIcon(/** @type {google.maps.Icon} */({
            url: place.icon,
            size: new google.maps.Size(71, 71),
            origin: new google.maps.Point(0, 0),
            anchor: new google.maps.Point(17, 34),
            scaledSize: new google.maps.Size(35, 35)
          }));
          marker.setPosition(place.geometry.location);
          marker.setVisible(true);
          //console.log('DIR:' + place.geometry.location);

          var address = '';
          if (place.address_components) {
            address = [
              (place.address_components[0] && place.address_components[0].short_name || ''),
              (place.address_components[1] && place.address_components[1].short_name || ''),
              (place.address_components[2] && place.address_components[2].short_name || '')
            ].join(' ');
          }
          console.log(place);

          var colonia = place.address_components.filter(function(address_component){
            return address_component.types.includes("neighborhood");
        }); 
          var numcalle = place.address_components.filter(function(address_component){
            return address_component.types.includes("street_number");
        }); 
           var calle = place.address_components.filter(function(address_component){
            return address_component.types.includes("route");
        }); 
           var ciudad = place.address_components.filter(function(address_component){
            return address_component.types.includes("locality");
        });
           
           var estado = place.address_components.filter(function(address_component){
            return address_component.types.includes("administrative_area_level_1");
        });
            var pais = place.address_components.filter(function(address_component){
            return address_component.types.includes("country");
        });
             var cp = place.address_components.filter(function(address_component){
            return address_component.types.includes("postal_code");
        });
            console.log(place.formatted_address);  
             console.log(place.international_phone_number);  
          if ($("#location_address")){
            $("#location_address").val(place.formatted_address);
          }
            if ($("#location_street") && calle[0]){
            $("#location_street").val(calle[0].long_name);
          }
             if ($("#location_district") && colonia[0]  ){
            $("#location_district").val(colonia[0].long_name);
          }
           if ($("#location_intnum") && numcalle[0]){
            $("#location_intnum").val(numcalle[0].long_name);
          }
           if ($("#location_zipcode")&& cp[0]){
            $("#location_zipcode").val(cp[0].long_name);
          }
          if ($("#location_city") && ciudad[0]){
            $("#location_city").val(ciudad[0].long_name);
             $("#location_RFID").val(ciudad[0].long_name + "," +pais[0].long_name );
          }
          if ($("#location_state") && estado[0] ){
            $("#location_state").val(estado[0].long_name);
          }
          if ($("#location_country") && pais[0]){
            $("#location_country").val(pais[0].long_name);
          }
          $("#location_coordinates").val(place.geometry.location.toString().substring(1,(place.geometry.location.toString().trim().length ) -1 ));/*Esto es de a hueso */
           //console.log(place);
            //console.log(calle[0].long_name);
          infowindow.setContent('<div><strong>' + place.name + '</strong><br>' + address);
          infowindow.open(map, marker);
        });

        // Sets a listener on a radio button to change the filter type on Places
        // Autocomplete.
        /*
        function setupClickListener(id, types) {
          var radioButton = document.getElementById(id);
          radioButton.addEventListener('click', function() {
            autocomplete.setTypes(types);
          });
        }

        setupClickListener('changetype-all', []);
        setupClickListener('changetype-address', ['address']);
        setupClickListener('changetype-establishment', ['establishment']);
        setupClickListener('changetype-geocode', ['geocode']);*/


        /*--------------BY COORD-----------------------------*/
          function geocodeLatLng() {
              var map = new google.maps.Map(document.getElementById('mapitap'), {
          center: {lat: -33.8688, lng: 151.2195},
          zoom: 13
        });
            var geocoder = new google.maps.Geocoder;
        var infowindow = new google.maps.InfoWindow;

        var input = document.getElementById('latlngmap').value;
        //var input = coords.value;
        console.log("input: " + input);
        var latlngStr = input.split(',', 2);
        var latlng = {lat: parseFloat(latlngStr[0]), lng: parseFloat(latlngStr[1])};
        geocoder.geocode({'location': latlng}, function(results, status) {
          if (status === 'OK') {
            if (results[1]) {
              map.setZoom(11);
              var marker = new google.maps.Marker({
                position: latlng,
                map: map
              });
              infowindow.setContent(results[1].formatted_address);
              infowindow.open(map, marker);
            } else {
              window.alert('No results found');
            }
          } else {
            window.alert('Geocoder failed due to: ' + status);
          }
        });
      }
       }
       /*DRAW TRAVEL*/

      function calculateAndDisplayRoute(directionsService, directionsDisplay) {
        var waypts = [];
        var checkboxArray = document.getElementById('waypoints');
        for (var i = 0; i < checkboxArray.length; i++) {
          if (checkboxArray.options[i].selected) {
            waypts.push({
              location: checkboxArray[i].value,
              stopover: true
            });
          }
        }
        directionsService.route({
          origin: document.getElementById('start').value,
          destination: document.getElementById('end').value,
          waypoints: waypts,
          optimizeWaypoints: true,
          travelMode: 'DRIVING'
        }, function(response, status) {
          if (status === 'OK') {
            directionsDisplay.setDirections(response);
            var route = response.routes[0];
            var summaryPanel = document.getElementById('directions-panel');
            summaryPanel.innerHTML = '';
            // For each route, display summary information.
            for (var i = 0; i < route.legs.length; i++) {
              var routeSegment = i + 1;
              summaryPanel.innerHTML += '<b>Route Segment: ' + routeSegment +
                  '</b><br>';
              summaryPanel.innerHTML += route.legs[i].start_address + ' to ';
              summaryPanel.innerHTML += route.legs[i].end_address + '<br>';
              summaryPanel.innerHTML += route.legs[i].distance.text + '<br><br>';
            }
          } else {
            window.alert('Directions request failed due to ' + status);
          }
        });
      }