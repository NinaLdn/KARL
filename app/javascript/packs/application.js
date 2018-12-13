// import slider from 'shared/slider'
import "../shared/flatpickr"
import {kilometer} from 'shared/kilometer';
import {priceChart} from 'shared/price_chart';
import {priceEvolutionChart} from 'shared/price_evolution_chart';
import {moveCar} from 'shared/car';
import {submitCar} from 'shared/edit_form';
import {submitDamage} from 'shared/new_damage_form';
import {cameraStart} from 'shared/camera';
import {cameraDamageStart} from 'shared/damage-camera';
import {launchLoader} from 'shared/loader';

const chart = document.getElementById("myChart");
if(chart){
  priceChart();
}

const evolution_chart = document.getElementById("my_price_evolution_chart");
if(evolution_chart){
  priceEvolutionChart();
}

const slider_element = document.getElementById('ex11');
if (slider_element) {
  kilometer();
}

const camera = document.getElementById('camera');
if (camera) {
  cameraStart();
}

const cameraDamage = document.getElementById('camera-damage-video');
if (cameraDamage) {
  cameraDamageStart();
}

const fakeLoader = document.querySelector('.fake-loader');
if (fakeLoader) {
  launchLoader();
}

const newDamage = document.querySelector('.damages-container');
if (newDamage) {
  submitDamage();
}

// moveCar();

submitCar();



