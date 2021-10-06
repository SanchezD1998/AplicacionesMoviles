package com.example.app_shareprefs

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.Button
import android.widget.TextView
import android.widget.Toast
import com.google.android.material.textfield.TextInputEditText
import com.google.android.material.textfield.TextInputLayout

class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        val sharedPreference = SharePreferences(this)

        val btSave = findViewById<Button>(R.id.btSave)
        val etName = findViewById<TextInputEditText>(R.id.etName)
        val btRetrieve = findViewById<Button>(R.id.btRetrieve)
        val tvRetrieve = findViewById<TextView>(R.id.tvRetrieve)

        btSave.setOnClickListener{
            val user = etName.text.toString()
            sharedPreference.save("name", user)

            Toast.makeText(this, "Use stored", Toast.LENGTH_LONG).show()
        }
        btRetrieve.setOnClickListener{
            tvRetrieve.setText(sharedPreference.getValue("name"))
        }
    }
}