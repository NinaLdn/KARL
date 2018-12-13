const launchLoader = () => {
const loader = document.querySelector(".fake-loader");
const estimationContainer = document.querySelector(".first-estimation-body");

setTimeout(function() {
  loader.classList.add("hidden");
  estimationContainer.classList.remove("hidden");
}, 3000);

}

export {launchLoader}

