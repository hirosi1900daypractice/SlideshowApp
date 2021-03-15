//
//  SecondController.swift
//  slideshowApp
//
//  Created by 徳富博 on 2021/02/14.
//

import UIKit

class SecondController: UIViewController {
    var selectedImg: UIImage!
    
    @IBOutlet weak var imageView: UIImageView!


    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = selectedImg
        
        imageView.contentMode = UIView.ContentMode.scaleAspectFit
        // Do any additional setup after loading the view.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
