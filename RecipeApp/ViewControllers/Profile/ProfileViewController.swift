//
//  ProfileViewController.swift
//  RecipeApp
//
//  Created by Cesar Cavazos on 10/15/17.
//  Copyright © 2017 The Recipe App. All rights reserved.
//

import UIKit
import Parse
import iCarousel

class ProfileViewController: UIViewController {

    @IBOutlet var profileImageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var displayScreen: UILabel!
    @IBOutlet var recipiesCountLabel: UILabel!
    @IBOutlet var complimentsCountLabel: UILabel!
    @IBOutlet var followersCountLabel: UILabel!
    @IBOutlet var cookbooksCountLabel: UILabel!
    
    @IBOutlet var cookbooksCollectionView: UICollectionView!
    @IBOutlet var topRecipiesView: iCarousel!
    
    var recipies: [Recipe] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cookbooksCollectionView.dataSource = self
        cookbooksCollectionView.delegate = self
        
        topRecipiesView.dataSource = self
        topRecipiesView.delegate = self
        topRecipiesView.viewpointOffset = CGSize(width: 95, height: 0)

        // TODO: Change this to another user
        let currentUser = User.current()
        displayScreen.text = "@\(currentUser?.username ?? "NA")"
        recipiesCountLabel.text = "12"
        complimentsCountLabel.text = "1000"
        followersCountLabel.text = "188"
        cookbooksCountLabel.text = "12"
        if currentUser!["firstName"] == nil {
            if currentUser!["lastName"] == nil {
                nameLabel.text = "@\(currentUser?.username ?? "NA")"
            } else {
                nameLabel.text = "\(currentUser!["lastName"])"
            }
        } else {
            if currentUser!["lastName"] == nil {
                nameLabel.text = "\(currentUser!["firstName"])"
            } else {
                nameLabel.text = "\(currentUser!["firstName"]) \(currentUser!["lastName"])"
            }
        }
        
        fetchTopRecipes()
        
        // TODO: If this is another user, hide the edit and the logout button
    }
    
    func fetchTopRecipes() {
        let query = PFQuery(className: "Recipe")
        query.order(byDescending: "likes")
        query.limit = 5
        // TODO: Add filter by user
        query.findObjectsInBackground(block: { (objects: [PFObject]?, error: Error?) in
            if error == nil {
                // Recipies founds
                print("Successfully retrieved \(objects!.count) recipes.")
                // Do something with the found objects
                self.recipies = objects as! [Recipe]
                self.topRecipiesView.reloadData()
            }
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func showPhotoPicker(type: UIImagePickerControllerSourceType) {
        let imagePickerViewController = UIImagePickerController()
        imagePickerViewController.delegate = self
        imagePickerViewController.allowsEditing = true
        imagePickerViewController.sourceType = type
        present(imagePickerViewController, animated: true, completion: nil)
    }
    
    func displayProfilePicture(image: UIImage) {
        
        let resizeRenderImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 120, height: 120))
        resizeRenderImageView.layer.cornerRadius = 60
        resizeRenderImageView.layer.borderColor = UIColor.white.cgColor
        resizeRenderImageView.layer.borderWidth = 1.0
        resizeRenderImageView.contentMode = .scaleAspectFit
        resizeRenderImageView.image = image
        
        UIGraphicsBeginImageContext(resizeRenderImageView.frame.size)
        resizeRenderImageView.layer.render(in: UIGraphicsGetCurrentContext()!)
        let thumbnail = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        profileImageView.layer.cornerRadius = 60
        profileImageView.image = thumbnail
        profileImageView.clipsToBounds = true
        profileImageView.isHidden = false
        // TODO: Add a little animation to show the profile picture
    }
    
    func saveProfilePicture(image: UIImage) {
        let imageFile = PFFile(data: UIImagePNGRepresentation(image)!)
        imageFile?.saveInBackground()
        // TODO: Change this when there is a new issue
        let currentUser = PFUser.current()
        currentUser?["profileImage"] = imageFile
        currentUser?.saveInBackground()
    }
    
    func recipeTapped(tapGestureRecognizer: UITapGestureRecognizer) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let recipeDetailVC = storyboard.instantiateViewController(withIdentifier: "RecipeViewController") as! RecipeViewController
        let recipeView = tapGestureRecognizer.view as! RecipeBlockView
        recipeDetailVC.recipeBlockView = recipeView
        self.navigationController?.pushViewController(recipeDetailVC, animated: true)
    }
    
    @IBAction func onClose(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func onLogout(_ sender: UIButton) {
        PFUser.logOut()
        let storyboard = UIStoryboard(name: "Login", bundle: nil)
        let vc = storyboard.instantiateInitialViewController() as! UINavigationController
        self.present(vc, animated: false, completion: nil)
    }
    
    @IBAction func onFilterChange(_ sender: UISegmentedControl) {
        
    }
    
    @IBAction func onAddProfilePicture(_ sender: UIButton) {
        let actionSheet = UIAlertController(title: "Set your profile picture", message: nil, preferredStyle: .actionSheet)
        
        // Make sure the simulator does not show the camera option
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera) {
            let cameraAction = UIAlertAction(title: "Camera", style: .default) { (action) in
                self.showPhotoPicker(type: UIImagePickerControllerSourceType.camera)
            }
            actionSheet.addAction(cameraAction)
        }
        
        let photoLibraryAction = UIAlertAction(title: "Photo Library", style: .default) { (action) in
            self.showPhotoPicker(type: UIImagePickerControllerSourceType.photoLibrary)
        }
        actionSheet.addAction(photoLibraryAction)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
            
        }
        actionSheet.addAction(cancelAction)
        
        present(actionSheet, animated: true, completion: nil)
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

extension ProfileViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
    }
}

extension ProfileViewController: iCarouselDelegate, iCarouselDataSource {
    func numberOfItems(in carousel: iCarousel) -> Int {
        return recipies.count
    }
    
    func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView {
        let recipeView = RecipeBlockView(frame: CGRect(x: 0, y: 0, width: 172, height: 172))
        let recipe = self.recipies[index]
        let recipeImageFile = recipe.image
        if recipeImageFile != nil {
            recipeImageFile?.getDataInBackground(block: { (imageData: Data?, error: Error?) in
                if error == nil {
                    if let imageData = imageData {
                        let image = UIImage(data:imageData)
                        recipeView.image = image
                    }
                }
            })
        }
        
        recipeView.recipeId = recipe.objectId
        recipeView.imgTag = "INDIAN"
        recipeView.owner = PFUser.current()?.username
        recipeView.title = recipe.name
        recipeView.isUserInteractionEnabled = true
        
        let recipeTapRecognizer = UITapGestureRecognizer(target: self, action: #selector(ProfileViewController.recipeTapped(tapGestureRecognizer:)))
        recipeView.addGestureRecognizer(recipeTapRecognizer)
        
        return recipeView
    }
    
    func carousel(_ carousel: iCarousel, valueFor option: iCarouselOption, withDefault value: CGFloat) -> CGFloat {
        if (option == iCarouselOption.spacing) {
            return value * 1.05
        }
        return value
    }
    
    
}

extension ProfileViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let editedImage = info[UIImagePickerControllerEditedImage] as! UIImage
        displayProfilePicture(image: editedImage)
        saveProfilePicture(image: editedImage)
        dismiss(animated: true, completion: nil)
    }
}
