package com.example.app_parcial

import androidx.room.ColumnInfo
import androidx.room.Entity
import androidx.room.PrimaryKey
import com.google.gson.annotations.SerializedName

@Entity(tableName = "restaurant")
class Restaurant (
    @PrimaryKey
    @SerializedName("id")
    val id: Int,

    @SerializedName("name")
    @ColumnInfo(name = "name")
    val name: String,

    @SerializedName("address")
    @ColumnInfo(name = "address")
    val address: String,

    @SerializedName("district")
    @ColumnInfo(name = "district")
    val district: String,

    @SerializedName("latitude")
    @ColumnInfo(name = "latitude")
    val latitude: Double,

    @SerializedName("longitude")
    @ColumnInfo(name = "longitude")
    val longitude: Double,

    @SerializedName("poster")
    @ColumnInfo(name = "poster")
    val poster: String,

    @SerializedName("rating")
    @ColumnInfo(name = "rating")
    val rating: Double
        )