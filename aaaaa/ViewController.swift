//
//  ViewController.swift
//  aaaaa
//
//  Created by 江其 on 2018/2/28.
//  Copyright © 2018年 jiang. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

//    @IBOutlet weak var tableview: UITableView!
    
    var tableView : UITableView?
    
    var imageView : UIImageView?
    
    var navView: NavBarView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.navView = NavBarView(frame: CGRect(x: 0.0, y: 0.0, width: kScreenWidth, height: CGFloat(getNavHeight())), bgColor: UIColor.white)
        
        self.navigationController?.isNavigationBarHidden = true
        
        self.title = "标题"
        
        self.view.backgroundColor = UIColor.white
        
        self.imageView = UIImageView(image: UIImage(named: "registerImageName"))
        self.imageView?.frame = CGRect(x: 30, y: 50, width: 300, height: 400)
        
//        self.view.addSubview(self.imageView!)
        
        self.imageView?.backgroundColor = .black
        
        self.imageView?.layer.shadowOpacity = 0.5
        self.imageView?.layer.shadowRadius = 4
        self.imageView?.layer.shadowOffset = CGSize(width: 0, height: 0)

        var transform3D: CATransform3D = CATransform3DIdentity
        transform3D.m34 = -1.0/500
        transform3D = CATransform3DRotate(transform3D, CGFloat(Double.pi/4), 1, 0, 0)
        self.imageView?.layer.transform = transform3D
        // 如果去掉transform3D.m34 = -1.0/500;代码，那么没有投影效果的立体感，只缩小了一点X和Y
//        CATransform3D transform3D = CATransform3DIdentity ;
//        transform3D.m34 = -1.0/500;
//        transform3D = CATransform3DRotate(transform3D, M_PI_4, 1, 0, 0);
//        self.imageView.layer.transform = transform3D ;
        
        self.tableView = UITableView(frame: CGRect(x: 0.0, y: (self.navView?.stateHeight)!, width: Double(kScreenWidth), height: (Double(kScreenHeight) - (self.navView?.stateHeight)!)), style: .plain)
        self.tableView?.tableHeaderView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: Double(kScreenWidth), height: (self.navView?.navHeight)!))
        
        self.view.addSubview(self.tableView!)
    
        self.tableView?.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentBehavior.scrollableAxes
        
        self.tableView?.delegate = self
        
        self.tableView?.dataSource = self
        
        self.tableView?.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: "cell")
        
        self.tableView?.backgroundColor = .red
        self.tableView?.clipsToBounds = true
        

        self.view.addSubview(self.navView!)
        
        self.view?.backgroundColor = .yellow
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell :UITableViewCell = tableView .dequeueReusableCell(withIdentifier: "cell")!
        cell.textLabel?.text = "----\(indexPath.row)"
        
        return cell;
        
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        print("偏移量==\(scrollView.contentOffset.y)")
       
        if scrollView.contentOffset.y <= 0 {
            self.navView?.navView.backgroundColor = self.navView?.navView.backgroundColor?.withAlphaComponent(1.0)
            
            self.tableView?.contentInset = UIEdgeInsetsMake(0, 0, 0, 0)
        }else if scrollView.contentOffset.y <= CGFloat((self.navView?.navHeight)!) {
            
            self.navView?.navView.backgroundColor = self.navView?.navView.backgroundColor?.withAlphaComponent((CGFloat(1.0-(Double(scrollView.contentOffset.y)/(self.navView?.navHeight)!))))
            
            self.tableView?.contentInset = UIEdgeInsetsMake(-scrollView.contentOffset.y, 0, 0, 0)
        }
    }

    func scrollViewDidScrollToTop(_ scrollView: UIScrollView) {
        
        
//        aa = 0.0
    }
    
    var aa : CGFloat = 100.0;
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.tableView?.contentInset = UIEdgeInsetsMake(-aa, 0, 0, 0)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

