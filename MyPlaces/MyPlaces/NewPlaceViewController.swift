//
//  NewPlaceViewController.swift
//  MyPlaces
//
//  Created by Brunya on 04.02.2021.
//

import UIKit

class NewPlaceViewController: UITableViewController {
    
    @IBOutlet weak var placeImage: UIImageView!
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var placeOfName: UIStackView!
    @IBOutlet weak var placeOfLocation: UILabel!
    @IBOutlet weak var placeOfType: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
        
        saveButton.isEnabled = false

       
    }
    // MARK: Table view delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: . actionSheet)
            
            let camera = UIAlertAction(title: "Camera", style: .default){ _ in
                self.chooseImagePicker(source: .camera)
            }
            let photo = UIAlertAction(title: "Photo", style: .default){ _ in
                self.chooseImagePicker(source: .photoLibrary)
            }
            let cancel = UIAlertAction(title: "Cancel", style: .cancel)
        
               
                actionSheet.addAction(camera)
                actionSheet.addAction(photo)
                actionSheet.addAction(cancel)
                
                present(actionSheet, animated: true)
                
            } else  {
               view.endEditing(true)
        }
    }
}

           extension NewPlaceViewController: UITextFieldDelegate {
    
    // скрываем коаву по нажатию done
           func textFeildShouldReturn( textFeild: UITextField) -> Bool {
        
           textFeild.resignFirstResponder()
            return true
        
        
    }
}

//MARC: work with image

extension NewPlaceViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func chooseImagePicker(source: UIImagePickerController.SourceType) {
        
        if UIImagePickerController.isSourceTypeAvailable(source) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.allowsEditing = true
            imagePicker.sourceType = source
            present(imagePicker, animated: true)
        }
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            placeImage.image = info[.editedImage] as? UIImage
            placeImage.contentMode = .scaleAspectFit
            placeImage.clipsToBounds = true
            dismiss(animated: true)
        }
    }
}
