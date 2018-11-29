import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var cityName: UILabel!
    
    var weather: Weather?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cityName.text=weather?.cityName

     }
    

    

}
