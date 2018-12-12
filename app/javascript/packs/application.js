// import slider from 'shared/slider'
import {kilometer} from 'shared/kilometer';
import {priceChart} from 'shared/price_chart';
import {priceEvolutionChart} from 'shared/price_evolution_chart';
import {moveCar} from 'shared/car';
import {submitCar} from 'shared/edit_form';
import {submitDamage} from 'shared/new_damage_form';
import {cameraStart} from 'shared/camera';

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


// moveCar();
submitCar();
submitDamage();
