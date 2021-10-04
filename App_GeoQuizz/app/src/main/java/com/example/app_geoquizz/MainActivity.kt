package com.example.app_geoquizz

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.Button
import android.widget.TextView
import android.widget.Toast
import java.util.ArrayList

class MainActivity : AppCompatActivity() {
    lateinit var questions: ArrayList<Question>
    var position = 0
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
        loadQuestions()
        setupViews()
    }

    private fun loadQuestions() {
        questions = ArrayList()
        var question = Question("¿Es Lima la capital de Chile?",false)
        questions.add(question)
        questions.add(Question("¿Es Lima la capital de Peru?",true))
        questions.add(Question("¿Es Quito la capital de Peru?",false))
        questions.add(Question("¿Es Santiago la capital de Peru?",false))
        questions.add(Question("¿Es Santiago la capital de Chile?",true))
        questions.add(Question("¿Es Ls Paz la capital de Bolivia?",true))
    }

    fun setupViews(){
        val btYes = findViewById<Button>(R.id.btYes)
        val btNo = findViewById<Button>(R.id.btNo)
        val tvSentence=findViewById<TextView>(R.id.tvSentence)
        val btNext = findViewById<Button>(R.id.btNext)

        tvSentence.text = questions[0].sentence

        btYes.setOnClickListener{
            if(questions[position].answer){
                Toast.makeText(this, "Correcto",Toast.LENGTH_LONG).show()
            }
            else{
                Toast.makeText(this, "Incorrecto",Toast.LENGTH_LONG).show()
            }
        }
        btNo.setOnClickListener{
            if(!questions[position].answer){
                Toast.makeText(this, "Correcto",Toast.LENGTH_LONG).show()
            }
            else{
                Toast.makeText(this, "Incorrecto",Toast.LENGTH_LONG).show()
            }
        }
        btNext.setOnClickListener{
            position++
            tvSentence.text = questions[position].sentence
        }
    }
}