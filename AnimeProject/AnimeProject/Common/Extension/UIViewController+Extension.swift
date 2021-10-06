//
//  UIViewController+Extension.swift
//  AnimeProject
//
//  Created by Cristian Sanchez on 4/10/21.
//

import UIKit
import ZVProgressHUD

extension UIViewController {
    class func instantiate<T: UIViewController>(from storyboard: UIStoryboard, identifier: String) -> T {
        return storyboard.instantiateViewController(withIdentifier: identifier) as! T
    }
    
    class func instantiate(form storyboard: UIStoryboard) -> Self {
        return instantiate(from: storyboard, identifier: String(describing: self))
    }
    
    class func instantiate(storyboard name: String) -> Self {
        return instantiate(from: UIStoryboard(name: name, bundle: Bundle(for: self)), identifier: String(describing: self))
    }
    
    class func instantiate() -> Self {
        let className = String(describing: self)
        return instantiate(from: UIStoryboard(name: className, bundle: Bundle(for: self)), identifier: className)
    }
    
    var window: UIWindow? {
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let delegate = windowScene.delegate as? SceneDelegate, let window = delegate.window else { return nil }
        
        return window
    }
    
    func showLoading(){
        ZVProgressHUD.maskType = .black
        ZVProgressHUD.show()
    }
    
    func hideLoading(){
        ZVProgressHUD.dismiss()
    }
    
    func showAlert(alertText : String = "Error", alertMessage : String) {
        let alert = UIAlertController(title: alertText, message: alertMessage, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
