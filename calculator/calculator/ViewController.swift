import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var trial: UILabel!
    
    var result = 0
    var firstNumber = 0
    var secondNumber = 0
    
    @IBAction func generation(_ sender: UIButton) { // кнопка "сгенерировать пример"
        numberGeneration()
    }
    
    @IBOutlet weak var resultView: UILabel! // поле пользователя
    
    @IBAction func buttons(_ sender: UIButton) { // кнопки чисел
        if sender.tag == 10 {
            resultView.text! = ""
        }
        else {
            resultView.text! = resultView.text! + String(sender.tag)
        }
    }
    
    
    @IBAction func check(_ sender: UIButton) {
        
        if resultView.text! == "0" {
            choice(firstString: "Сначала сгенерируйте пример", secondString: nil)
            resultView.text = ""
        }
        
        else if let check = Int(resultView.text!) { // если поле кнопки не пустое, то выполняется следующее условие
            if check == result {
                choice(firstString: "Ответ", secondString: "Боже, спасибо тебе за Настю!")
                resultView.text = ""
                numberGeneration()
                
            }
            
            else {
                choice(firstString: "Ответ", secondString: "давай сделаем вид, что я ничего не видел...")
                resultView.text = ""
            }
        }
        
        else if resultView.text == nil {
            choice(firstString: "Сначала решите пример", secondString: nil)
        }
        
    }
    
    func choice (firstString: String?, secondString: String?) {
        let alertController = UIAlertController(title: firstString, message: secondString, preferredStyle: UIAlertController.Style.alert)
        alertController.addAction(UIAlertAction(title: "Продолжить", style: UIAlertAction.Style.default, handler: nil))
        self.present(alertController, animated: true, completion: nil)
    }
    
    func numberGeneration() { //генерация чисел и осуществление текста
        
        firstNumber = Int.random(in: 0..<100)
        secondNumber = Int.random(in: 0..<100)
        result = firstNumber + secondNumber
        trial.text! = ("\(firstNumber) + \(secondNumber)")
    }
    
    @IBAction func deleteButtons(_ sender: UIButton) {
        if (resultView.text! != "") {
            resultView.text!.remove(at: resultView.text!.index(before: resultView.text!.endIndex))
        }
        else {
            resultView.text! = ""
        }
    }
}



