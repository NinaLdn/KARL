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
            data: [70000, 60000],
            backgroundColor: [
                'rgba(255, 99, 132, 0.2)',
                'rgba(54, 162, 235, 0.2)'
            ],
            borderColor: [
                'rgba(255,99,132,1)',
                'rgba(54, 162, 235, 1)'
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
