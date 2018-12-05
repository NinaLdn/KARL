import "bootstrap";
import Slider from 'bootstrap-slider';
import 'bootstrap-slider/dist/css/bootstrap-slider';

const slider = new Slider("#ex11", {
  step: 20000,
  min: 0,
  max: 1000000
});

const getValueForSlider = () => {
  const handle = slider.handle1
  slider.on('slideStop', (event) => {
    const trueSlider = document.getElementById('trueSlider')
    if (trueSlider){
      trueSlider.value = event
    }
  });
};

export { getValueForSlider }
