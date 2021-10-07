package com.example.app_parcial

import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.recyclerview.widget.RecyclerView
import com.bumptech.glide.Glide
import kotlinx.android.synthetic.main.prototype_restaurant.view.*

class RestaurantAdapter(val restaurants: List<Restaurant>):
    RecyclerView.Adapter<RestaurantPrototype>() {
    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): RestaurantPrototype {
        val view = LayoutInflater
            .from(parent.context)
            .inflate(R.layout.prototype_restaurant, parent, false)

        return RestaurantPrototype(view)
    }

    override fun onBindViewHolder(prototype: RestaurantPrototype, position: Int) {
        prototype.bind(restaurants[position])
    }


    override fun getItemCount(): Int {
        return restaurants.size
    }

}

class RestaurantPrototype(itemView: View): RecyclerView.ViewHolder(itemView) {
    val tvName = itemView.tvName
    val ivRestaurant = itemView.ivRestaurant

    fun bind(restaurant: Restaurant){
        tvName.text = restaurant.name
        Glide.with(itemView).load(restaurant.poster).into(ivRestaurant)
    }
}
