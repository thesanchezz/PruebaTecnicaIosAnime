# Prueba Técnica iOS Dev por (Cristian Sanchez).
### Swift V.5 - Xcode 13.0

<h2 align="left">
  Anime App
</h2>

<p align="left">
  GitHub iOS client, in VIPER.
</p>

## Basic, App Features
- [x] anime interface via api [Jikan](https://jikan.docs.apiary.io/#reference)

* **App**
- [x] Home
- [x] Serach
- [x] Detalle

## Technologies
- [x] Xcode
- [x] Swift, architecture (VIPER)
- [x] third-party dependency managers ([Cocoapods](https://cocoapods.org/))

## Tools
- [x] [ObjectMapper](https://github.com/tristanhimmelman/ObjectMapper) - ObjectMapper is a framework written in Swift that makes it easy for you to convert your model objects (classes and structs) to and from JSON.
- [x] [Alamofire](https://github.com/Alamofire/Alamofire) - Alamofire is an HTTP networking library written in Swift.
- [x] [SkeletonView](https://github.com/Juanpe/SkeletonView) - Has been conceived to address this need, an elegant way to show users that something is happening and also prepare them for which contents are waiting.
- [x] [SDWebImage](https://github.com/SDWebImage/SDWebImage) - This library provides an async image downloader with cache support.
- [x] [Actions](https://github.com/ManueGE/Actions/) - Actions provides a set of extensions to add closures to.

## Communication layers VIPER
![alt text](https://github.com/thesanchezz/PruebaTecnicaIosAnime/blob/main/grafico-viper.png?raw=true)

- [x] VIPER Layered communication using protocols

```swift
// MARK: - Router Protocol
protocol ModuleRouterProtocol {
    var entry: EntryPointModule? { get }
    
    static func createModule() -> ModuleRouterProtocol
    
    //Presenter -> Router
    func presentModule(to destination: UIViewController?)
}

// MARK: - View Protocol
protocol ModuleViewProtocol {
    var presenter: ModulePresenterProtocol? { get set }
    
    // PRESENTER -> VIEW
    func update()
}

// MARK: - Interactor Protocol
protocol ModuleInteractorProtocol {
    var presenter: ModulePresenterProtocol? { get set }
    
    // PRESENTER -> INTERACTOR
    func getData()
}

// MARK: - Presenter Protocol
protocol ModulePresenterProtocol {
    var router: ModuleRouterProtocol? { get set }
    var interactor: ModuleInteractorProtocol? { get set }
    var view: ModuleViewProtocol? { get set }
    
    // VIEW -> PRESENTER
    func loadData()
    
    // INTERACTOR -> PRESENTER
    func resultData(with result: Result<dataEntitie, Error>)
}
```
