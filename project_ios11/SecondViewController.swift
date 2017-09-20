//
//  SecondViewController.swift
//  project_ios11
//
//  Created by 孙港 on 2017/9/21.
//  Copyright © 2017年 孙港. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.white
        
        //创建一个ContactAdd类型的按钮
        let button:UIButton = UIButton(type:.contactAdd)
        //设置按钮位置和大小
        button.frame = CGRect(x:10, y:150, width:100, height:30)
        //设置按钮文字
        button.setTitle("按钮", for:.normal)
        button.addTarget(self, action:#selector(btnClick), for:.touchUpInside)
        self.view.addSubview(button)
        // Do any additional setup after loading the view.
    }

    @objc func btnClick() {
        let viewController = ViewController()
        self.present(viewController, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
