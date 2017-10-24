import UIKit
import PlaygroundSupport

class controladorTabla:UITableViewController {
    var datos:[String] = []
    var datos2:[String] = []
    
    override func viewDidLoad() {
        datos = ["Uno", "Dos", "Tres", "Cuatro", "Cinco"]
        datos2 = ["Seis", "Siete", "Ocho", "Nueve", "Diez", "Once", "Doce"]
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "celda")
        super.viewDidLoad()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return datos.count
        } else {
            return datos2.count
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = tableView.dequeueReusableCell(withIdentifier: "celda", for: indexPath)
        switch indexPath.section {
        case 0:
            celda.textLabel?.text = datos[indexPath.row]
            celda.imageView?.image = UIImage(named: "Charmander")
        case 1:
            celda.textLabel?.text = datos2[indexPath.row]
            celda.imageView?.image = UIImage(named: "Pikachu")
        default:()
        }
        return celda
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        var cabecera = ""
        switch section {
        case 0: cabecera = "Sección Charmander"
        case 1: cabecera = "Sección Pikachu"
        default:()
        }
        return cabecera
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            print("Has tocado \(datos[indexPath.row])")
        } else {
            print("Has tocado \(datos2[indexPath.row])")
        }
    }
}

let navegacion = UINavigationController(rootViewController: controladorTabla())
PlaygroundPage.current.liveView = navegacion
