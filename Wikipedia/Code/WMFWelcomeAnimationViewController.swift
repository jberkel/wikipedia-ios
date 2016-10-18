
class WMFWelcomeAnimationViewController: UIViewController {
    var welcomePageType:WMFWelcomePageType = .intro

    lazy var animationView: WMFWelcomeAnimationView = {
        switch self.welcomePageType {
        case .intro:
            return WMFWelcomeIntroductionAnimationView()
        case .languages:
            return WMFWelcomeLanguagesAnimationView()
        case .analytics:
            return WMFWelcomeAnalyticsAnimationView()
        }
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        animationView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(animationView)
        animationView.mas_makeConstraints { make in
            make.top.bottom().leading().and().trailing().equalTo()(self.view)
        }
    }
    
    override func didMoveToParentViewController(parent: UIViewController?) {
        
        // Fix for: http://stackoverflow.com/a/39614714
        view.superview?.layoutIfNeeded()

        animationView.layoutIfNeeded()
        animationView.addAnimationElementsScaledToCurrentFrameSize()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        animationView.beginAnimations()
    }
}
