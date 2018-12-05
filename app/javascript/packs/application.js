import "bootstrap";
import Slider from 'bootstrap-slider';
import 'bootstrap-slider/dist/css/bootstrap-slider';



var slider = new Slider("#ex11", {
  step: 20000,
  min: 0,
  max: 1000000
});


function getValueForSlider() {
  const handle = slider.handle1
  slider.on('slideStop', (event) => {
    const trueSlider = document.getElementById('trueSlider')
    console.log(trueSlider)
    trueSlider.value = event;
  })
}

getValueForSlider()

// slider.addEventListener('click', event => console.log(event))
