//
//  Programa.swift
//  RadioUFT
//
//  Created by Paulo Atavila on 05/12/17.
//  Copyright © 2017 Paulo Atavila. All rights reserved.
//

import Foundation

class Programa{
    var id: Int
    var nome: String
    var descricao: String?
    var imagem: String?
    var inicio: String
    var fim: String
    var dataFormatada: String
    
    init(id: Int, nome: String, descricao: String?, imagem: String?, inicio: String, fim: String, dataFormatada: String){
        self.id = id
        self.nome = nome
        self.descricao = descricao
        self.imagem = imagem
        self.inicio = inicio
        self.fim = fim
        self.dataFormatada = dataFormatada
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
