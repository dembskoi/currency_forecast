$.fn.addChart = function(customData, customOptions) {
  var context, defaultData, defaultOptions, element, mergedData, mergedOptions, type;
  element = $(this);
  context = element[0];
  type = element.data('type');
  defaultData = {
    labels: element.data('labels'),
    datasets: [
      {
        label: element.data('name'),
        backgroundColor: ["#cf0776"],
        data: element.data('values'),
        fill: false
      }
    ]
  };
  defaultOptions = {
    responsive: true,
    scales: {
      xAxes: [{
        stacked: true
      }]
    }
  };
  mergedData = $.extend({}, defaultData, customData);
  mergedOptions = $.extend({}, defaultOptions, customOptions);
  return new Chart(context, {
    type: type,
    data: mergedData,
    options: mergedOptions
  });
};

$(document).ready(function() {
  $('#calculations_table').dataTable({
    columnDefs: [
      { bSortable: false, aTargets: [4, 5, 6] }
    ]
  });

  $('#results_table').dataTable({});

  $('#results-chart').addChart();
} );
