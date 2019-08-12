var sharePlace = {
  applyBehaviors: function(scope) {
    $.each($("[data-behavior]", scope), function(index, element) {
      var $element = $(element);
      var behaviors = $element.data('behavior').split(' ');
      $.each(behaviors, function(index, behavior) {
        sharePlace.behaviors[behavior].apply($element);
      });
    });
  },
  behaviors: {}
};

$(function() {
  sharePlace.applyBehaviors($('body'));

  $('a[data-toggle="pill"]').on('shown.bs.tab', function (e) {
    var elementId = $(e.target).attr('href');
    sharePlace.applyBehaviors($(elementId));
  });
});

sharePlace.behaviors.displayMap = function() {
  var $this = $(this);
  var latitude = $this.data('latitude');
  var longitude = $this.data('longitude');
  var pos = [longitude, latitude];

  var layer = new ol.layer.Tile({
    source: new ol.source.OSM()
  });

  $('#' + $this.attr('id')).html('');

  var view = new ol.View({
    center: pos,
    zoom: 6
  });

  var map = new ol.Map({
    target: $this.attr('id'),
    layers: [layer],
    view: view
  });

  var positionFeature = sharePlace.positionFeature();
  positionFeature.setGeometry(pos ? new ol.geom.Point(pos) : null);

  new ol.layer.Vector({
    map: map,
    source: new ol.source.Vector({
      features: [positionFeature]
    })
  });
}

sharePlace.behaviors.displayCurrentLocation = function() {
  $('#my_current_location').html('');

  var layer = new ol.layer.Tile({
    source: new ol.source.OSM()
  });

  var view = new ol.View({
    center: [0, 0],
    zoom: 6
  });

  var map = new ol.Map({
    target: 'my_current_location',
    layers: [layer],
    view: view
  });

  var geolocation = new ol.Geolocation({
    tracking: true,
    projection: view.getProjection()
  });

  geolocation.on('change:projection', view);

  var positionFeature = sharePlace.positionFeature();

  geolocation.on('change:position', function() {
    var p = geolocation.getPosition();
    view.setCenter([parseFloat(p[0]), parseFloat(p[1])]);
    positionFeature.setGeometry(p ? new ol.geom.Point(p) : null);
    $('#location_settings #latitude').val(p[1]);
    $('#location_settings #longitude').val(p[0]);
  });

  new ol.layer.Vector({
    map: map,
    source: new ol.source.Vector({
      features: [positionFeature]
    })
  });
}

sharePlace.positionFeature = function() {
  var positionFeature = new ol.Feature();
  positionFeature.setStyle(new ol.style.Style({
    image: new ol.style.Circle({
      radius: 6,
      fill: new ol.style.Fill({
        color: '#3399CC'
      }),
      stroke: new ol.style.Stroke({
        color: '#fff',
        width: 2
      })
    })
  }));

  return positionFeature;
}
