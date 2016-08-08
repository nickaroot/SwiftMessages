//
//  MessageView.swift
//  SwiftMessages
//
//  Created by Timothy Moose on 7/30/16.
//  Copyright © 2016 SwiftKick Mobile LLC. All rights reserved.
//

import UIKit

public class MessageView: UIView, Identifiable, MarginAdjustable {

    /*
     MARK: - IB outlets
     */
    
    @IBOutlet public var titleLabel: UILabel?
    @IBOutlet public var bodyLabel: UILabel?
    @IBOutlet public var iconImageView: UIImageView?
    @IBOutlet public var iconLabel: UILabel?
    @IBOutlet public var button: UIButton?
    @IBOutlet public var contentView: UIView?
    @IBOutlet public var backgroundView: UIView?
    
    /*
     MARK: - Creating message views
     */
    
    public enum Layout: String {
        case MessageView = "MessageView"
        case StatusLine = "StatusLine"
    }
    
    public static func viewFromNib(layout layout: Layout, bundle: NSBundle? = nil) -> MessageView {
        return try! MessageView.viewFromNib(named: layout.rawValue, bundle: bundle)
    }
    
    /*
     MARK: - Configuring the theme
     */

    public func configureErrorTheme() {
        iconImageView?.image = Icon.Error.image
        iconLabel?.text = nil
        iconImageView?.tintColor = UIColor.whiteColor()
        let backgroundView = self.backgroundView ?? self
        backgroundView.backgroundColor = UIColor(red: 249.0/255.0, green: 66.0/255.0, blue: 47.0/255.0, alpha: 1.0)
        iconLabel?.textColor = UIColor.whiteColor()
        titleLabel?.textColor = UIColor.whiteColor()
        bodyLabel?.textColor = UIColor.whiteColor()
    }
    
//    public func configureWarningTheme() {
//        
//    }
//    
//    public func configureInfoTheme() {
//        backgroundColor = UIColor.lightGrayColor()
//        bodyLabel?.textColor = UIColor.darkTextColor()
//    }

    /*
     MARK: - Configuring the content
     */

    public func configureContent(body body: String) {
        bodyLabel?.text = body
    }
    
    public func configureContent(title title: String, body: String) {
        configureContent(body: body)
        titleLabel?.text = title
    }
    
    public func configureContent(title title: String, body: String, iconImage: UIImage) {
        configureContent(title: title, body: body)
        iconImageView?.image = iconImage
        iconLabel?.text = nil
    }

    public func configureContent(title title: String, body: String, iconText: String) {
        configureContent(title: title, body: body)
        iconImageView?.image = nil
        iconLabel?.text = iconText
    }

    public func configureContent(title title: String?, body: String?, iconImage: UIImage?, iconText: String?, buttonImage: UIImage?, buttonTitle: String?, buttonHandler: (() -> Void)?) {
        titleLabel?.text = title
        bodyLabel?.text = body
        iconImageView?.image = iconImage
        iconLabel?.text = iconText
        button?.setImage(buttonImage, forState: .Normal)
        button?.setTitle(buttonTitle, forState: .Normal)
        // TODO set button tap handler
    }    

    /*
     MARK: - Initialization
     */
    
    public override func awakeFromNib() {
        backgroundColor = UIColor.clearColor()
        layoutMargins = UIEdgeInsetsZero
    }
    
    /*
     MARK: - Identifiable
     */
    
    public var id: String {
        return "MessageView:title=\(titleLabel?.text), body=\(bodyLabel?.text)"
    }
    
    /*
     MARK: - MarginAdjustable
     */
    
    @IBInspectable public var bounceAnimationOffset: CGFloat = 5.0
    
    @IBInspectable public var statusBarOffset: CGFloat = 20.0
}