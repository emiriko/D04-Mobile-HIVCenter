import 'dart:html';

import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

Map<String, dynamic> userData = {"is_taken": false};

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPage();
}

class _RegisterPage extends State<RegisterPage> {
  final _registerFormKey = GlobalKey<FormState>();
  bool isPasswordVisible = false;
  void togglePasswordView() {
    setState(() {
      isPasswordVisible = !isPasswordVisible;
    });
  }

  String username = "";
  String email = "";
  String fName = "";
  String lName = "";
  String pass1 = "";
  String pass2 = "";

  @override
  Widget build(BuildContext context){
    final request = context.watch<CookieRequest>();
    bool isPasien = false;
    bool isDokter = false;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register"),
      ),
      body: Form(
        key: _registerFormKey,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    "Username",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "Username",
                      labelText: "Username",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    onChanged: (String? value){
                      setState(() {
                        username = value!;
                      });
                    },
                    onSaved: (String? value){
                      setState(() {
                        username = value!;
                      });
                    },
                    validator: (String? value){
                      if (value == null || value.isEmpty){
                        return 'Username tidak boleh kosong';
                      }
                      return null;
                    },
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    "Email",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "Email",
                      labelText: "Email",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    onChanged: (String? value){
                      setState(() {
                        email = value!;
                      });
                    },
                    onSaved: (String? value){
                      setState(() {
                        email = value!;
                      });
                    },
                    validator: (String? value){
                      if (value == null || value.isEmpty){
                        return 'Email tidak boleh kosong';
                      }
                      return null;
                    },
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    "First Name",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "First Name",
                      labelText: "First Name",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    onChanged: (String? value){
                      setState(() {
                        fName = value!;
                      });
                    },
                    onSaved: (String? value){
                      setState(() {
                        fName = value!;
                      });
                    },
                    validator: (String? value){
                      if (value == null || value.isEmpty){
                        return 'First Name tidak boleh kosong';
                      }
                      return null;
                    },
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    "Last Name",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "Last Name",
                      labelText: "Last Name",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    onChanged: (String? value){
                      setState(() {
                        lName = value!;
                      });
                    },
                    onSaved: (String? value){
                      setState(() {
                        lName = value!;
                      });
                    },
                    validator: (String? value){
                      if (value == null || value.isEmpty){
                        return 'Last Name tidak boleh kosong';
                      }
                      return null;
                    },
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    "Password",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextFormField(
                    obscureText: !isPasswordVisible,
                    decoration: InputDecoration(
                      hintText: "Password",
                      labelText: "Password",
                      suffixIcon: GestureDetector(
                        onTap: () {
                          togglePasswordView();
                        },
                        child: Icon(isPasswordVisible
                            ? Icons.visibility_off
                            : Icons.visibility),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    onChanged: (String? value){
                      setState(() {
                        pass1 = value!;
                      });
                    },
                    onSaved: (String? value){
                      setState(() {
                        pass1 = value!;
                      });
                    },
                    validator: (String? value){
                      if (value == null || value.isEmpty){
                        return 'Password tidak boleh kosong';
                      }
                      return null;
                    },
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    "Repeat Password",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextFormField(
                    obscureText: !isPasswordVisible,
                    decoration: InputDecoration(
                      hintText: "Repeat Password",
                      labelText: "Repeat Password",
                      suffixIcon: GestureDetector(
                        onTap: () {
                          togglePasswordView();
                        },
                        child: Icon(isPasswordVisible
                            ? Icons.visibility_off
                            : Icons.visibility),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    onChanged: (String? value){
                      setState(() {
                        pass2 = value!;
                      });
                    },
                    onSaved: (String? value){
                      setState(() {
                        pass2 = value!;
                      });
                    },
                    validator: (String? value){
                      if (value == null || value.isEmpty){
                        return 'Password tidak boleh kosong';
                      }
                      else if (value != pass1) {
                        return 'Password tidak sama';
                      }
                      return null;
                    },
                  )
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.blue),
                        ),
                        onPressed: () async {
                          if (_registerFormKey.currentState!.validate()){
                            await request.post("https://pbp-d04.up.railway.app/authentication/registerpasien/",
                            {
                              'username' : username,
                              'email' : email,
                              'first_name' : fName,
                              'last_name' : lName,
                              'password1' : pass1,
                              'password2' : pass2,
                            }).then((value) {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return Dialog(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    elevation: 15,
                                    child: ListView(
                                      padding: const EdgeInsets.only(
                                        top: 20, bottom: 20
                                      ),
                                      shrinkWrap: true,
                                      children: <Widget>[
                                        Center(
                                          child: Text(!value["is_taken"]
                                                ? 'Register Berhasil'
                                                : "Username sudah terdaftar"),
                                        ),
                                        const SizedBox(height: 20),
                                        TextButton(
                                          onPressed: () {
                                            if(!value["is_taken"]){
                                              userData["is_taken"] = value["is_taken"];
                                              Navigator.pop(context);
                                              Navigator.pushReplacementNamed(context, "/homepage");
                                            } else {
                                              Navigator.pop(context);
                                            }
                                          },
                                          child: Text(!value["is_taken"]
                                                ? 'Homepage'
                                                : "Kembali"),
                                        )
                                      ],
                                    ),
                                  );
                                }
                              );
                            },
                            onError: (error){
                              showDialog(
                                    context: context,
                                    builder: (context) {
                                      return Dialog(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        elevation: 15,
                                        child: ListView(
                                          padding: const EdgeInsets.only(
                                              top: 20, bottom: 20),
                                          shrinkWrap: true,
                                          children: <Widget>[
                                            const Center(
                                                child: Text(
                                                    'Register gagal karena server!')),
                                            const SizedBox(height: 20),
                                            TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: const Text('Kembali'),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  );
                            });
                          }
                        },
                        child: const Text(
                          "Register Sebagai Pasien",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.blue),
                        ),
                        onPressed: () async {
                          if (_registerFormKey.currentState!.validate()){
                            await request.post("https://pbp-d04.up.railway.app/authentication/registerdokter/",
                            {
                              'username' : username,
                              'email' : email,
                              'first_name' : fName,
                              'last_name' : lName,
                              'password1' : pass1,
                              'password2' : pass2,
                            }).then((value) {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return Dialog(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    elevation: 15,
                                    child: ListView(
                                      padding: const EdgeInsets.only(
                                        top: 20, bottom: 20
                                      ),
                                      shrinkWrap: true,
                                      children: <Widget>[
                                        Center(
                                          child: Text(!value["is_taken"]
                                                ? 'Register Berhasil'
                                                : "Username sudah terdaftar"),
                                        ),
                                        const SizedBox(height: 20),
                                        TextButton(
                                          onPressed: () {
                                            if(!value["is_taken"]){
                                              userData["is_taken"] = value["is_taken"];
                                              Navigator.pop(context);
                                              Navigator.pushReplacementNamed(context, "/homepage");
                                            } else {
                                              Navigator.pop(context);
                                            }
                                          },
                                          child: Text(!value["is_taken"]
                                                ? 'Homepage'
                                                : "Kembali"),
                                        )
                                      ],
                                    ),
                                  );
                                }
                              );
                            },
                            onError: (error){
                              showDialog(
                                    context: context,
                                    builder: (context) {
                                      return Dialog(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        elevation: 15,
                                        child: ListView(
                                          padding: const EdgeInsets.only(
                                              top: 20, bottom: 20),
                                          shrinkWrap: true,
                                          children: <Widget>[
                                            const Center(
                                                child: Text(
                                                    'Register gagal karena server!')),
                                            const SizedBox(height: 20),
                                            TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: const Text('Kembali'),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  );
                            });
                          }
                        },
                        child: const Text(
                          "Register Sebagai Dokter",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

// class RegisterPage extends StatelessWidget {
//   const RegisterPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: ElevatedButton(
//                   onPressed: () {
//                     Uri url = Uri.parse(
//                         "https://pbp-d04.up.railway.app/authentication/registerpasien/");
//                     launchUrl(url);
//                   },
//                   child: const Text("Register sebagai Pasien",
//                       style: TextStyle(fontWeight: FontWeight.bold))),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: ElevatedButton(
//                   onPressed: () {
//                     Uri url = Uri.parse(
//                         "https://pbp-d04.up.railway.app/authentication/registerdokter/");
//                     launchUrl(url);
//                   },
//                   child: const Text("Register sebagai Dokter",
//                       style: TextStyle(fontWeight: FontWeight.bold))),
//             )
//           ],
//         ),
//       ],
//     );
//   }
// }
