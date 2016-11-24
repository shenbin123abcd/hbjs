'use strict';
angular.module "app"
.directive 'chart',
  ['$rootScope','$location'
    ($rootScope,$location) ->
      ctrlFun = ($scope, $element, $attrs) ->
        vm = this



        init = ->
          vm.lineChartData = {
            labels : ["January","February","March","April","May","June","July"],
            datasets : [
              {
                fillColor : "rgba(220,220,220,0.5)",
                strokeColor : "rgba(220,220,220,1)",
                pointColor : "rgba(220,220,220,1)",
                pointStrokeColor : "#fff",
                data : [65,59,90,81,56,55,40]
              },
              {
                fillColor : "rgba(151,187,205,0.5)",
                strokeColor : "rgba(151,187,205,1)",
                pointColor : "rgba(151,187,205,1)",
                pointStrokeColor : "#fff",
                data : [28,48,40,19,96,27,100]
              }
            ]
          }

          vm.pieChartData = [
            {
              value: 30,
              color:"#F38630"
            },
            {
              value : 50,
              color : "#E0E4CC"
            },
            {
              value : 100,
              color : "#69D2E7"
            }

          ]
          vm.doughnutChartData = [
            {
              value: 30,
              color:"#F7464A"
            },
            {
              value : 50,
              color : "#46BFBD"
            },
            {
              value : 100,
              color : "#FDB45C"
            },
            {
              value : 40,
              color : "#949FB1"
            },
            {
              value : 120,
              color : "#4D5360"
            }

          ]

          graphInitDelay = 300;
          setTimeout(showLineChart,graphInitDelay);
          setTimeout(showPieChart,graphInitDelay);
          setTimeout(showDoughnutChart,graphInitDelay);
          return

        showLineChart=->
          ctx = document.getElementById("lineChartCanvas").getContext("2d")
          new Chart(ctx).Line(vm.lineChartData)
          return

        showPieChart=->
          ctx = document.getElementById("pieChartCanvas").getContext("2d")
          new Chart(ctx).Pie(vm.pieChartData)
          return
        showDoughnutChart=->
          ctx = document.getElementById("doughnutChartCanvas").getContext("2d")
          new Chart(ctx).Doughnut(vm.doughnutChartData)
          return

        init()
        return

      directive =
        restrict: 'AE'
        templateUrl: 'chart.html?'+new Date().getTime()
        scope:{}

        controller: ['$scope', '$element', '$attrs',ctrlFun]
        controllerAs: 'vm'
  ]