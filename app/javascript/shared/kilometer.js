import "bootstrap";
import Slider from 'bootstrap-slider';
import 'bootstrap-slider/dist/css/bootstrap-slider';

const kilometer = () => {
  const slider = new Slider("#ex11", {
    step: 5000,
    min: 0,
    max: 800000
  });
  const handle = slider.handle1
  slider.on('slideStop', (event) => {
    const trueSlider = document.getElementById('trueSlider')
    if (trueSlider){
      trueSlider.value = event
    }
  });
};

export { kilometer }
