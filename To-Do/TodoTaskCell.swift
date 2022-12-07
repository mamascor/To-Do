//
//  TodoTaskCell.swift
//  To-Do
//
//  Created by Marco Mascorro on 12/6/22.
//

import UIKit



class TodoTaskCell : UITableViewCell {
    
    //MARK: - Properties
    
    var initialTitleView: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = .label
        return label
    }()
    
    var TitleView: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .label
        return label
    }()
    
    
    var isDoneView: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .label
        return label
    }()

    
    
    
    
    //MARK: - LifeCycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUserInterface()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - Helpers
    private func configureUserInterface(){
        
        
        
        //Initial title view
        addSubview(initialTitleView)
        initialTitleView.anchor(top: topAnchor, left: leftAnchor, paddingTop: 12, paddingLeft: 12, paddingBottom: 12)
        
        
        //Title View
        addSubview(TitleView)
        TitleView.anchor(top: topAnchor, left: initialTitleView.rightAnchor, paddingTop: 12, paddingLeft: 12)
        
        
        //Isdone view
        addSubview(isDoneView)
        isDoneView.anchor(top: TitleView.bottomAnchor, left: initialTitleView.rightAnchor, paddingTop: 2 , paddingLeft: 12 , paddingBottom: 12)
        
        
    }

    
}
