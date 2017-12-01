$(document).ready(function () {
    // MC110717 this ready is specific to keyword pages
    onMoroccoOnlyCheckBoxChange();
});

function onMoroccoOnlyCheckBoxChange() {

    if ($('label.switch input').prop("checked") == true) {
        // bring new data
        $.ajax({
            type: 'POST',
            url: "/Keywords/KeywordsPartialView", // morocco only
            data: { moroccoOnly: 1 },
            success: (function (result) {
                $('#partialPlaceHolder').html(result);
            })
        });
    } else {
        // bring new data
        $.ajax({
            type: 'POST',
            url: "/Keywords/KeywordsPartialView", // global
            data: { moroccoOnly: 0 },
            success: (function (result) {
                $('#partialPlaceHolder').html(result);
            })
        });
    }
}