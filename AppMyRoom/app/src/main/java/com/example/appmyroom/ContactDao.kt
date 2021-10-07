package com.example.appmyroom

import androidx.room.*

@Dao
interface ContactDao {
    //Aqui hago el CRUD
    @Query("select * from contact")
    fun getAll(): List<Contact>

    @Insert
    fun insertContact(vararg contact: Contact)

    @Delete
    fun deleteContact(vararg contact: Contact)

    @Update
    fun updateContact(vararg contact: Contact)
}