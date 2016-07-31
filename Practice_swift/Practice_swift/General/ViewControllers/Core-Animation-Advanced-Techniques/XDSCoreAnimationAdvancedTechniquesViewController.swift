//
//  XDSCoreAnimationAdvancedTechniquesViewController.swift
//  Practice_swift
//
//  Created by xudosom on 16/7/30.
//  Copyright © 2016年 上海优蜜科技有限公司. All rights reserved.
//

import UIKit
import SnapKit
class XDSCoreAnimationAdvancedTechniquesViewController: UIViewController {

    @IBOutlet weak var browView: UIView!
    @IBOutlet weak var subView1: UIView!
    @IBOutlet weak var subView2: UIView!
    
    @IBOutlet var cubeContentView: UIView!
    @IBOutlet var faces: [UIView]!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.coreAnimationAdvancedTechniquesViewControllerDataInit();
        self .createCoreAnimationAdvancedTechniquesViewControllerUI();
        
    }

    //MARK: - UI相关
    func createCoreAnimationAdvancedTechniquesViewControllerUI(){
//        self.perspectiveUI();//层的透视参数m34
        self .createCubeUI();

    }
    
    func createCubeUI() -> Void{
        self .addFace(0, transform: CATransform3DIdentity);
        //set up the container
        var perspective = CATransform3DIdentity;
        perspective.m34 = -1.0 / 500.0;
        self.cubeContentView.layer.sublayerTransform = perspective;
        //add cube face 1
        var transform = CATransform3DMakeTranslation(0, 0, 100);
        self.addFace(0, transform: transform);
        //add cube face 2
        transform = CATransform3DMakeTranslation(100, 0, 0);
        transform = CATransform3DRotate(transform, CGFloat(M_PI_2), 0, 1, 0);
        self.addFace(1, transform: transform);
        //add cube face 3
        transform = CATransform3DMakeTranslation(0, -100, 0);
        transform = CATransform3DRotate(transform, CGFloat(M_PI_2), 1, 0, 0);
        self.addFace(2, transform: transform);
        //add cube face 4
        transform = CATransform3DMakeTranslation(0, 100, 0);
        transform = CATransform3DRotate(transform, CGFloat(-M_PI_2), 1, 0, 0);
        self.addFace(3, transform: transform);
        //add cube face 5
        transform = CATransform3DMakeTranslation(-100, 0, 0);
        transform = CATransform3DRotate(transform, CGFloat(-M_PI_2), 0, 1, 0);
        self.addFace(4, transform: transform);
        //add cube face 6
        transform = CATransform3DMakeTranslation(0, 0, -100);
        transform = CATransform3DRotate(transform, CGFloat(M_PI), 0, 1, 0);
        self.addFace(5, transform: transform);
        
        perspective = CATransform3DRotate(perspective, CGFloat(-M_PI_4), 1, 0, 0);
        perspective = CATransform3DRotate(perspective, CGFloat(-M_PI_4), 0, 1, 0);
        self.cubeContentView.layer.sublayerTransform = perspective;

    }
    
    func addFace(index:Int, transform:CATransform3D) -> Void {
        let face = self.faces[index];
        self.cubeContentView.addSubview(face);

        face.snp_makeConstraints(closure: { (make) in
            make.center.equalTo(self.cubeContentView.snp_center);
            make.height.equalTo(200)
            make.width.equalTo((face.snp_height));
        })
        face.layer.transform = transform;
        
    }
    //TODO:层的透视参数m34
    func perspectiveUI() -> Void {
        //        var transform = CGAffineTransformIdentity;
        //        print("\(transform)");
        //        transform.c = 0.5;
        //        self.browView.layer.setAffineTransform(transform);
        //        print("\(transform)");
        
        var transform3D = CATransform3DIdentity;
        transform3D.m34 = -1.0/500.0;//设置透视
        //        transform3D = CATransform3DRotate(transform3D, CGFloat(M_PI_4), 0, 1, 0);
        //        self.browView.layer.transform = transform3D;
        
        self.browView.layer.sublayerTransform = transform3D;
        let transform3D1 = CATransform3DRotate(transform3D, CGFloat(M_PI_4), 0, 1, 0);
        self.subView1.layer.transform = transform3D1;
        self.subView2.layer.transform = transform3D1;
    }
    //MARK: - 代理方法
    
    //MARK: - 网络请求
    
    //MARK: - 事件响应处理
    
    //MARK: - 其他私有方法
    
    //MARK: - 内存管理相关
    func coreAnimationAdvancedTechniquesViewControllerDataInit(){
    }

}
