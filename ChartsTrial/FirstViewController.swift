//
//  FirstViewController.swift
//  ChartsTrial
//
//  Created by Joe Quezada on 4/4/17.
//  Copyright © 2017 Joe Quezada. All rights reserved.
//

// Tutorial Available here: https://www.youtube.com/watch?v=2J-_YBXEhNU

import UIKit
import JBChart

class FirstViewController: UIViewController, JBBarChartViewDelegate, JBBarChartViewDataSource {
    /**
     *  The number of bars in a given bar chart is the number of vertical views shown along the x-axis.
     *
     *  @param barChartView     The bar chart object requesting this information.
     *
     *  @return Number of bars in the given chart, displayed horizontally along the chart's x-axis.
     */
    public func numberOfBars(in barChartView: JBBarChartView!) -> UInt {
    // Work on this statement
    return 5
    }


    @IBOutlet weak var barChart: JBBarChartView!
    @IBOutlet weak var informationLabel: UILabel!

    //Creatint arrays of data
    
    var chartLegend = ["11/14", "11/15", "11/16", "11/17", "11/18", "11/19", "11/20", "11/21"] //bottom axis information label
    var chartData = [76, 78, 92, 104, 97, 95, 98]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        view.backgroundColor = UIColor.darkGray
        
        // Bar Chart setup 
        
        barChart.backgroundColor = UIColor.darkGray // check if this command work without color and ()
        barChart.delegate = self
        barChart.dataSource = self
        
        barChart.minimumValue = 0 // positive number, mandatory
        barChart.maximumValue = 110
        
        // to-do add footer and header
        
        barChart.reloadData()
        barChart.setState(.collapsed, animated: false)
        showChart() // Remember to add this command to show graph
        
        //Making changes
        
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear (animated)
        
        // our code
        barChart.reloadData()
        
        // work on timer variable
        var timer = Timer(timeInterval: 0.5, target: self, selector: #selector(FirstViewController.showChart), userInfo: nil, repeats: true)
            
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        hideChart ()
        
    }
    
    func hideChart ()
    {
    barChart.setState(.collapsed, animated: true)
    }
    
    func showChart ()
    {
        barChart.setState(.expanded, animated: true)
        
    }
    
    //MARK: JBBarChartView
    
    func numberOfBarsInBarChartView(barChartView: JBBarChartView!) -> UInt {
        return UInt(chartData.count)

    }
    
    func barChartView(_ barChartView: JBBarChartView!, heightForBarViewAt index: UInt) -> CGFloat {
        return CGFloat (chartData[Int (index)])
    }
    
    func barChartView(_ barChartView: JBBarChartView!, colorForBarViewAt index: UInt) -> UIColor! {
    
        return (index % 2 == 0) ? UIColor.lightGray : UIColor.white }
    
    
    func barChartView(_ barChartView: JBBarChartView!, didSelectBarAt index: UInt){
        let data = chartData[Int(index)]
        let key = chartLegend [Int(index)]
        
        informationLabel.text = "Weather on \(key): \(data)"
        
    }
    
    func didDeselectBarChartView(barChartView: JBBarChartView!){
        informationLabel.text = ""
    }
    
}


