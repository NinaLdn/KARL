// import slider from 'shared/slider'
import {kilometer} from 'shared/kilometer';
import {priceChart} from 'shared/price_chart';
import {moveCar} from 'shared/car';
import {submitCar} from 'shared/edit_form';
import {submitDamage} from 'shared/new_damage_form';

const chart = document.getElementById("myChart");
if(chart){
  priceChart();
}

const slider_element = document.getElementById('ex11');
if (slider_element) {
  kilometer();
}

// moveCar();
submitCar();
submitDamage();
