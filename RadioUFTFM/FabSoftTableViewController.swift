//
//  FabSoftTableViewController.swift
//  RadioUFT
//
//  Created by Paulo Atavila on 19/04/18.
//  Copyright © 2018 Paulo Atavila. All rights reserved.
//

import UIKit

class FabSoftTableViewController: UITableViewController {
    
    @IBAction func okButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    let texto1 = "Somos estudantes e acreditamos no potencial que a universidade tem de gerar soluções inovadoras e criativas para a população. Buscamos fazer parte de algo que vai além de nós mesmos, queremos o futuro e queremos agora!"
    let texto2 = "A Fábrica de Software é uma iniciativa do Curso de Ciência da Computação da UFT, visando oferecer aos alunos dos cursos vinculados à fábrica, a oportunidade de participarem em atividades de assessoria, consultoria, treinamento e desenvolvimento de soluções nas áreas de Tecnologia da Informação e Comunicação."
    let texto3 = "O objetivo é tanto o desenvolvimento de softwares quanto a ajuda do pequeno e médio empreendedor a implantar processos dentro do conceito de Fábrica de Software, que se caracteriza por apresentar um modelo semelhante a um processo industrial, baseado em forte metodologias ágeis, capaz de produzir e testar o novo software com agilidade e qualidade."

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 1 {
            return 220.0
        } else {
            return 10.0
        }
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "textoCell", for: indexPath)
            if let textoCell = cell as? TextoFSTableViewCell{
                textoCell.textoLabel.text = texto1
                return textoCell
            }
            return cell
        } else if indexPath.row == 1{
            let cell = tableView.dequeueReusableCell(withIdentifier: "imgCell", for: indexPath)
            return cell
        } else if indexPath.row == 2{
            let cell = tableView.dequeueReusableCell(withIdentifier: "textoCell", for: indexPath)
            if let textoCell = cell as? TextoFSTableViewCell{
                textoCell.textoLabel.text = texto2
                return textoCell
            }
            return cell
        } else if indexPath.row == 3{
            let cell = tableView.dequeueReusableCell(withIdentifier: "textoCell", for: indexPath)
            if let textoCell = cell as? TextoFSTableViewCell{
                textoCell.textoLabel.text = texto3
                return textoCell
            }
            return cell
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "textoCell", for: indexPath)
        

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
