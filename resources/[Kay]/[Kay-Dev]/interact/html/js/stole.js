(() => {
    // Définition des touches associées à des actions
    const Keys = {
        ['INPUT_CONTEXT']: 'E',
        ['INPUT_VEH_EXIT']: 'F',
        ['INPUT_VEH_ACCELERATE']: 'W',
        ['INPUT_VEH_DUCK']: 'X',
        ['INPUT_PICKUP']: 'E',
        ['INPUT_VEH_HEADLIGHT']: 'H',
        ['INPUT_THROW_GRENADE']: 'G',
        ['INPUT_MOVE_LEFT_ONLY']: 'A',
        ['INPUT_MOVE_RIGHT_ONLY']: 'D',
        ['INPUT_MOVE_UP_ONLY']: 'W',
        ['INPUT_MOVE_DOWN_ONLY']: 'S',
        ['INPUT_DETONATE']: 'G',
        ['INPUT_VEH_MOVE_LEFT_ONLY']: 'A',
        ['INPUT_VEH_MOVE_RIGHT_ONLY']: "D",
        ['INPUT_VEH_PREV_RADIO_TRACK']: '-',
        ['INPUT_SPRINT']: 'LEFT SHIFT',
        ['INPUT_CELLPHONE_RIGHT']: '⮫',
        ['INPUT_REPLAY_ADVANCE']: '⮫',
        ['INPUT_CELLPHONE_LEFT']: '⮪',
        ['INPUT_REPLAY_BACK']: '⮪',
        ['INPUT_CELLPHONE_UP']: '⮬',
        ['INPUT_CELLPHONE_DOWN']: '⮯',
        ['INPUT_FRONTEND_ACCEPT']: 'ENTER',
    };

    // Fonction pour convertir les clés dans un message
    const ConvertKeys = function (message) {
        const regexKeys = /~/g;
        message = message.replace(regexKeys, "");

        for (const [key, value] of Object.entries(Keys)) {
            if (message.match(key)) {
                message = message.replace(key, '<h1>' + value + '</h1>');
            }
        };

        return message;
    };

    // Fonction pour convertir le texte dans un message
    const ConvertText = function (message) {
        const regexColor = /~([^h])~([^~]+)/g;
        const regexBold = /~([h])~([^~]+)/g;
        const regexStop = /~s~/g;
        const regexLine = /\n/g;
        const newLine = /~n~/g;

        message = message.replace(regexColor, "<span class='$1'>$2</span>")
            .replace(regexBold, "<span class='$1'>$2</span>")
            .replace(regexStop, "")
            .replace(regexLine, "<br>")
            .replace(newLine, "<br>");
        message = ConvertKeys(message);

        return message;
    };

    // Fonction appelée lors de la réception de données
    window.onData = (data) => {
        switch (data.action) {
            case 'ShowHelpNotification': {
                if (data.state == 'open') {
                    if (data.message != 'Appuyez sur <h1>E</h1> pour intéragir.') {
                        $('#messagehelp').html('Appuyez sur <h1>E</h1> pour <hbedave>intéragir avec l\'action</hbedave>');
                    }

                    if (data.display == true) {
                        if ($('#uihelp').hasClass('hiding')) {
                            $('#uihelp').removeClass('hiding');
                        }

                        $('#uihelp').addClass('active');
                    }
                } else if (data.state == 'close') {
                    if ($('#uihelp').hasClass('active')) {
                        $('#uihelp').removeClass('active');
                    }

                    $('#uihelp').addClass('hiding');

                    // Envoi d'une notification à l'UI pour indiquer la fin de l'aide
                    $.post('https://fw_interactCanHelpNotification', JSON.stringify({
                        display: true
                    }));
                }

                break;
            }
        }
    };

    // Fonction appelée lors du chargement de la page
    window.onload = function (e) {
        window.addEventListener('message', (event) => {
            onData(event.data);
        });
    };
})();
