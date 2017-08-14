//
//  TutorialModel.swift
//  ZYTutorialView
//
//  Created by Jason Fan on 14/08/2017.
//  Copyright © 2017 QooApp. All rights reserved.
//

import UIKit

public enum LineDirection {
    case up
    case down
    case left
    case right
    case leftDown
    case rightDown
}

class TutorialModel {
    var centerPoint: CGPoint?
    var title: String?
    var towards: LineDirection?
    var radius: CGFloat?
    var size: CGSize?
}
