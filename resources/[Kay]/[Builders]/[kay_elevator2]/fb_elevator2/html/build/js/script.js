const background = document.getElementById('background');
const elevator = document.querySelector('.elevator');
const floorButtons = document.getElementById('floorButtons');
const closeButton = document.querySelector('.close-button');
let currentElevatorId = null;

function createFloorButtons(elevatorId, floors) {
    floorButtons.innerHTML = '';
    floors.forEach(floor => {
        const button = document.createElement('button');
        button.className = 'floor-button';
        button.textContent = floor.number;
        button.title = floor.name; 
        button.addEventListener('click', () => selectFloor(elevatorId, floor.number, floor.name));
        floorButtons.appendChild(button);
    });
}

function selectFloor(elevatorId, floorNumber, floorName) {
    fetch(`https://${GetParentResourceName()}/selectFloor`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json; charset=UTF-8',
        },
        body: JSON.stringify({ elevatorId: elevatorId, floorNumber: floorNumber, floorName: floorName })
    });
    closeElevator();
}

function closeElevator() {
    background.style.display = 'none';
    elevator.style.display = 'none';
    currentElevatorId = null;
    fetch(`https://${GetParentResourceName()}/closeElevator`, {
        method: 'POST'
    });
}

window.addEventListener('message', function(event) {
    const item = event.data;
    if (item.type === "openElevator") {
        background.style.display = 'block';
        elevator.style.display = 'block';
        currentElevatorId = item.elevatorId;
        createFloorButtons(item.elevatorId, item.floors);
    }
});

background.addEventListener('click', function(event) {
    if (event.target === background) {
        closeElevator();
    }
});

closeButton.addEventListener('click', function() {
    closeElevator();
});