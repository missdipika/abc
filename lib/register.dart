import 'package:flutter/material.dart';
import 'package:abc/ab.dart';

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white.withOpacity(0.1),
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          ),
        ),
        backgroundColor: Colors.white.withOpacity(0.9),
        body: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text("Register",
                style: TextStyle(
                    fontSize: 24,
                    color: Colors.black,
                    fontWeight: FontWeight.bold)),
          ),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4)),
                height: 40,
                width: 190,
                child: Text("Teacher",
                    style: TextStyle(
                        fontSize: 13,
                        color: Colors.black,
                        fontWeight: FontWeight.bold)),
                alignment: Alignment.center,
              ),
              const SizedBox(width: 10),
              Container(
                decoration: BoxDecoration(
                    color: Colors.deepPurple,
                    borderRadius: BorderRadius.circular(4)),
                height: 40,
                width: 190,
                child: Text("Student",
                    style: TextStyle(
                        fontSize: 13,
                        color: Colors.white,
                        fontWeight: FontWeight.bold)),
                alignment: Alignment.center,
              ),
            ],
          ),
          SizedBox(height: 25),
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: 'email',
                hintStyle: TextStyle(fontSize: 15),
              ),
            ),
          ),
          SizedBox(height: 25),
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: 'phone Number',
                hintStyle: TextStyle(fontSize: 15),
              ),
            ),
          ),
          SizedBox(height: 25),
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: 'password',
                hintStyle: TextStyle(fontSize: 15),
              ),
              obscureText: true,
            ),
          ),
          SizedBox(height: 25),
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: 'confirm password',
                hintStyle: TextStyle(fontSize: 15),
              ),
              obscureText: true,
            ),
          ),
          Container(
            width: 650,
            height: 50,
            padding: EdgeInsets.only(
              top: 12,
              left: 10,
              right: 10,
            ),
            child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  "Register",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.deepPurpleAccent,
                )),
          ),
          const SizedBox(
            height: 32,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(
              height: 43,
              width: 208,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Color(0xFF375E95)),
                onPressed: () {},
                child: Icon(Icons.facebook),
              ),
            ),
            const SizedBox(width: 30),
            Expanded(
              child: Container(
                height: 43,
                //width: 208,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.white),
                    onPressed: () {},
                    child: Image.asset(
                          "assets/g.png",
                          // "https://images.unsplash.com/photo-1658070781263-ca4cef87d5cd?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyfHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=400&q=60"
                           width: 25,
                           height: 25,
                        )),
                //
              ),
            ),
          ]),
          const SizedBox(height: 18),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "don't have an account sign up?",
              ),
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 15),
                ),
                onPressed: () {
                  // Navigator.push(context,
                  Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MainScreen()));
                  //     MaterialPageRoute(builder: (context) => SecondScreen()));
                },
                child: const Text('Register Now'),
              ),
            ],
          ),
        ])));
  }
}
