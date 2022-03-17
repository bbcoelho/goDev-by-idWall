import UIKit

class CategoriesViewController: UIViewController {
    
    @IBOutlet weak var collectionView : UICollectionView!
    
    private var cities: [PersonData] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        title = "Categorias"
        
        delegates()
        registerCells()
        setupLayout()
        createData()
    }

    private func delegates() {
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    private func registerCells() {
        let nibA = UINib(nibName: CustomCollectionViewCell.identifier, bundle: nil)
        collectionView.register(nibA, forCellWithReuseIdentifier: CustomCollectionViewCell.identifier)
    }
    
    private func setupLayout() {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: view.frame.size.width / 2 - 12, height: 168)
        layout.minimumLineSpacing = 12
        collectionView.collectionViewLayout = layout
    }
    
    private func createData() {
        cities = [.init(cityImage: "Brasilia", cityName: "Brasilia", personName: "Renato"),
                  .init(cityImage: "Brasilia2", cityName: "Brasilia", personName: "Renato"),
                  .init(cityImage: "Brasilia3", cityName: "Brasilia", personName: "Renato"),
                  .init(cityImage: "Fortaleza", cityName: "Fortaleza", personName: "Bruno Oliveira"),
                  .init(cityImage: "Fortaleza2", cityName: "Fortaleza", personName: "Bruno Oliveira"),
                  .init(cityImage: "Fortaleza3", cityName: "Fortaleza", personName: "Bruno Oliveira"),
                  .init(cityImage: "Taquaritinga", cityName: "Taquaritinga", personName: "Alison"),
                  .init(cityImage: "Taquaritinga2", cityName: "Taquaritinga", personName: "Alison"),
                  .init(cityImage: "Taquaritinga3", cityName: "Taquaritinga", personName: "Alison"),
                  .init(cityImage: "Recife", cityName: "Recife", personName: "Jady"),
                  .init(cityImage: "Recife2", cityName: "Recife", personName: "Jady"),
                  .init(cityImage: "Recife3", cityName: "Recife", personName: "Jady"),
                  .init(cityImage: "Varginha", cityName: "Varginha", personName: "Bruno Coelho"),
                  .init(cityImage: "Varginha2", cityName: "Varginha", personName: "Bruno Coelho"),
                  .init(cityImage: "Varginha3", cityName: "Varginha", personName: "Bruno Coelho")]
    }
}

// Collection Cells
extension CategoriesViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cities.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.identifier, for: indexPath) as? CustomCollectionViewCell else { return UICollectionViewCell() }
        
        cell.setup(imageSource: cities[indexPath.row].cityImage, name: cities[indexPath.row].cityName)
        
        return cell
    }
}

extension CategoriesViewController: UICollectionViewDelegateFlowLayout {
    
}
