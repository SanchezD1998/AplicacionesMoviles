package com.example.app_parcial

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.util.Log
import android.view.Menu
import android.view.MenuInflater
import androidx.recyclerview.widget.LinearLayoutManager
import kotlinx.android.synthetic.main.activity_main.*
import retrofit2.*
import retrofit2.converter.gson.GsonConverterFactory

class MainActivity : AppCompatActivity() {
    lateinit var restaurants: List<Restaurant>
    lateinit var restaurantAdapter: RestaurantAdapter

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        loadRestaurants()
    }

    private fun loadRestaurants() {
        val retrofit = Retrofit.Builder()
            .baseUrl("https://upc-pre-202102-cc183-parcial.herokuapp.com/")
            .addConverterFactory(GsonConverterFactory.create()).
            build()

        val service = retrofit.create(RestaurantService::class.java)

        val request = service.getRestaurants()

        request.enqueue(object : Callback<List<Restaurant>>{
            override fun onResponse(
                call: Call<List<Restaurant>>,
                response: Response<List<Restaurant>>
            ) {
                restaurants = response.body()!!
                restaurantAdapter = RestaurantAdapter(restaurants)
                rvRestaurant.adapter = restaurantAdapter
                rvRestaurant.layoutManager = LinearLayoutManager(this@MainActivity)
            }

            override fun onFailure(call: Call<List<Restaurant>>, t: Throwable) {
                Log.d("MainActivity", t.toString())
            }

        })
    }

    override fun onCreateOptionsMenu(menu: Menu?): Boolean {
        val inflater: MenuInflater = menuInflater
        inflater.inflate(R.menu.restaurant_menu, menu)

        return true
    }
}