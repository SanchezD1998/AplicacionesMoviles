import 'package:flutter/material.dart';
import 'package:app_persistencia_moor/data/moor_database.dart';

void main() {
  runApp(Orders());
}

class Orders extends StatefulWidget {
  @override
  _OrdersState createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Orders list"),
        ),
        body: SingleChildScrollView(
          child: NewOrder(),
        ),
      ),
    );
  }
}

class NewOrder extends StatefulWidget {
  @override
  _NewOrderState createState() => _NewOrderState();
}

class _NewOrderState extends State<NewOrder> {
  TextEditingController productNameController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    int pos=0;
    return Column(
      children: <Widget>[
        TextField(
          decoration: InputDecoration(hintText: "Modelo de equipo"),
          keyboardType: TextInputType.text,
          controller: productNameController,
        ),
        TextField(
          decoration: InputDecoration(hintText: "Precio"),
          keyboardType: TextInputType.number,
          controller: priceController,
        ),
        ElevatedButton(
            onPressed: () {
              setState(() {
                AppDatabase().insertNewOrder(Order(
                    id: pos,
                    productName: productNameController.text,
                    price: priceController.text
                ));
                productNameController.clear();
                priceController.clear();
                pos+=1;
              });
            },
            child: Text("Add to List...")
        ),
        Container(
          height: 700,
          width: double.infinity,
          child: StreamBuilder(
            stream: AppDatabase().watchAllOrder(),
            builder: (context, AsyncSnapshot<List<Order>> snapshot){
              return ListView.builder(
                  itemBuilder: (_, index){
                    return Card(
                      color: Colors.black12,
                      child: ListTile(
                        leading: CircleAvatar(
                          child: Text("${index+1}"),
                          radius: 20,
                          backgroundColor: Colors.black45,
                        ),
                        title: Text(snapshot.data![index].productName),
                        subtitle: Text("S/. ${snapshot.data![index].id}"),
                        trailing: IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: (){
                            setState(() {
                              AppDatabase().deleteOrder(snapshot.data![index]);
                            });
                          },
                        ),
                      ),
                    );
                  },
              itemCount: snapshot.data!.length,
              );
            },
          ),
        )
      ],
    );
  }
}
