//
//  SectionProtocol.swift
//  Mealtime
//
//  Created by Madison Waters on 10/30/18.
//  Copyright © 2018 Jonah Bergevin. All rights reserved.
//

import Foundation

protocol ProfileViewModelItem {
    //var type: ProfileViewModelItemType { get }
    var sectionTitle: String { get }
    var rowCount: Int { get }
    var isCollapsible: Bool { get }
    var isCollapsed: Bool { get set }
}

extension ProfileViewModelItem {
    var rowCount: Int {
        return 1
    }
    
    var isCollapsible: Bool {
        return true
    }
}

class ProfileViewModelNamePictureItem: ProfileViewModelItem {
    var sectionTitle: String = ""
    
    var isCollapsed = true
}
