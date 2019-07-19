//
//  ProgramacaoViewController.swift
//  RadioUFT
//
//  Created by Paulo Atavila on 07/12/17.
//  Copyright © 2017 Paulo Atavila. All rights reserved.
//

import UIKit

class ProgramacaoViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    @IBAction func okBtt(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    var dia = ""
    var mes = ""
    var ano = ""
    var horas = ""
    var minutos = ""
    
    var programas = [Programa]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
        tableView.allowsSelection = false
        
        // Necessario para recuperação do JSON com a programação
        dataUsuario()
        
        //programacao
        downloadProgramacaoJSON()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return programas.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 515
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "programaCell", for: indexPath)
        
        if let programaCell = cell as? ProgramaTableViewCell{
            let progAtual = programas[indexPath.row]
            programaCell.nomeProgramaLabel.text = progAtual.nome
            programaCell.dataLabel.text = progAtual.dataFormatada
            if progAtual.descricao == nil {
                programaCell.descricaoLabel.text = "Sem descrição."
            } else {
                programaCell.descricaoLabel.text = progAtual.descricao
            }
            if progAtual.imagem != nil {
                get_image("https://sistemas.uft.edu.br/agenda/arquivos/\(progAtual.imagem!)", programaCell.img)
            } else {
                programaCell.img.image = UIImage(named: "uftfm")
            }
            
            return programaCell
        }
        return cell
    }
    
    func get_image(_ url_str:String, _ imageView:UIImageView){
        
        let url:URL = URL(string: url_str)!
        let session = URLSession.shared
        
        let task = session.dataTask(with: url, completionHandler: {(data, response, error) in
            if data != nil{
                let image = UIImage(data: data!)
                if(image != nil){
                    DispatchQueue.main.async(execute: {
                        imageView.image = image
                        imageView.alpha = 0
                        UIView.animate(withDuration: 0.3, animations: {imageView.alpha = 1.0})
                    })
                }
            }
        })
        task.resume()
    }
    
    func dataUsuario(){
        let data = NSDate()
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        
        let dataString = dateFormatter.string(from: data as Date)
        
        let fullData = dataString.components(separatedBy: " ")
        let dataCompleta = fullData[0]
        let horaCompleta = fullData[1]
        
        let stringData = dataCompleta.components(separatedBy: "-")
        dia = stringData[2]
        mes = stringData[1]
        ano = stringData[0]
        
        let stringHora = horaCompleta.components(separatedBy: ":")
        horas = stringHora[0]
        minutos = stringHora[1]
    }
    
    func downloadProgramacaoJSON(){
        //Json
        // Set up the URL request
        let todoEndpoint: String = "https://sistemas.uft.edu.br/agenda/fullcalendar?o=1&a[]=34&start="+"\(ano)-\(mes)-\(dia)"+"&end="+"\(ano)-\(mes)-\(dia)"
        guard let url = URL(string: todoEndpoint) else {
            print("Error: cannot create URL")
            return
        }
        let urlRequest = URLRequest(url: url)
        
        // set up the session
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        
        // make the request
        let task = session.dataTask(with: urlRequest) {
            (data, response, error) in
            // check for any errors
            guard error == nil else {
                print(error!)
                return
            }
            // make sure we got data
            guard let responseData = data else {
                print("Error: did not receive data")
                return
            }
            // parse the result as JSON, since that's what the API provides
            do {
                guard let programacaoJSON = try JSONSerialization.jsonObject(with: responseData, options: []) as? [AnyObject] else {
                    print("error trying to convert data to JSON 1")
                    return
                }
                
                print("tamanho: \(programacaoJSON.count)")
                
                var id = 0
                var nome = ""
                var descricao: String?
                var imagem: String?
                var inicio = ""
                var fim = ""
                var dataFormatada = ""
                
                for j in 0...programacaoJSON.count-1{
                    if let programa = programacaoJSON[j] as? [String: Any]{
                        if let nomePrograma = programa["title"] as? String{
                            nome = nomePrograma
                        }
                        if let idPrograma = programa["id"] as? Int{
                            id = idPrograma
                        }
                        if let dataFormatadaPrograma = programa["quando"] as? String{
                            dataFormatada = dataFormatadaPrograma
                        }
                        if let descricaoPrograma = programa["descricao"] as? String{
                            descricao = descricaoPrograma.html2String
                        } else {
                            descricao = nil
                        }
                        if let imagemPrograma = programa["imagem"] as? String{
                            imagem = imagemPrograma
                        } else {
                            imagem = nil
                        }
                        if let inicioPrograma = programa["start"] as? String{
                            inicio = inicioPrograma
                        }
                        if let fimPrograma = programa["end"] as? String{
                            fim = fimPrograma
                        }
                        self.programas.append(Programa(id: id, nome: nome, descricao: descricao, imagem: imagem, inicio: inicio, fim: fim, dataFormatada: dataFormatada))
                    }
                }
                /*
                 "id": 3852,
                 "title": "Viva Jazz",
                 "allDay": false,
                 "quando": "05/12/2017 das 22:00 às 23:00",
                 "descricao": "<p>Os maiores artistas do Jazz, voc&ecirc; encontra aqui. Apresenta&ccedil;&atilde;o: Michel Assun&ccedil;&atilde;o.</p>",
                 "local": null,
                 "imagem": "20171026153827_5476185067e2b0e9e7afb32ed5e5a388.png",
                 "urlAnexo": null,
                 "setoresResponsaveis": null,
                 "contatoTelefone": null,
                 "contatoEmail": null,
                 "start": "2017-12-05T22:00:00",
                 "end": "2017-12-05T23:00:00"
                 */
                self.ordenarProgramas()
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } catch  {
                print("error trying to convert data to JSON 2")
                return
            }
        }
        task.resume()
    }
    
    func ordenarProgramas(){
        programas = programas.sorted(by: {$0.inicio.compare($1.inicio) == .orderedAscending})
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension Data {
    var html2AttributedString: NSAttributedString? {
        do {
            return try NSAttributedString(data: self, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch {
            print("error:", error)
            return  nil
        }
    }
    var html2String: String {
        return html2AttributedString?.string ?? ""
    }
}

extension String {
    var html2AttributedString: NSAttributedString? {
        return Data(utf8).html2AttributedString
    }
    var html2String: String {
        return html2AttributedString?.string ?? ""
    }
}
