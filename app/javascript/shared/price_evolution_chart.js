import Chart from 'chart.js'

const priceEvolutionChart = () => {

Chart.defaults.global.legend.display = false;
Chart.defaults.scale.gridLines.display = false;

const ctx = document.getElementById("my_price_evolution_chart").getContext('2d');
const myPriceEvolutionChart = new Chart(ctx, {
    type: 'line',
    data: {
        labels: ["","6", "12", "18", "24"],
        datasets: [{
            label: 'Fix price estmates',
            data: JSON.parse(document.getElementById("my_price_evolution_chart").dataset.prices)}]
    },
    options: {
        scales: {
            yAxes: [{
                ticks: {
                    display: false,
                    beginAtZero:true
                }
            }]
        }
    }
});
};
// myChart.insertAdjacentHTML('afterend', "<div id='chart'></div>")

export { priceEvolutionChart }

