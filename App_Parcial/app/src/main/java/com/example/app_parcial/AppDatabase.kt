package com.example.app_parcial

import android.content.Context
import androidx.room.Database
import androidx.room.Room
import androidx.room.RoomDatabase

@Database(entities = arrayOf(Restaurant::class), version = 1)
abstract class AppDatabase: RoomDatabase() {
    abstract fun getDao(): RestaurantDao

    companion object{
        private var INSTANCE: AppDatabase? = null

        fun getInstance(context: Context): AppDatabase{
            if (INSTANCE == null){
                INSTANCE = Room
                    .databaseBuilder(context, AppDatabase::class.java, "app1.db")
                    .allowMainThreadQueries()
                    .build()
            }
            return INSTANCE as AppDatabase
        }
    }
}