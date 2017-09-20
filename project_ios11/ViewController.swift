//
//  ViewController.swift
//  project_ios11
//
//  Created by 孙港 on 2017/9/20.
//  Copyright © 2017年 孙港. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    var mainMapView: MKMapView!
    //定位管理器
    //let locationManager:CLLocationManager = CLLocationManager()
    let locationManager = CLLocationManager()
    var currentLocation:CLLocation!
    var navigationBar:UINavigationBar?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //使用代码创建
        //navigationBar = UINavigationBar(frame: CGRect(x: 0, y: 20, width: self.view.bounds.width, height: 100))
        //self.view.addSubview(navigationBar!)
        
        self.mainMapView = MKMapView(frame:self.view.frame)
        self.view.addSubview(self.mainMapView)
        self.mainMapView.mapType = MKMapType.mutedStandard
        self.mainMapView.delegate = self
        self.mainMapView.showsUserLocation = true
        self.mainMapView.userTrackingMode = MKUserTrackingMode.followWithHeading
        
        //创建一个MKCoordinateSpan对象，设置地图的范围（越小越精确）
        //let latDelta = 0.05
        //let longDelta = 0.05
        //let currentLocationSpan:MKCoordinateSpan = MKCoordinateSpanMake(latDelta, longDelta)
        
        //定义地图区域和中心坐标（
        //使用当前位置
        //let center:CLLocation = locationManager.location!.coordinate
        //使用自定义位置
        //let center:CLLocation = CLLocation(latitude: 32.029171, longitude: 118.788231)
        //let currentRegion:MKCoordinateRegion = MKCoordinateRegion(center: center.coordinate,span: currentLocationSpan)
        
        //设置显示区域
        //self.mainMapView.setRegion(currentRegion, animated: true)
        
        //创建一个大头针对象
        let objectAnnotation = MKPointAnnotation()
        //设置大头针的显示位置
        objectAnnotation.coordinate = CLLocation(latitude: 32.029171,longitude: 118.788231).coordinate
        //设置点击大头针之后显示的标题
        objectAnnotation.title = "南京夫子庙"
        //设置点击大头针之后显示的描述
        objectAnnotation.subtitle = "南京市秦淮区秦淮河北岸中华路"
        //添加大头针
        self.mainMapView.addAnnotation(objectAnnotation)
        
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest //定位精确度（最高）一般有电源接入，比较耗电
        //kCLLocationAccuracyNearestTenMeters;//精确到10米
        locationManager.distanceFilter = 5 //设备移动后获得定位的最小距离（适合用来采集运动的定位）
        locationManager.requestWhenInUseAuthorization()//弹出用户授权对话框，使用程序期间授权（ios8后)
        //requestAlwaysAuthorization;//始终授权
        locationManager.startUpdatingLocation()
        
       
        //创建一个ContactAdd类型的按钮
        let button:UIButton = UIButton(type:.contactAdd)
        //设置按钮位置和大小
        button.frame = CGRect(x:10, y:150, width:100, height:30)
        //设置按钮文字
        button.setTitle("按钮", for:.normal)
        button.addTarget(self, action:#selector(btnClick), for:.touchUpInside)
        self.view.addSubview(button)

 
    }
    
    @objc func btnClick() {
        let secondViewController = SecondViewController()
        self.present(secondViewController, animated: true, completion: nil)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        self.currentLocation = locations.last!
        //print(currentLocation.coordinate.latitude)
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("定位出错拉！！\(error)")
    }
    
    //自定义大头针样式
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation)
        -> MKAnnotationView? {
            if annotation is MKUserLocation {
                //let messageView = MKAnnotationView()
                //messageView.image = UIImage(named: "self")
                //messageView.canShowCallout = true
                //return messageView
                return nil
            }
            
            let messageView = MKAnnotationView()
            messageView.image = UIImage(named: "pin")
            messageView.canShowCallout = true
            return messageView

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }


}

