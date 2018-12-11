import Chart from 'chart.js'

const priceEvolutionChart = () => {

Chart.defaults.global.legend.display = false;
Chart.defaults.scale.gridLines.display = false;

const ctx = document.getElementById("my_price_evolution_chart").getContext('2d');
const myPriceEvolutionChart = new Chart(ctx, {
    type: 'line',
    data: {
        labels: ["","6 mois", "12 mois", "18 mois", "24 mois"],
        datasets: [{
            data: JSON.parse(document.getElementById("my_price_evolution_chart").dataset.prices),
            backgroundColor: [
                'rgba(54, 162, 235, 0.2)']
          }]
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

