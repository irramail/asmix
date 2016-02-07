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

    playlist.addEventListener("click", function() {
        var selected = $('#plist_ids_plist_id    option:selected');
        selected.each(function() {
            $('.files4device').children("option[value="+ playlist[playlist.selectedIndex].value +"]").remove();

            playlist.remove(playlist.selectedIndex);
        });
    });

    var device = document.getElementById('devices_device_id');
    var groupdevices = document.getElementById('device_ids_device_id');
    device.addEventListener("click", function() {
        var qwe = $('#devices_device_id option:selected');
        var asd = $('#device_ids_device_id');
        var suborders_list = $('#suborders_list > tbody:last-child');
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
                    + '<td><select name="suborders['+ $(this).val() +'][period_id]"><option value="4" selected="selected">4</option></select></td>'
                    + '<td><select name="suborders['+ $(this).val() +'][startdt(1i)]">' + $('#startdatetime_startdt_1i').html()
                    + '</select>'
                    + '<select name="suborders['+ $(this).val() +'][startdt(2i)]">' + $('#startdatetime_startdt_2i').html()
                    + '</select>'
                    + '<select name="suborders['+ $(this).val() +'][startdt(3i)]">' + $('#startdatetime_startdt_3i').html()
                    + '</select>   '
                    + '<select name="suborders['+ $(this).val() +'][startdt(4i)]">' + $('#startdatetime_startdt_4i').html()
                    + '</select> : '
                    + '<select name="suborders['+ $(this).val() +'][startdt(5i)]">' + $('#startdatetime_startdt_5i').html()
                    + '</select></td>'
                    + '<td><select name="suborders['+ $(this).val() +'][stopdt(1i)]">' + $('#stopdatetime_stopdt_1i').html()
                    + '</select>'
                    + '<select name="suborders['+ $(this).val() +'][stopdt(2i)]">' + $('#stopdatetime_stopdt_2i').html()
                    + '</select>'
                    + '<select name="suborders['+ $(this).val() +'][stopdt(3i)]">' + $('#stopdatetime_stopdt_3i').html()
                    + '</select>   '
                    + '<select name="suborders['+ $(this).val() +'][stopdt(4i)]">' + $('#stopdatetime_stopdt_4i').html()
                    + '</select> : '
                    + '<select name="suborders['+ $(this).val() +'][stopdt(5i)]">' + $('#stopdatetime_stopdt_5i').html()
                    + '</select></td>'
                    + '<td><select name="suborders['+ $(this).val() +'][startt(4i)]">' + $('#starttime_startt_4i').html()
                    + '</select>:'
                    + '<select name="suborders['+ $(this).val() +'][startt(5i)]">' + $('#starttime_startt_5i').html()
                    + '</select></td>'
                    + '<td><select name="suborders['+ $(this).val() +'][stopt(4i)]">' + $('#stoptime_stopt_4i').html()
                    + '</select>:'
                    + '<select name="suborders['+ $(this).val() +'][stopt(5i)]">' + $('#stoptime_stopt_5i').html()
                    + '</select></td>'
                    + '<td><select name="suborders['+ $(this).val() +'][files][]" id="select_files4device' + $(this).val() + '" class="files4device" multiple="multiple">'
                    + $('#plist_ids_plist_id').html()
                    + '</select></td>'
                    + '</tr>');
            }
        });
    });

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
});
