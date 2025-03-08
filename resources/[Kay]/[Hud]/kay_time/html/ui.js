var lastInfo;

function getResponseHeaderMap(xhr) {
    const headers = {};
    xhr.getAllResponseHeaders()
        .trim()
        .split(/[\r\n]+/)
        .map(value => value.split(/: /))
        .forEach(keyValue => {
            headers[keyValue[0].trim()] = keyValue[1].trim();
        });
    return headers;
}

$(document).ready(function () {
    // Autres parties de votre code...

    // Mettre à jour l'heure toutes les minutes
    setInterval(() => {
        const d = new Date();
        $("#info").html(formatWithZero(d.getHours()) + ":" + formatWithZero(d.getMinutes()) + " " + formatWithZero(d.getDate()) + "/" + formatWithZero(d.getMonth()+1) + "          ");
    }, 1*1000); // Intervalles de 60 secondes (1 minute)

    function formatWithZero(n){
        return (n < 10 ? "0" + n : n);
    }
});
