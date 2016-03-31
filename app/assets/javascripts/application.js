// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require_tree .

jQuery(document).ready(function($){
    var filename = document.getElementById('contents_content_id');
    var playlist = document.getElementById('plist_ids_plist_id');

    if (filename != null)
    filename.addEventListener("click", function() {
        var qwe = $('#contents_content_id option:selected');
        var asd = $('#plist_ids_plist_id');
        if (qwe.size() == 1) {
            oldvalue = qwe.val();
        }
        qwe.each(function() {
            if (qwe.size() > 1 && oldvalue ==  $(this).val()) {
                return true;
            }
            item = $(this);
            addnewitem = true;
            $('#plist_ids_plist_id option').each(function() {
                if ($(this).text() == item.text() && $(this).val() == item.val() )
                    addnewitem = false;
            });
            if (addnewitem) {
                $('.files4device').append($('<option>', {
                    value: $(this).val(),
                    text: $(this).text()
                }));
                asd.append($('<option>', {
                    value: $(this).val(),
                    text: $(this).text()
                }));
            }
        });
    });

    if (playlist != null)
    playlist.addEventListener("click", function() {
        var selected = $('#plist_ids_plist_id    option:selected');
        selected.each(function() {
            $('.files4device').children("option[value="+ playlist[playlist.selectedIndex].value +"]").remove();

            playlist.remove(playlist.selectedIndex);
        });
    });

    var device = document.getElementById('devices_device_id');
    var groupdevices = document.getElementById('device_ids_device_id');

    if (device != null)
    device.addEventListener("click", function() {
        var qwe = $('#devices_device_id option:selected');
        var asd = $('#device_ids_device_id');
        var suborders_list = $('#suborders_list > tbody:last-child');
        oldvalue = '';
        if (qwe.size() == 1) {
            oldvalue = qwe.val();
        }
        qwe.each(function() {
            if (qwe.size() > 1 && oldvalue ==  $(this).val()) {
                return true;
            }

            item = $(this);
            addnewitem = true;
            $('#device_ids_device_id option').each(function() {
                if ($(this).text() == item.text() && $(this).val() == item.val() )
                    addnewitem = false;
            });
            if (addnewitem) {
                asd.append($('<option>', {
                    value: $(this).val(),
                    text: $(this).text()
                }));

                suborders_list.append('<tr id="line4divice' + $(this).val() + '">'
                    + '<td>'+$(this).val() + '<input name="suborders['+ $(this).val() +'][device_id]" type="hidden" value="'+ $(this).val() + '" /></td>'
                    + '<td>' + $(this).text() + '</td>'
                    + '<td><select id="device_period_' + $(this).val() + '" name="suborders['+ $(this).val() +'][period_id]">' + $('#periods_period_id').html() + '</select></td>'
                    + '<td><select name="suborders['+ $(this).val() +'][startdt(1i)]">' + $('#startdatetime_startdt_1i').html()
                    + '</select> '
                    + '<select name="suborders['+ $(this).val() +'][startdt(2i)]">' + $('#startdatetime_startdt_2i').html()
                    + '</select> '
                    + '<select name="suborders['+ $(this).val() +'][startdt(3i)]">' + $('#startdatetime_startdt_3i').html()
                    + '</select> — '
                    + '<select name="suborders['+ $(this).val() +'][startdt(4i)]">' + $('#startdatetime_startdt_4i').html()
                    + '</select> : '
                    + '<select name="suborders['+ $(this).val() +'][startdt(5i)]">' + $('#startdatetime_startdt_5i').html()
                    + '</select></td>'
                    + '<td><select name="suborders['+ $(this).val() +'][stopdt(1i)]">' + $('#stopdatetime_stopdt_1i').html()
                    + '</select> '
                    + '<select name="suborders['+ $(this).val() +'][stopdt(2i)]">' + $('#stopdatetime_stopdt_2i').html()
                    + '</select> '
                    + '<select name="suborders['+ $(this).val() +'][stopdt(3i)]">' + $('#stopdatetime_stopdt_3i').html()
                    + '</select> — '
                    + '<select name="suborders['+ $(this).val() +'][stopdt(4i)]">' + $('#stopdatetime_stopdt_4i').html()
                    + '</select> : '
                    + '<select name="suborders['+ $(this).val() +'][stopdt(5i)]">' + $('#stopdatetime_stopdt_5i').html()
                    + '</select></td>'
                    + '<td><select id="device_wt_start_h_' + $(this).val() + '" name="suborders['+ $(this).val() +'][startt(4i)]">' + $('#starttime_startt_4i').html()
                    + '</select> : '
                    + '<select id="device_wt_start_m_' + $(this).val() + '" name="suborders['+ $(this).val() +'][startt(5i)]">' + $('#starttime_startt_5i').html()
                    + '</select></td>'
                    + '<td><select id="device_wt_stop_h_' + $(this).val() + '" name="suborders['+ $(this).val() +'][stopt(4i)]">' + $('#stoptime_stopt_4i').html()
                    + '</select> : '
                    + '<select id="device_wt_stop_m_' + $(this).val() + '" name="suborders['+ $(this).val() +'][stopt(5i)]">' + $('#stoptime_stopt_5i').html()
                    + '</select></td>'
                    + '<td><select name="suborders['+ $(this).val() +'][files][]" id="select_files4device' + $(this).val() + '" class="files4device" multiple="multiple">'
                    + $('#plist_ids_plist_id').html()
                    + '</select></td>'
                    + '</tr>');
                var device_period = document.getElementById('device_period_'+ $(this).val());
                device_period.value = periods[$(this).val()-1];

                var device_wt_start_h = document.getElementById('device_wt_start_h_'+ $(this).val());
                device_wt_start_h.value = worktimes[($(this).val()-1)*4].toString().slice(1);
                var device_wt_start_m = document.getElementById('device_wt_start_m_'+ $(this).val());
                device_wt_start_m.value = worktimes[($(this).val()-1)*4 + 1].toString().slice(1);
                var device_wt_stop_h = document.getElementById('device_wt_stop_h_'+ $(this).val());
                device_wt_stop_h.value = worktimes[($(this).val()-1)*4 + 2].toString().slice(1);
                var device_wt_stop_m = document.getElementById('device_wt_stop_m_'+ $(this).val());
                device_wt_stop_m.value = worktimes[($(this).val()-1)*4 + 3].toString().slice(1);
            }
        });
    });

    if (groupdevices != null)
    groupdevices.addEventListener("click", function() {
        var selected = $('#device_ids_device_id option:selected');
        selected.each(function() {
            $('#line4divice'+groupdevices[groupdevices.selectedIndex].value).remove();
            groupdevices.remove(groupdevices.selectedIndex);
        });
    });

    $(document.body).on('click', ".files4device", function(){
        var selected = $('#'+$(this).prop('id')+' option:selected');
        selected.each(function() {
            $(this).remove($(this).selectedIndex);
        });
    });

    $('#new_order').submit(function() {
        $('.files4device option').prop('selected', true);

        return true; // return false to cancel form action
    });

    //clean all contents in new order
    $('#cleanAllFiles').click(function() {
        $('#plist_ids_plist_id').find('option').remove().end();
        $('.files4device').find('option').remove().end();

        return false; // return false to cancel form action
    });

    //clean all devices in new order
    $('#cleanAllDevices').click(function() {
        $('#device_ids_device_id').find('option').remove().end();
        $('#suborders_body').find('tr').remove().end();
        return false;
    });

    /*menu handler*/
    function stripTrailingSlash(str) {
        if(str.substr(-1) == '/') {
            return str.substr(0, str.length - 1);
        }
        return str;
    }

    var url = window.location.pathname;
    var activePage = stripTrailingSlash(url);

    $('.nav li a').each(function(){
        var currentPage = stripTrailingSlash($(this).attr('href'));

        if (activePage == currentPage) {
            $(this).parent().addClass('active');
        }
    });

    //plsbgvideos
    var $devices = $('#source_device_ids');
    var $plsDevices = $('#plsbgvideo_device_ids');
    if ($devices.length && $plsDevices.length) {
        $devices.click(function (e) {
            var selectedDevices = $('#source_device_ids option:selected');
            var selectedPlsDevices = $('#plsbgvideo_device_ids');
            if (selectedDevices.length == 1) {
                oldDevice = selectedDevices.val();
            }
            selectedDevices.each(function () {
                if (selectedDevices.length > 1 && oldDevice == $(this).val()) {
                    return true;
                }

                var device = $(this),
                    addNewDevice = true;
                $('#plsbgvideo_device_ids option').each(function () {
                    if ($(this).text() == device.text() && $(this).val() == device.val())
                        addNewDevice = false;
                });
                if (addNewDevice) {
                    selectedPlsDevices.append($('<option>', {
                        value: $(this).val(),
                        text: $(this).text()
                    }));
                }
            });
        });

        $plsDevices.click(function (e) {
            var selectedDevices = $('#plsbgvideo_device_ids option:selected');
            selectedDevices.each(function () {
                if ($plsDevices.find('option').length > 1) {
                    $plsDevices[0].remove($plsDevices[0].selectedIndex)
                }
            });
        });
    }

    var $files = $('#source_mediafile_ids');
    var $plsFiles = $('#plsbgvideo_mediafile_ids');
    if ($files.length && $plsFiles.length) {
        $files.click(function (e) {
            var selectedFiles = $('#source_mediafile_ids option:selected');
            var selectedPlsFiles = $('#plsbgvideo_mediafile_ids');
            if (selectedFiles.length == 1) {
                oldFiles = selectedFiles.val();
            }
            selectedFiles.each(function () {
                if (selectedFiles.length > 1 && oldFile == $(this).val()) {
                    return true;
                }

                var file = $(this),
                    addNewFile = true;
                $('#plsbgvideo_mediafile_ids option').each(function () {
                    if ($(this).text() == file.text() && $(this).val() == file.val())
                        addNewFile = false;
                });
                if (addNewFile) {
                    selectedPlsFiles.append($('<option>', {
                        value: $(this).val(),
                        text: $(this).text()
                    }));
                }
            });
        });

        $plsFiles.click(function (e) {
            var selectedFiles = $('#plsbgvideo_mediafile_ids option:selected');
            selectedFiles.each(function () {
                if ($plsFiles.find('option').length > 1) {
                    $plsFiles[0].remove($plsFiles[0].selectedIndex)
                }
            });
        });
    }

    $('.new_plsbgvideo').submit(function() {
        $('#plsbgvideo_device_ids option').prop('selected', true);
        $('#plsbgvideo_mediafile_ids option').prop('selected', true);

        return true; // return false to cancel form action
    });

    //plsbgmusics
    //var $devices = $('#source_device_ids');
    var $plsMusicDevices = $('#plsbgmusic_device_ids');
    if ($devices.length && $plsMusicDevices.length) {
        $devices.click(function (e) {
            var selectedDevices = $('#source_device_ids option:selected');
            var selectedPlsDevices = $('#plsbgmusic_device_ids');
            if (selectedDevices.length == 1) {
                oldDevice = selectedDevices.val();
            }
            selectedDevices.each(function () {
                if (selectedDevices.length > 1 && oldDevice == $(this).val()) {
                    return true;
                }

                var device = $(this),
                    addNewDevice = true;
                $('#plsbgmusic_device_ids option').each(function () {
                    if ($(this).text() == device.text() && $(this).val() == device.val())
                        addNewDevice = false;
                });
                if (addNewDevice) {
                    selectedPlsDevices.append($('<option>', {
                        value: $(this).val(),
                        text: $(this).text()
                    }));
                }
            });
        });

        $plsMusicDevices.click(function (e) {
            var selectedDevices = $('#plsbgmusic_device_ids option:selected');
            selectedDevices.each(function () {
                if ($plsMusicDevices.find('option').length > 1) {
                    $plsMusicDevices[0].remove($plsMusicDevices[0].selectedIndex)
                }
            });
        });
    }

    //var $files = $('#source_mediafile_ids');
    var $plsMusicFiles = $('#plsbgmusic_mediafile_ids');
    if ($files.length && $plsMusicFiles.length) {
        $files.click(function (e) {
            var selectedFiles = $('#source_mediafile_ids option:selected');
            var selectedPlsFiles = $('#plsbgmusic_mediafile_ids');
            if (selectedFiles.length == 1) {
                oldFiles = selectedFiles.val();
            }
            selectedFiles.each(function () {
                if (selectedFiles.length > 1 && oldFile == $(this).val()) {
                    return true;
                }

                var file = $(this),
                    addNewFile = true;
                $('#plsbgmusic_mediafile_ids option').each(function () {
                    if ($(this).text() == file.text() && $(this).val() == file.val())
                        addNewFile = false;
                });
                if (addNewFile) {
                    selectedPlsFiles.append($('<option>', {
                        value: $(this).val(),
                        text: $(this).text()
                    }));
                }
            });
        });

        $plsMusicFiles.click(function (e) {
            var selectedFiles = $('#plsbgmusic_mediafile_ids option:selected');
            selectedFiles.each(function () {
                if ($plsMusicFiles.find('option').length > 1) {
                    $plsMusicFiles[0].remove($plsMusicFiles[0].selectedIndex)
                }
            });
        });
    }

    $('.new_plsbgmusic').submit(function() {
        $('#plsbgmusic_device_ids option').prop('selected', true);
        $('#plsbgmusic_mediafile_ids option').prop('selected', true);

        return true; // return false to cancel form action
    });

    //plsbgimages
    //var $devices = $('#source_device_ids');
    var $plsImageDevices = $('#plsbgimage_device_ids');
    if ($devices.length && $plsImageDevices.length) {
        $devices.click(function (e) {
            var selectedDevices = $('#source_device_ids option:selected');
            var selectedPlsDevices = $('#plsbgimage_device_ids');
            if (selectedDevices.length == 1) {
                oldDevice = selectedDevices.val();
            }
            selectedDevices.each(function () {
                if (selectedDevices.length > 1 && oldDevice == $(this).val()) {
                    return true;
                }

                var device = $(this),
                    addNewDevice = true;
                $('#plsbgimage_device_ids option').each(function () {
                    if ($(this).text() == device.text() && $(this).val() == device.val())
                        addNewDevice = false;
                });
                if (addNewDevice) {
                    selectedPlsDevices.append($('<option>', {
                        value: $(this).val(),
                        text: $(this).text()
                    }));
                }
            });
        });

        $plsImageDevices.click(function (e) {
            var selectedDevices = $('#plsbgimage_device_ids option:selected');
            selectedDevices.each(function () {
                if ($plsImageDevices.find('option').length > 1) {
                    $plsImageDevices[0].remove($plsImageDevices[0].selectedIndex)
                }
            });
        });
    }

    //var $files = $('#source_mediafile_ids');
    var $plsImageFiles = $('#plsbgimage_mediafile_ids');
    if ($files.length && $plsImageFiles.length) {
        $files.click(function (e) {
            var selectedFiles = $('#source_mediafile_ids option:selected');
            var selectedPlsFiles = $('#plsbgimage_mediafile_ids');
            if (selectedFiles.length == 1) {
                oldFiles = selectedFiles.val();
            }
            selectedFiles.each(function () {
                if (selectedFiles.length > 1 && oldFile == $(this).val()) {
                    return true;
                }

                var file = $(this),
                    addNewFile = true;
                $('#plsbgimage_mediafile_ids option').each(function () {
                    if ($(this).text() == file.text() && $(this).val() == file.val())
                        addNewFile = false;
                });
                if (addNewFile) {
                    selectedPlsFiles.append($('<option>', {
                        value: $(this).val(),
                        text: $(this).text()
                    }));
                }
            });
        });

        $plsImageFiles.click(function (e) {
            var selectedFiles = $('#plsbgimage_mediafile_ids option:selected');
            selectedFiles.each(function () {
                if ($plsImageFiles.find('option').length > 1) {
                    $plsImageFiles[0].remove($plsImageFiles[0].selectedIndex)
                }
            });
        });
    }

    $('.new_plsbgimage').submit(function() {
        $('#plsbgimage_device_ids option').prop('selected', true);
        $('#plsbgimage_mediafile_ids option').prop('selected', true);

        return true; // return false to cancel form action
    });

    $("#devices_search").keyup(function (e) {
        $.ajax({
            url: '/devices?devices_search=' + $('#devices_search').val(),
            type: 'GET',
            dataType: 'json'
        }).done(function(r) {
            console.log(r);
            $('#devices_device_id').empty();
            $.each(r, function(lid, device) {
                $('#devices_device_id')
                    .append($('<option>', { value : device.id })
                        .text(device.name));
            });
        });
    });

    $("#contents_search").keyup(function (e) {
        var $flagEmptyList = 0;
        $.ajax({
            url: '/contents/2?contents_search=' + $('#contents_search').val(),
            type: 'GET',
            dataType: 'json'
        }).done(function(r) {
            $flagEmptyList = 1;

            $('#contents_content_id').empty();
            $.each(r, function(lid, item) {
                $('#contents_content_id')
                    .append($('<option>', { value : item.id })
                        .text(item.filename));
            });
        });

        $.ajax({
            url: '/contents/4?contents_search=' + $('#contents_search').val(),
            type: 'GET',
            dataType: 'json'
        }).done(function(r) {
            if ($flagEmptyList == 0) {
                $('#contents_content_id').empty();
            }
            $.each(r, function(lid, item) {
                $('#contents_content_id')
                    .append($('<option>', { value : item.id })
                        .text(item.filename));
            });
        });
    });
});
