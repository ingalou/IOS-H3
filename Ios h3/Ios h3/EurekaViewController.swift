//
//  EurekaViewController.swift
//  Ios h3
//
//  Created by thomas on 28/11/2018.
//  Copyright © 2018 Ingal Prudente Cornier. All rights reserved.
//

import UIKit
import Eureka

class EurekaViewController: FormViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        createForm()

        // Do any additional setup after loading the view.
    }
    
    func createForm() {
    form +++ Section()
        <<< TextRow("nameRow"){
            $0.placeholder = "Nom"
        }
        <<< TextRow("addressRow"){
            $0.placeholder = "Adresse"
        }
        <<< TextRow("cityRow"){
            $0.placeholder = "Ville"
        }
        <<< TextRow("latitudeRow"){
            $0.placeholder = "Latitude"
        }
        <<< TextRow("longitudeRow"){
            $0.placeholder = "Longitude"
        }
        <<< StepperRow("hygieneRow"){
            $0.title = "Note hygiène"
            $0.displayValueFor = { value in
                guard let value = value else {
                    return nil
                }
                return "\(Int(value))"
            }
            $0.cell.stepper.stepValue = 1
            $0.cell.stepper.minimumValue = 0
            $0.cell.stepper.maximumValue = 5
        }
        <<< StepperRow("accueilRow"){
            $0.title = "Note accueil"
            $0.displayValueFor = { value in
                guard let value = value else {
                    return nil
                }
                return "\(Int(value))"
            }
            $0.cell.stepper.stepValue = 1
            $0.cell.stepper.minimumValue = 0
            $0.cell.stepper.maximumValue = 5
        }
        <<< StepperRow("sauceRow"){
            $0.title = "Note sauce"
            $0.displayValueFor = { value in
                guard let value = value else {
                    return nil
                }
                return "\(Int(value))"
            }
            $0.cell.stepper.stepValue = 1
            $0.cell.stepper.minimumValue = 0
            $0.cell.stepper.maximumValue = 5
        }
        <<< StepperRow("viandeRow"){
            $0.title = "Note viande"
            $0.displayValueFor = { value in
                guard let value = value else {
                    return nil
                }
                return "\(Int(value))"
            }
            $0.cell.stepper.stepValue = 1
            $0.cell.stepper.minimumValue = 0
            $0.cell.stepper.maximumValue = 5
        }
        <<< StepperRow("friteRow"){
            $0.title = "Note frite"
            $0.displayValueFor = { value in
                guard let value = value else {
                    return nil
                }
                return "\(Int(value))"
            }
            $0.cell.stepper.stepValue = 1
            $0.cell.stepper.minimumValue = 0
            $0.cell.stepper.maximumValue = 5
        }
        <<< StepperRow("painRow"){
            $0.title = "Note pain"
            $0.displayValueFor = { value in
                guard let value = value else {
                    return nil
                }
                return "\(Int(value))"
            }
            $0.cell.stepper.stepValue = 1
            $0.cell.stepper.minimumValue = 0
            $0.cell.stepper.maximumValue = 5
        }
        <<< StepperRow("cruditeRow"){
            $0.title = "Note crudités"
            $0.displayValueFor = { value in
                guard let value = value else {
                    return nil
                }
                return "\(Int(value))"
            }
            $0.cell.stepper.stepValue = 1
            $0.cell.stepper.minimumValue = 0
            $0.cell.stepper.maximumValue = 5
        }
        
        <<< StepperRow("quantiteRow"){
            $0.title = "Note quantité"
            $0.displayValueFor = { value in
                guard let value = value else {
                    return nil
                }
                return "\(Int(value))"
            }
            $0.cell.stepper.stepValue = 1
            $0.cell.stepper.minimumValue = 0
            $0.cell.stepper.maximumValue = 5
        }
        
        <<< StepperRow("qualitePrixRow"){
            $0.title = "Note qualité / prix"
            $0.displayValueFor = { value in
                guard let value = value else {
                    return nil
                }
                return "\(Int(value))"
            }
            $0.cell.stepper.stepValue = 1
            $0.cell.stepper.minimumValue = 0
            $0.cell.stepper.maximumValue = 5
        }
       
        <<< ButtonRow("Add"){
            $0.title = "Ajouter le grec"
            }.onCellSelection({ (cell, row) in
                
                print(self.form.values())
                self.dismiss(animated: true, completion: nil)
            })
        <<< ButtonRow("cancel"){
            $0.title = "Annuler"
            }.cellUpdate({ (cell, row) in
                
                cell.textLabel?.textColor = .red
            }).onCellSelection({ (cell, row) in
                
                self.dismiss(animated: true, completion: nil)
            })
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
