package com.example.appmyroom

import androidx.room.ColumnInfo
import androidx.room.Entity
import androidx.room.PrimaryKey

@Entity //anotaciones de ROOM
//necesariamente tiene q ser data class
data class Contact (
    //ROOM necesariamente debe gener un PK
    @PrimaryKey(autoGenerate = true)
    var id: Int?,

    @ColumnInfo(name = "name")
    var name: String?,

    @ColumnInfo(name = "telephone")
    var telephone: String?
)