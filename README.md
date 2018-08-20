# ZYTutorialView
A view that can show some new features in your app to others. It's flexible than [TutorialView](https://github.com/zhiyuanFan/TutorialView).

# Preview
![image](https://github.com/zhiyuanFan/ZYTutorialView/raw/master/screenshot.gif)

# Usage
```
let models = [TutorialModel]()

let model = TutorialModel()
model.centerPoint = CGPoint(x: screenW/2, y: screenH - 60)
model.radius = 30.0
model.towards = LineDirection.up
model.title = "这是向上的引导效果"
models.append(model)

let model1 = TutorialModel()
model1.centerPoint = CGPoint(x: screenW/2, y: 40)
model1.size = CGSize(width: 100, height: 30)
model1.towards = LineDirection.down
model1.title = "这是向下的引导效果"
models.append(model1)

let tutorialView = ZYTutorialView(models: models)
view.addSubview(tutorialView)
```


# Shape
There are two shape to highlight your item for your tutorial walkthrough: cycle & Rect

ZYTutorialView initialize with an array of TutorialModel. 
 * The shape is Rect when model.size has value. Do not pass a value to radius when you want to show Rect shape.
 
 * The shape is Circle when model.radius has value. Do not pass a value to size when you want to show Circle shape.

# TutorialModel
```
class TutorialModel {
    var centerPoint: CGPoint?
    var radius: CGFloat?
    var towards: LineDirection?
    var title: String?
    var size: CGSize?
}
```

# Direction
```
public enum LineDirection {
    case up
    case down
    case left
    case right
    case leftDown
    case rightDown
}
```

# Dependency
[snapKit](https://github.com/SnapKit/SnapKit) for Auto Layout




