/**
 * Created by p6 on 12/18/15.
 */

$(document).ready(function() {
    $('.set-minutes').click(function (event) {
        var self = $(this);
        var time = $('#volsofday_time').val();

        hours = time.substr(0,2);
        minutes = self.text();
        if ( minutes.length == 1 ) {
            minutes = '0' + minutes;
        }

        $('#volsofday_time').val(hours + ':' + minutes);
    });

    $('.set-hours').click(function (event) {
        var self = $(this);
        var time = $('#volsofday_time').val();

        hours = self.text();
        if ( hours.length == 1 ) {
            hours = '0' + hours;
        }
        minutes = time.substr(3,2);

        $('#volsofday_time').val(hours + ':' + minutes);
    });
});
