package com.example.app_shareprefs

import android.content.Context

class SharePreferences(val context: Context) {
    private val PREFS_NAME="sharedPreferences"

    private val sharePreferences = context.getSharedPreferences(
        PREFS_NAME, Context.MODE_PRIVATE
    )

    fun save(keyName: String, value: String){
        val  editor = sharePreferences.edit()
        editor.putString(keyName, value)
        editor.commit()
    }

    fun getValue(keyName: String): String?{
        return sharePreferences.getString(keyName, null)
    }

    fun clear(keyName: String, value: String){
        val  editor = sharePreferences.edit()
        editor.clear()
        editor.commit()
    }
}