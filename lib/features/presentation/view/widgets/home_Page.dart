import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundImage: AssetImage('assets/Tea.png'),
          ),
        ),
        title: const Text(
          'Home',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 26,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.camera_alt, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.edit, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(" Conunte $selectedIndex",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30
            ),),
            SizedBox(height: 20),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: CircleBorder(),
                        backgroundColor: Colors.green[400]
                    ),
                    onPressed: (){
                      _addCount();
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content: const Text("Add Button"),
                            duration: const Duration(seconds: 1),
                            behavior: SnackBarBehavior.floating,
                            backgroundColor: Colors.blue,
                          ));
                    },
                    child: Text("+",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                      ),)),
                  SizedBox(width: 20),
                   ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: CircleBorder(),
                            backgroundColor: Colors.green[400]
                          ),
                    onPressed: (){
                      _minesCount();
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: const Text("Minus Button"),
                            duration: const Duration(seconds: 1),
                            behavior: SnackBarBehavior.floating,
                            backgroundColor: Colors.red,
                          ));
                    },
                    child: Text("-",
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        color: Colors.white
                      ),)),

              ],
            )
          ],
        ),
      ),

    );
  }

  void _addCount(){

    setState((){
      selectedIndex++;
    });

  }

  void _minesCount(){
    setState((){
      if(selectedIndex > 0){
        selectedIndex--;
      }
    });
  }
}
