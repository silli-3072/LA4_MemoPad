//
//  MemoViewController.swift
//  MemoPad
//
//  Created by 春田実利 on 2022/08/11.
//

import UIKit

class MemoViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var titleTextField: UITextField!
    @IBOutlet var contentTextView: UITextView!
    
    let saveDate: UserDefaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleTextField.text = saveDate.object(forKey: "title") as? String
        contentTextView.text = saveDate.object(forKey: "content") as? String
        
        titleTextField.delegate = self
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveButton(){
        saveDate.set(titleTextField.text, forKey: "title")
        saveDate.set(contentTextView.text, forKey: "content")
        
        let alert: UIAlertController = UIAlertController(title: "保存", message: "メモの保存が完了しました。", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default,handler: { action in
            self.navigationController?.popViewController(animated: true)
            print("OKボタンが押されました！")
        }))
        
        present(alert, animated: true,completion: nil)
        
    }
    
    func textFieldShouldReturn(_ textFiled: UITextField) -> Bool {
        textFiled.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        titleTextField.text = titleTextField.text
        self.view.endEditing(true)
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
