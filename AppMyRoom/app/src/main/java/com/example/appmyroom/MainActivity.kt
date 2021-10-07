package com.example.appmyroom

import android.content.Intent//
import androidx.appcompat.app.AppCompatActivity//
import android.os.Bundle//
import android.view.Menu//
import android.view.MenuInflater//
import android.view.MenuItem//

import androidx.recyclerview.widget.LinearLayoutManager//
import com.google.gson.Gson//
import kotlinx.android.synthetic.main.activity_main.*//


class MainActivity : AppCompatActivity(), OnItemClickListener {
    override fun OnItemClicked(contact: Contact) {
        //CON ESTE CODIGO paso los valores al contactActivity
        val intent = Intent(this, ContactActivity::class.java)
        val gson = Gson()
        intent.putExtra("contact", gson.toJson(contact))
        startActivity(intent)
    }

    lateinit var contacts: List<Contact>

    //utilizo el adaptador del RV
    lateinit var contactAdapter: ContactAdapter

    //este metodo se carga 1 sola vez
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
    }

    //este metodo se carga en c/cambio
    override fun onResume() {
        super.onResume()
        loadContacts()

        contactAdapter = ContactAdapter(contacts, this)
        rvContact.adapter = contactAdapter
        rvContact.layoutManager = LinearLayoutManager(this)
    }

    private fun loadContacts() {
        contacts = AppDatabase.getInstance(this).getDao().getAll()
    }

    //cargar el ícono "nuevo"
    override fun onCreateOptionsMenu(menu: Menu?): Boolean {
        val inflater : MenuInflater = menuInflater
        inflater.inflate(R.menu.main_menu, menu)

        return true
    }

    //codigo cuando se presiona "nuevo"
    override fun onOptionsItemSelected(item: MenuItem): Boolean {
        return when(item.itemId){
            R.id.itemAdd ->{
                val intent = Intent(this, ContactActivity::class.java)
                startActivity(intent)
                true
            }
            else -> super.onOptionsItemSelected(item)
        }
    }
}