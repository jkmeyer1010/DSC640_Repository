/**
 * Get map data through highcharts cdn,
 * and draws map when data loaded by calling the callback.
 *
 * @callback widgetCallback
 * @name drawMap|generateSeriesAndDrawMap
 *
 * @param {string} mapKey - The path of map data. i.e., "countries/ca/ca-all".
 * @param {widgetCallback} cb - The callback that draws map widget.
 */
function getMapDataScript(mapKey, cb) {
    var url = "//code.highcharts.com/mapdata/" + mapKey + ".js";

    // There are still issues remained unresolved from library with these countries so we still keep this for now (2019-08-01), Reference Link: https://www.notion.so/venngage/Map-Library-Update-48b8ac7320774b0887fb33c4125c541c
    // Patch Ukraine, Poland, South Africa, South America, Latvia, Afghanistan maps - hotfix 2.14.2
    // Later on, we should download all the maps to our server instead of fetching from Highchart
    if (/countries\/ua\/ua-all/i.test(mapKey)
        || /countries\/pl\/pl-all/i.test(mapKey)
        || /countries\/za\/za-all/i.test(mapKey)
        || /custom\/south-america/i.test(mapKey)
        || /countries\/lv\/lv-all/i.test(mapKey)
        || /countries\/af\/af-all/i.test(mapKey)
        ) {
        url = '/media/js/ext/highmaps/mapdata/' + mapKey + '.js';
    }

    $.ajax({
        dataType: "script",
        cache: true,
        url: url,
    })
    .done(function() {
        cb();
    })
    .fail(function(jqXHR, textStatus, errorThrown) {
        console.error('Error:::', errorThrown);
    });
}
