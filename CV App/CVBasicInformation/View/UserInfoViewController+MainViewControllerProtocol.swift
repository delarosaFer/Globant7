
import UIKit

extension UserInfoViewController: MainViewControllerProtocol  {
    
    // MARK: - Methods for display information
    /**
     Method to set all the user basic information.
     
     - Parameters:
     - user: Entity UserInfo.
     */
    func showUserInfo(with user: UserInfo) {
        let userInfo = user
        let userName = userInfo.userName
        let imageURL = userInfo.imageURL
        let age = NSLocalizedString(StringKey.age.rawValue, comment: Comment.labelAge.rawValue) + String(userInfo.age)
        let email = NSLocalizedString(StringKey.email.rawValue, comment: Comment.labelEmail.rawValue) + userInfo.email
        let cellphone = NSLocalizedString(StringKey.phone.rawValue, comment: Comment.labelPhone.rawValue) + userInfo.cellphone
        let aboutMySkills = NSLocalizedString(StringKey.skills.rawValue, comment: Default.empty.rawValue) + "\n" + userInfo.skills
        presenter?.getImage(imageURL: imageURL ?? Default.empty.rawValue)
        DispatchQueue.main.async  { [weak self] in
            self?.userNameLabel?.text = userName
            self?.ageLabel?.text = String(age)
            self?.cellphoneLabel?.text = cellphone
            self?.emailLabel?.text = email
            self?.aboutMeLabel?.text = aboutMySkills
        }
    }
    
    /**
     Method that creates the image given a data.
     
     - Parameters:
     - data: data of the image.
     */
    func imageWithData(data: Data){
        DispatchQueue.main.async { [weak self] in
            let image = UIImage(data: data)
            self?.profileUserImage?.image = image
            self?.profileUserImage?.circled()
        }
    }

    /**
     Method that display the alert when occurs an network error.
     */
    func showNetworkingError() {
        let alertTitle = NSLocalizedString(StringKey.titleError.rawValue, comment: Comment.titleError.rawValue)
        let alertMessage = NSLocalizedString(StringKey.messageError.rawValue, comment: Comment.messageError.rawValue)
        DispatchQueue.main.sync { [weak self] in
            AlertView.instance.showAlert(title: alertTitle, message: alertMessage)
            self?.view.addSubview(AlertView.instance.parentView ?? AlertView())
        }
    }
    
    // MARK: - Animation methods

}
