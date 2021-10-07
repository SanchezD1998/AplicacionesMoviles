package com.example.app_parcial

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle

class RestaurantsActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_restaurants)

        loadRestaurantFavorite()
    }

    private fun loadRestaurantFavorite() {
        TODO("Not yet implemented")
    }
}