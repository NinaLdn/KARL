// import slider from 'shared/slider'
import {kilometer} from 'shared/kilometer';
import {priceChart} from 'shared/price_chart';

const chart = document.getElementById("myChart");
if(chart){
  priceChart();
}

const slider_element = document.getElementById('ex11');
if (slider_element) {
  kilometer();
}
