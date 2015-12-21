$(document).ready(function() {
    $('.set-minutes-start').click(function (event) {
        var self = $(this);
        var time = $('#worktime_broadcasting_start').val();

        hours = time.substr(0,2);
        minutes = self.text();
        if ( minutes.length == 1 ) {
            minutes = '0' + minutes;
        }

        $('#worktime_broadcasting_start').val(hours + ':' + minutes);
    });

    $('.set-hours-start').click(function (event) {
        var self = $(this);
        var time = $('#worktime_broadcasting_start').val();

        hours = self.text();
        if ( hours.length == 1 ) {
            hours = '0' + hours;
        }
        minutes = time.substr(3,2);

        $('#worktime_broadcasting_start').val(hours + ':' + minutes);
    });

    $('.set-minutes-stop').click(function (event) {
        var self = $(this);
        var time = $('#worktime_broadcasting_stop').val();

        hours = time.substr(0,2);
        minutes = self.text();
        if ( minutes.length == 1 ) {
            minutes = '0' + minutes;
        }

        $('#worktime_broadcasting_stop').val(hours + ':' + minutes);
    });

    $('.set-hours-stop').click(function (event) {
        var self = $(this);
        var time = $('#worktime_broadcasting_stop').val();

        hours = self.text();
        if ( hours.length == 1 ) {
            hours = '0' + hours;
        }
        minutes = time.substr(3,2);

        $('#worktime_broadcasting_stop').val(hours + ':' + minutes);
    });
});
