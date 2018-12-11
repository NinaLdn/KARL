import Chart from 'chart.js'

const priceChart = () => {

Chart.defaults.global.legend.display = false;
Chart.defaults.scale.gridLines.display = false;

const ctx = document.getElementById("myChart").getContext('2d');
const myChart = new Chart(ctx, {
    type: 'bar',
    data: {
        labels: ["", ""],
        datasets: [{
            label: 'Total Price Estimates',
            data: JSON.parse(document.getElementById("myChart").dataset.prices),
            backgroundColor: [
                  'rgba(163, 250, 165, 1)',
                  'rgba(243, 94, 96, 0.77)'
            ],
            borderColor: [
                'rgba(144, 249, 146, 1)',
                'rgba(240, 61, 73, 0.77)'
            ],
            borderWidth: 1
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

export { priceChart }
