package com.example.app_parcial

import retrofit2.Call
import retrofit2.http.GET
import retrofit2.http.Query

interface RestaurantService {
    @GET("restaurants")
    fun getRestaurants():Call<List<Restaurant>>
}