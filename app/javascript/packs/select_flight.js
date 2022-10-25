console.log('easd')



function selectFlight(elements, element) {
  for (let container of elements) {
    container.classList.remove('container-selected')
  }
  element.classList.add('container-selected')
}

const flight_containers = document.getElementsByClassName("flight-container");

for (const container of flight_containers) {
  container.onclick = () => selectFlight(flight_containers, container)
}

