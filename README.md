# NotificationObserver


**NotificationObserver** is the *NSNotificationCenter* wrapper for **Swift3** 🎉.

This will make sure the adding and removing observers to the notification center is automatically managed.
Adding is as simple as creating an object, and removing is as simple as deallocing that object.

#Example

How to declare your notification : (**NotificationApp.swift**)

```Swift
import NotificationObserver

enum NotificationApp {
    case Name
    case UUID
}

extension NotificationApp: NotificationProtocol {
    var name: String {
        get {
            switch self {
            case .Name:
                return "name"
            case .UUID:
                return "uuid"
            }
        }
    }
}
```

Using observe a notification : 

```Swift
import NotificationObserver

class ViewController: UIViewController {

    //the observer will be removed automatically when your UIViewController will be deallocated
    //if you don't use a reference, abviously the observer will be directly deallocated
    private var obs: NotificationObserver<String>!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.obs = NotificationObserver(notification: NotificationApp.UUID, block: { uuid in
            guard let uuid = uuid else {
                return
            }
            print("suuid : \(uuid)")
        })
    }
}
```

Post a notification somewhere : 

```Swift
NotificationApp.UUID.post(UUID().uuidString)
```
