$(function () {
    var $debug = $("#debug");
    var $heal = $("#heal");
    var $armour = $("#armour");
    var $boxArmour = $("#boxArmour");
    var $box = $("#box");
    var $boxFood = $("#boxFood");
    var $boxThirst = $("#boxThirst");
    var $food = $("#food");
    var $boxDrunk = $("#boxDrunk")

    var $drunk = $("#drunk");

    var isAlive = true;

    window.addEventListener('message', function (event) {
        if (event.data.stats === true) {
            $('#heal').show();
            $('#food').show();
            $('#thirst').show();
            $('#drunk').show();

            $('#box').css("width", (event.data.heal) + "%");
            $('#boxArmour').css("width", (event.data.armour) + "%");
            $('#boxFood').css("width", (event.data.food) + "%");
            $('#boxThirst').css("width", (event.data.thirst) + "%");
            $('#boxDrunk').css("width", (event.data.drunk) + "%");
            $('#boxArmour').css("width", (event.data.armour) + "%");

            if (event.data.armour > 0) {
                $('#armour').show();
                $('#heal').css("width", '3%');
            } else {
                $('#armour').hide();
                $('#heal').css("width", '6%');
            }
        } else {
            $('#heal').hide();
            $('#armour').hide();
            $('#food').hide();
            $('#thirst').hide();
            $('#drunk').hide();
        }

        if (event.data.update) {
            $('#heal').css({ 'opacity': event.data.opacity });
            $('#armour').css({ 'opacity': event.data.opacity });
            $('#food').css({ 'opacity': event.data.opacity });
            $('#thirst').css({ 'opacity': event.data.opacity });
            $('#drunk').css({ 'opacity': event.data.opacity });
            $('#box').css({ 'opacity': event.data.opacity });
            $('#boxArmour').css({ 'opacity': event.data.opacity });
            $('#boxFood').css({ 'opacity': event.data.opacity });
            $('#boxThirst').css({ 'opacity': event.data.opacity });
            $('#boxDrunk').css({ 'opacity': event.data.opacity });
        }
    });

});