const compass = {
    show: true,
    position: {x: 0.5, y: 0.07, centered: true},
    width: 0.25,
    fov: 180,
    followGameplayCam: true,
    ticksBetweenCardinals: 9.0,
    tickColour: {r: 255, g: 255, b: 255, a: 255},
    tickSize: {w: 0.001, h: 0.003},
    cardinal: {
        textSize: 0.25,
        textOffset: 0.015,
        textColour: {r: 255, g: 255, b: 255, a: 255},
        tickShow: true,
        tickSize: {w: 0.001, h: 0.012},
        tickColour: {r: 255, g: 255, b: 255, a: 255}
    },
    intercardinal: {
        show: true,
        textShow: true,
        textSize: 0.2,
        textOffset: 0.015,
        textColour: {r: 255, g: 255, b: 255, a: 255},
        tickShow: true,
        tickSize: {w: 0.001, h: 0.006},
        tickColour: {r: 255, g: 255, b: 255, a: 255}
    }
};

function degreesToIntercardinalDirection(dgr) {
    dgr = dgr % 360.0;
    if ((dgr >= 0.0 && dgr < 22.5) || dgr >= 337.5) return "N ";
    if (dgr >= 22.5 && dgr < 67.5) return "NE";
    if (dgr >= 67.5 && dgr < 112.5) return "E ";
    if (dgr >= 112.5 && dgr < 157.5) return "SE";
    if (dgr >= 157.5 && dgr < 202.5) return "S ";
    if (dgr >= 202.5 && dgr < 247.5) return "SW";
    if (dgr >= 247.5 && dgr < 292.5) return "W ";
    if (dgr >= 292.5 && dgr < 337.5) return "NW";
}

function drawText(str, x, y, style) {
    const el = document.createElement('div');
    el.textContent = str;
    el.style.position = 'absolute';
    el.style.left = `${x * 100}%`;
    el.style.top = `${y * 100}%`;
    el.style.color = `rgba(${style.colour.r}, ${style.colour.g}, ${style.colour.b}, ${style.colour.a})`;
    el.style.fontSize = `${style.size * 50}px`;
    if (style.centered) {
        el.style.transform = 'translate(-50%, -50%)';
    }
    if (style.outline) {
        el.style.textShadow = '-1px -1px 0 #000, 1px -1px 0 #000, -1px 1px 0 #000, 1px 1px 0 #000';
    }
    return el;
}

function drawRect(x, y, width, height, r, g, b, a) {
    const el = document.createElement('div');
    el.style.position = 'absolute';
    el.style.left = `${x * 100}%`;
    el.style.top = `${y * 80}%`;
    el.style.width = `${width * 100}%`;
    el.style.height = `${height * 100}%`;
    el.style.backgroundColor = `rgba(${r}, ${g}, ${b}, ${a})`;
    return el;
}

function drawCompass(playerHeadingDegrees) {
    const dynamicCompass = document.getElementById('dynamic-compass');
    dynamicCompass.innerHTML = '';

    const pxDegree = compass.width / compass.fov;
    
    let tickDegree = playerHeadingDegrees - compass.fov / 2;
    let tickDegreeRemainder = compass.ticksBetweenCardinals - (tickDegree % compass.ticksBetweenCardinals);
    let tickPosition = compass.position.x - compass.width / 2 + tickDegreeRemainder * pxDegree;

    tickDegree = tickDegree + tickDegreeRemainder;

    while (tickPosition < compass.position.x + compass.width / 2) {
        if ((tickDegree % 90.0) == 0) {
            if (compass.cardinal.tickShow) {
                dynamicCompass.appendChild(drawRect(tickPosition, compass.position.y, compass.cardinal.tickSize.w, compass.cardinal.tickSize.h, 
                compass.cardinal.tickColour.r, compass.cardinal.tickColour.g, compass.cardinal.tickColour.b, compass.cardinal.tickColour.a));
            }
            
            dynamicCompass.appendChild(drawText(degreesToIntercardinalDirection(tickDegree), tickPosition, compass.position.y + compass.cardinal.textOffset, {
                size: compass.cardinal.textSize,
                colour: compass.cardinal.textColour,
                outline: true,
                centered: true
            }));
        } else if ((tickDegree % 45.0) == 0 && compass.intercardinal.show) {
            if (compass.intercardinal.tickShow) {
                dynamicCompass.appendChild(drawRect(tickPosition, compass.position.y, compass.intercardinal.tickSize.w, compass.intercardinal.tickSize.h, 
                compass.intercardinal.tickColour.r, compass.intercardinal.tickColour.g, compass.intercardinal.tickColour.b, compass.intercardinal.tickColour.a));
            }
            
            if (compass.intercardinal.textShow) {
                dynamicCompass.appendChild(drawText(degreesToIntercardinalDirection(tickDegree), tickPosition, compass.position.y + compass.intercardinal.textOffset, {
                    size: compass.intercardinal.textSize,
                    colour: compass.intercardinal.textColour,
                    outline: true,
                    centered: true
                }));
            }
        } else {
            dynamicCompass.appendChild(drawRect(tickPosition, compass.position.y, compass.tickSize.w, compass.tickSize.h, 
            compass.tickColour.r, compass.tickColour.g, compass.tickColour.b, compass.tickColour.a));
        }
        
        tickDegree = tickDegree + compass.ticksBetweenCardinals;
        tickPosition = tickPosition + pxDegree * compass.ticksBetweenCardinals;
    }
}

window.addEventListener('message', function(event) {
    var data = event.data;
    var streetNameElement = document.getElementById('street-name');
    var compassContainer = document.getElementById('compass-container');

    if (data.type === "updateCompass") {
        drawCompass(data.heading);
    } else if (data.type === "updateStreetName") {
        if (streetNameElement) {
            streetNameElement.textContent = data.streetName;
        }
    } else if (data.type === "hideCompass") {
        if (compassContainer) {
            compassContainer.style.display = 'none';
        }
    } else if (data.type === "showCompass") {
        if (compassContainer) {
            compassContainer.style.display = 'block';
        }
    }
});

drawCompass(0);