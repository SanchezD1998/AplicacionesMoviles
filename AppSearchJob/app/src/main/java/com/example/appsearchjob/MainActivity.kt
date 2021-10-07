package com.example.appsearchjob

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.util.Log
import android.widget.Button
import androidx.recyclerview.widget.LinearLayoutManager
import androidx.recyclerview.widget.RecyclerView
import com.google.android.material.textfield.TextInputEditText
import retrofit2.Call
import retrofit2.Callback
import retrofit2.Response
import retrofit2.Retrofit
import retrofit2.converter.gson.GsonConverterFactory

class MainActivity : AppCompatActivity() {
    lateinit var jobs: List<Job>
    lateinit var jobAdapter: JobAdapter

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        val btSearch = findViewById<Button>(R.id.btSearch)


        btSearch.setOnClickListener{
            searchJob()
        }
    }

    private fun searchJob() {
        val etDescription = findViewById<TextInputEditText>(R.id.etDescription)
        val rvJobs = findViewById<RecyclerView>(R.id.rvJob)
        val descritpion = etDescription.text.toString()

        val retrofit = Retrofit.Builder()
            .baseUrl("https://jobs.github.com/")
            .addConverterFactory(GsonConverterFactory.create())
            .build()

        val service = retrofit.create(JobService::class.java)

        val request = service.searchJob(descritpion)

        request.enqueue(object : Callback<List<Job>>{
            override fun onResponse(call: Call<List<Job>>, response: Response<List<Job>>) {
                //codigo OK
                jobs = response.body()!!
                jobAdapter = JobAdapter(jobs)
                rvJobs.adapter = jobAdapter
                rvJobs.layoutManager = LinearLayoutManager(this@MainActivity)
            }

            override fun onFailure(call: Call<List<Job>>, t: Throwable) {
                Log.d("MainActivity", t.toString())
            }

        })
    }
}