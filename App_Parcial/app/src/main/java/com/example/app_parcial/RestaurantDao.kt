package com.example.app_parcial

import androidx.room.Dao
import androidx.room.Delete
import androidx.room.Insert
import androidx.room.Query

@Dao
interface RestaurantDao {
    @Query("select * from restaurant")
    fun getAll(): List<Restaurant>

    @Insert
    fun insertContact(vararg restaurant: Restaurant)

    @Delete
    fun deleteContact(vararg restaurant: Restaurant)
}