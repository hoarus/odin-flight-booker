function deselectAllFlights(elements) {
  for (let container of elements) {
    container.classList.remove('container-selected')
    const radioContainer = container.querySelector(".flight-radio");
    const radio = radioContainer.querySelector("input");
    radio.checked = false;
  }
}

function selectFlight(element) {
  element.classList.add('container-selected')
  const radioContainer = element.querySelector(".flight-radio");
  const radio = radioContainer.querySelector("input");
  radio.checked = true;
}

function updateFlightSelection(elements, element) {
  deselectAllFlights(elements);
  selectFlight(element);
}

// Query Selector
const flight_containers = document.getElementsByClassName("flight-container");

//Initialise function and event listeners
for (const container of flight_containers) {
  deselectAllFlights(flight_containers);
  container.onclick = () => updateFlightSelection(flight_containers, container)
}

