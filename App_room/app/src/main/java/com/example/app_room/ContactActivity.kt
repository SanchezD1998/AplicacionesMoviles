package com.example.app_room

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.view.Menu
import android.view.MenuInflater
import android.view.MenuItem
import com.google.android.material.textfield.TextInputEditText
import com.google.gson.Gson
import kotlinx.android.synthetic.main.activity_contact.*

class ContactActivity : AppCompatActivity() {
    lateinit var contact: Contact

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_contact)

        loadContact()
    }

    private fun loadContact() {
        val gson = Gson()
        val stringJob = intent.getStringExtra("contact")

        contact = gson.fromJson(stringJob, Contact::class.java) ?: Contact(null, "", "")

        if (contact.id != null){
            etName.setText(contact.name)
            etTelephone.setText(contact.telephone)
        }
    }

    fun saveContact(){
        val etName = findViewById<TextInputEditText>(R.id.etName)
        val etTelephone = findViewById<TextInputEditText>(R.id.etTelephone)

        val name = etName.text.toString()
        val telephone = etTelephone.text.toString()

        //contact = Contact(null, name, telephone)
        //el conacto es nuevo?
        if (contact.id == null){
            AppDatabase.getInstance(this).getDao().insertContact(contact)
        }
        else{
            AppDatabase.getInstance(this).getDao().updateContact(contact)
        }
        finish()
    }

    override fun onCreateOptionsMenu(menu: Menu?): Boolean {
        val inflater: MenuInflater = menuInflater
        inflater.inflate(R.menu.contact_menu, menu)

        return true
    }

    //codigo cuando se presiona  "grabar" o "eliminar"
    override fun onOptionsItemSelected(item: MenuItem): Boolean {
        return when(item.itemId){
            R.id.itemSave ->{
                saveContact()
                true
            }
            R.id.itemDelete ->{
                deleteContact()
                true
            }
            else ->super.onOptionsItemSelected(item)
        }
    }

    private fun deleteContact() {
        AppDatabase.getInstance(this).getDao().deleteContact(contact)
        finish()
    }
}