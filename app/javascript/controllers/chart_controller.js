import { Controller } from 'stimulus'

export default class extends Controller {
  async connect () {
    const data = {
      labels: [
        'Feeding',
        'Weighing',
        'Cleaning',
        'Tasks'
      ],
      datasets: [{
        label: 'Your activity this month',
        data: [20, 33, 40, 25],
        fill: true,
        backgroundColor: 'rgba(255, 99, 132, 0.2)',
        borderColor: 'rgb(255, 99, 132)',
        pointBackgroundColor: 'rgb(255, 99, 132)',
        pointBorderColor: '#fff',
        pointHoverBackgroundColor: '#fff',
        pointHoverBorderColor: 'rgb(255, 99, 132)'
      }]
    }

    const { default: Chart } = await import('chart.js/auto')

    const chart = new Chart(this.element, {
      type: 'radar',
      data,
      options: {
        scales: {
          r: {
            suggestedMin: 0
          }
        },
        elements: {
          line: {
            borderWidth: 3
          }
        }
      }
    })
  }
}
