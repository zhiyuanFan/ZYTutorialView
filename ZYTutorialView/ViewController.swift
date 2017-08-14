//
//  ViewController.swift
//  ZYTutorialView
//
//  Created by Jason Fan on 14/08/2017.
//  Copyright © 2017 QooApp. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var models: [TutorialModel]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        models = createData()
        
        let imageview = UIImageView(frame: UIScreen.main.bounds)
        imageview.image = UIImage(named: "bg")
        self.view.addSubview(imageview)
        
        
        let showBtn = UIButton(frame: CGRect(x: 150, y: 600, width: 200, height: 30))
        showBtn.setTitle("click to show tutorial", for: .normal)
        showBtn.setTitleColor(UIColor.white, for: .normal)
        showBtn.addTarget(self, action: #selector(showBtnOnclick), for: .touchUpInside)
        self.view.addSubview(showBtn)
    }
    
    func showBtnOnclick() {
        let maskView = ZYTutorialView(models: models!)
        view.addSubview(maskView)
    }
    
    func createData() -> [TutorialModel] {
        var models = [TutorialModel]()
        let screenW = UIScreen.main.bounds.size.width
        let screenH = UIScreen.main.bounds.size.height
        
        let model = TutorialModel()
        model.centerPoint = CGPoint(x: screenW/2, y: screenH - 60)
        model.radius = 30.0
        model.towards = LineDirection.up
        model.title = "这是向上的引导效果"
        models.append(model)
        
        let model1 = TutorialModel()
        model1.centerPoint = CGPoint(x: screenW/2, y: 40)
        model1.radius = 26
        model1.towards = LineDirection.down
        model1.title = "这是向下的引导效果"
        models.append(model1)
        
        let model2 = TutorialModel()
        model2.centerPoint = CGPoint(x: 287.5, y: 300)
        model2.radius = 35.0
        model2.towards = LineDirection.left
        model2.title = "这是向左的引导效果"
        models.append(model2)
        
        let model3 = TutorialModel()
        model3.centerPoint = CGPoint(x: 87.5, y: 300)
        model3.radius = 15
        model3.towards = LineDirection.right
        model3.title = "这是向右的引导效果"
        models.append(model3)
        
        let model4 = TutorialModel()
        model4.centerPoint = CGPoint(x: 340, y: 44)
        model4.radius = 20
        model4.towards = LineDirection.leftDown
        model4.title = "这是向左下的引导效果"
        models.append(model4)
        
        let model5 = TutorialModel()
        model5.centerPoint = CGPoint(x: 40, y: 44)
        model5.radius = 33
        model5.towards = LineDirection.rightDown
        model5.title = "这是向右下的引导效果"
        models.append(model5)
        
        let model6 = TutorialModel()
        model6.centerPoint = CGPoint(x: screenW/2, y: screenH - 60)
        model6.size = CGSize(width: 60, height: 30)
        model6.towards = LineDirection.up
        model6.title = "这是向上的引导效果"
        models.append(model6)
        
        let model7 = TutorialModel()
        model7.centerPoint = CGPoint(x: screenW/2, y: 40)
        model7.size = CGSize(width: 60, height: 30)
        model7.towards = LineDirection.down
        model7.title = "这是向下的引导效果"
        models.append(model7)
        
        let model8 = TutorialModel()
        model8.centerPoint = CGPoint(x: 287.5, y: 450)
        model8.size = CGSize(width: 100, height: 40)
        model8.towards = LineDirection.left
        model8.title = "这是向左的引导效果"
        models.append(model8)
        
        let model9 = TutorialModel()
        model9.centerPoint = CGPoint(x: 87.5, y: 400)
        model9.size = CGSize(width: 120, height: 60)
        model9.towards = LineDirection.right
        model9.title = "这是向右的引导效果"
        models.append(model9)
        
        let model10 = TutorialModel()
        model10.centerPoint = CGPoint(x: 340, y: 44)
        model10.size = CGSize(width: 60, height: 30)
        model10.towards = LineDirection.leftDown
        model10.title = "这是向左下的引导效果"
        models.append(model10)
        
        let model11 = TutorialModel()
        model11.centerPoint = CGPoint(x: 40, y: 44)
        model11.size = CGSize(width: 70, height: 30)
        model11.towards = LineDirection.rightDown
        model11.title = "这是向右下的引导效果"
        models.append(model11)
        
        return models
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

