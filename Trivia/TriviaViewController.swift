//
//  TriviaViewController.swift
//  Trivia
//
//  Created by Majd Alsehnawi on 3/12/25.
//

import UIKit

class TriviaViewController: UIViewController {

    @IBOutlet weak var questionNum: UILabel!
    @IBOutlet weak var questionotheme: UILabel!
    @IBOutlet weak var questionContent: UILabel!
    @IBOutlet weak var buttonOne: UIButton!
    @IBOutlet weak var buttonTwo: UIButton!
    @IBOutlet weak var buttonThree: UIButton!
    @IBOutlet weak var buttonFour: UIButton!
    
    
    enum Theme{
        case history
        case science
        case entertainment
        case geography
        
        var desc: String{
            switch self{
            case .entertainment: return "Entertainment"
            case .science: return "Science"
            case .history: return "History"
            case .geography: return "Geography"
            }
        }
    }
    
    struct Question{
        var content: String
        var theme: Theme
        var answers: [String]
        var correctAns: String
    }
    
    var questions: [Question] = [
        Question(
            content: "Who was the first president of the United States?",
            theme: .history,
            answers: ["George Washington", "Thomas Jefferson", "Abraham Lincoln", "John Adams"],
            correctAns: "George Washington"
        ),
        Question(
            content: "In which year did the Berlin Wall fall?",
            theme: .history,
            answers: ["1989", "1991", "1980", "1975"],
            correctAns: "1989"
        ),
        
        Question(
            content: "What is the chemical symbol for water?",
            theme: .science,
            answers: ["H2O", "CO2", "NaCl", "O2"],
            correctAns: "H2O"
        ),
        Question(
            content: "Which planet is known as the Red Planet?",
            theme: .science,
            answers: ["Mars", "Venus", "Jupiter", "Saturn"],
            correctAns: "Mars"
        ),
        
        Question(
            content: "Who is known as the 'King of Pop'?",
            theme: .entertainment,
            answers: ["Michael Jackson", "Elvis Presley", "Prince", "Freddie Mercury"],
            correctAns: "Michael Jackson"
        ),
        Question(
            content: "Which movie won the Academy Award for Best Picture in 1994?",
            theme: .entertainment,
            answers: ["Forrest Gump", "Pulp Fiction", "The Shawshank Redemption", "Four Weddings and a Funeral"],
            correctAns: "Forrest Gump"
        ),
        
        Question(
            content: "What is the capital of France?",
            theme: .geography,
            answers: ["Paris", "Madrid", "Berlin", "Rome"],
            correctAns: "Paris"
        ),
        Question(
            content: "Which continent is home to the Sahara Desert?",
            theme: .geography,
            answers: ["Africa", "Asia", "South America", "Australia"],
            correctAns: "Africa"
        )
]
    
    var currentQuestionNum = 0
    var numberOfQuestions: Int {
            return questions.count
        }
    
    var answersCorrect = 0

    
    override func viewDidLoad() {
        super.viewDidLoad()
        questions.shuffle()
                
        
        var currQuest = questions[currentQuestionNum]
        var buttons = currQuest.answers
        questionNum.text = String(currentQuestionNum+1) + "/" + String(numberOfQuestions)
        questionotheme.text = currQuest.theme.desc
        questionContent.text = currQuest.content
        buttonOne.setTitle(buttons[0], for:.normal )
        buttonTwo.setTitle(buttons[1], for:.normal )
        buttonThree.setTitle(buttons[2], for:.normal )
        buttonFour.setTitle(buttons[3], for:.normal )
        
        
        // Do any additional setup after loading the view.
    }
    
    func setupView(){
        currentQuestionNum+=1
        if (currentQuestionNum == numberOfQuestions){
            let alert = UIAlertController(title: "Quiz Completed", message: "You answered \(answersCorrect) out of \(numberOfQuestions) questions correctly.", preferredStyle: .alert)
                   
                    let okAction = UIAlertAction(title: "OK", style: .default) { _ in
                        
                        
                    }
                    alert.addAction(okAction)
                    present(alert, animated: true, completion: nil)
                    return
        }
        var currQuest = questions[currentQuestionNum]
        var buttons = currQuest.answers
        questionNum.text = String(currentQuestionNum+1) + "/" + String(numberOfQuestions)
        questionotheme.text = currQuest.theme.desc
        questionContent.text = currQuest.content
        buttonOne.setTitle(buttons[0], for:.normal )
        buttonTwo.setTitle(buttons[1], for:.normal )
        buttonThree.setTitle(buttons[2], for:.normal )
        buttonFour.setTitle(buttons[3], for:.normal )
    }
    @IBAction func pressButtonOne(_ sender: Any) {
        var currQuest = questions[currentQuestionNum]
        if (buttonOne.currentTitle == currQuest.correctAns){
            answersCorrect+=1
        }
        setupView()
    }
    
    @IBAction func pressButtonTwo(_ sender: Any) {
        var currQuest = questions[currentQuestionNum]
        if (buttonTwo.currentTitle == currQuest.correctAns){
            answersCorrect+=1
        }
        setupView()
    }
    
    
    @IBAction func pressButtonThree(_ sender: Any) {
        var currQuest = questions[currentQuestionNum]
        if (buttonThree.currentTitle == currQuest.correctAns){
            answersCorrect+=1
        }
        setupView()
    }
    
    
    @IBAction func pressButtonFour(_ sender: Any) {
        var currQuest = questions[currentQuestionNum]
        if (buttonFour.currentTitle == currQuest.correctAns){
            answersCorrect+=1
        }
        setupView()
    }
    
}
