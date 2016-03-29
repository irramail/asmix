function addToPlist() {
    $('#plist_ids_plist_id').find('option').remove().end();
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
            asd.append($('<option>', {
                value: $(this).val(),
                text: $(this).text()
            }));
        });
    });
    playlist.addEventListener("click", function() {
        var selected = $('#plist_ids_plist_id    option:selected');
        selected.each(function() {
            playlist.remove(playlist.selectedIndex);
        });
    });
};
