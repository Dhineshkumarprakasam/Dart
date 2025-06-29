import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FirebaseAuthMethod {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore database = FirebaseFirestore.instance;

  Future<void> signUpWithEmailAndPassword(String email, String password) {
    return _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> loginWithEmailAndPassword(String email, String password) {
    return _auth.signInWithEmailAndPassword(email: email, password: password);
  }

  Stream<User?> get authStateChanges => _auth.authStateChanges();

  Future<void> signOut() {
    return _auth.signOut();
  }

  FirebaseAuth get instance => _auth;

  Future<void> emailVerification() async {
    final user = _auth.currentUser;
    if (user != null && !user.emailVerified) {
      await user.sendEmailVerification();
    }
  }

  Future<void> insertData(int number) async {
    await database.collection("data").add({
      'value': number,
      'createdat': Timestamp.now(),
    });
  }

  Future<List<Map<String, dynamic>>> getdata() async {
    QuerySnapshot snapshot = await database.collection("data").get();

    List<Map<String, dynamic>> data =
        snapshot.docs.map((doc) {
          return {
            'id': doc.id,
            'value': doc['value'] as int,
            'createdat': doc['createdat'].toDate(),
          };
        }).toList();

    return data;
  }

  //delete only given item
  Future<void> deleteData(String id) async {
    await database.collection("data").doc(id).delete();
  }
}

class homeScreen extends StatefulWidget {
  const homeScreen({super.key});

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  final FirebaseAuthMethod auth = FirebaseAuthMethod();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: auth.authStateChanges,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasData &&
            auth.instance.currentUser!.emailVerified) {
          return FutureBuilder(
            future: auth.getdata(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting)
                return Center(child: CircularProgressIndicator());
              return SuccessPage(auth: auth);
            },
          );
        } else
          return LoginScreen(auth: auth);
      },
    );
  }
}

class LoginScreen extends StatefulWidget {
  final FirebaseAuthMethod auth;

  LoginScreen({super.key, required this.auth});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: Container(
        margin: EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(hintText: "Email"),
              ),

              SizedBox(height: 20),

              TextFormField(
                controller: passwordController,
                decoration: InputDecoration(hintText: "Password"),
              ),

              SizedBox(height: 20),

              Row(
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      try {
                        await widget.auth.loginWithEmailAndPassword(
                          emailController.text,
                          passwordController.text,
                        );
                      } on FirebaseAuthException catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(e.message.toString())),
                        );
                      }

                      if (widget.auth.instance.currentUser!.emailVerified ==
                          false) {
                        print(
                          "Message verification : ${widget.auth.instance.currentUser!.emailVerified}",
                        );
                        await widget.auth.emailVerification();
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Email sent for verification"),
                          ),
                        );
                      } else {
                        List<Map<String, dynamic>> data =
                            await widget.auth.getdata();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (context) => SuccessPage(auth: widget.auth),
                          ),
                        );
                      }
                    },
                    child: Text("Login"),
                  ),

                  SizedBox(width: 20),

                  ElevatedButton(
                    onPressed: () async {
                      try {
                        await widget.auth.signUpWithEmailAndPassword(
                          emailController.text,
                          passwordController.text,
                        );
                      } on FirebaseAuthException catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(e.message.toString())),
                        );
                      }
                    },
                    child: Text("Sign Up"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SuccessPage extends StatefulWidget {
  final FirebaseAuthMethod auth;
  SuccessPage({super.key, required this.auth});

  @override
  State<SuccessPage> createState() => _SuccessPageState();
}

class _SuccessPageState extends State<SuccessPage> {
  int number = 0;
  List<Map<String, dynamic>> data = [];

  @override
  void initiateData() async {
    List<Map<String, dynamic>> tempData = await widget.auth.getdata();
    setState(() {
      data = tempData;
    });
  }

  void initState() {
    super.initState();
    initiateData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Success")),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          setState(() {
            number++;
            widget.auth.insertData(number);
            initiateData();
          });
        },
      ),
      body: Container(
        child: Center(
          child:
              data.isEmpty == true
                  ? Text("No Data")
                  : ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(data[index]['value'].toString()),
                        subtitle: Text(data[index]['createdat'].toString()),
                        trailing: IconButton(
                          onPressed: () {
                            widget.auth.deleteData(data[index]['id']);
                            initiateData();
                          },
                          icon: Icon(Icons.delete),
                        ),
                      );
                    },
                  ),
        ),
      ),
    );
  }
}
