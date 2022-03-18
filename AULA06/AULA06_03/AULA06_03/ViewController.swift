//
//  ViewController.swift
//  AULA06_03
//
//  Created by SP11601 on 17/03/22.
//

import UIKit

struct SnesGames {
    var logo: String
    var name: String
    var description: String
}

class ViewController: UIViewController {
    
    var games: [SnesGames] = []
    
    @IBOutlet weak var collection: UICollectionView!
    @IBOutlet var descriptionLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        delegates()
        registerCell()
        collectionLayout()
        geraGames()
        
        // OCULTAR A BARRINHA DO SCROLL
        collection.showsVerticalScrollIndicator = false
        
    }

    private func delegates() {
        collection.delegate = self
        collection.dataSource = self
    }
    
    private func geraGames() {
        games = [SnesGames(logo: "Castlevania", name: "Castlevania IV", description: "Super Castlevania IV é um jogo de plataforma da série Castlevania, desenvolvido e publicado pela Konami no Japão e América do Norte em 1991, e na Europa em 1992."), SnesGames(logo: "Contra", name: "Contra III", description: "Contra III: Aliens Wars, é um jogo do console SNES, lançado em 1992 no Japão como Contra Spirits é o terceiro jogo da série Contra da Konami. Foi portado para o Game Boy e Game Boy Advance e lançado para o Virtual Console do Wii em janeiro de 2007. Famoso game do console SNES."), SnesGames(logo: "Donkey", name: "Donkey Kong Country", description: #"Donkey Kong Country é um jogo de plataforma em 2D desenvolvido pela Rare e publicado pela Nintendo para o Super Nintendo Entertainment System. Estrelando o personagem Donkey Kong, o jogo se passa em "Donkey Kong Island" onde é explorado seis regiões com ambientes diferentes, e o enredo gira em torno de Donkey Kong e seu sobrinho Diddy Kong, que devem recuperar seu tesouro de bananas roubado por King K. Rool e os Kremlings."#), SnesGames(logo: "FZero", name: "F-Zero", description: "F-Zero é um jogo eletrônico de corrida desenvolvido pela Nintendo Entertainment Analysis & Development e publicado pela Nintendo. Foi lançado exclusivamente para o Super Nintendo Entertainment System em novembro de 1990 no Japão e em agosto do ano seguinte na América do Norte."), SnesGames(logo: "Megamen", name: "Mega Men 7", description: "Mega Man VII, chamado de Mega Man 7 no site da CAPCOM, na caixa e no manual da versão estadunidense do jogo, é o sétimo episódio da série Mega Man, lançado para Super Nintendo."), SnesGames(logo: "Rrr", name: "Rock'n'Roll Racing", description: "Rock N' Roll Racing é um jogo eletrônico de corrida e de combate de veículos que possui um estilo único para um jogo de 1993."), SnesGames(logo: "SBomber", name: "Super Bomberman", description: "Super Bomberman é um jogo da série Bomberman lançado para Super Famicom. É o primeiro jogo desta série a ser lançado para o console."), SnesGames(logo: "SFighter", name: "Street Fighter II", description: "Street Fighter II: The World Warrior, também conhecido simplesmente por Street Fighter II, é um jogo competitivo de videogame desenvolvido pela Capcom e originalmente lançado para os sistemas de Arcade em 1991. É o segundo jogo da série Street Fighter e a sequência de Street Fighter, jogo lançado em 1987."), SnesGames(logo: "SMario", name: "Super Mario World", description: "Super Mario World, originalmente chamado no Japão de Super Mario Bros. 4, é um jogo eletrônico de plataforma, desenvolvido pela Nintendo Entertainment Analysis & Development e publicado pela Nintendo, em 1990, para o console Super Nintendo Entertainment System."), SnesGames(logo: "Zelda", name: "Zelda", description: "The Legend of Zelda: A Link to the Past, também conhecido como Zelda no Densetsu: Kamigami no Triforce no Japão, é um jogo eletrônico de ação-aventura desenvolvido e publicado pela Nintendo para o Super Nintendo Entertainment System.")]
    }

    
    private func registerCell() {
        let nib = UINib(nibName: itemCollectionViewCell.identifier, bundle: nil)
        collection.register(nib, forCellWithReuseIdentifier: itemCollectionViewCell.identifier)
    }
    
    private func collectionLayout() {
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 180, height: 180)
        // SE FOSSE MUDAR DIRECAO DO SCROLL PARA HORIZONTAL
        // layout.scrollDirection = .horizontal
        
        collection.collectionViewLayout = layout
        
    }

}

extension ViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Selecionado \(games[indexPath.row].name)")
        descriptionLabel.text = games[indexPath.row].description
    }
    
}

extension ViewController: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return games.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: itemCollectionViewCell.identifier, for: indexPath) as? itemCollectionViewCell
        else { return UICollectionViewCell() }
        
        let game = games[indexPath.row]
        
        cell.setup(image: game.logo, label: game.name)
        
        return cell
    }
    
    
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    
}
