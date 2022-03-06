import 'package:flutter/material.dart';
import 'package:learnifyflutter/mainscreen.dart';
import 'package:learnifyflutter/profilescreen.dart';
import 'package:learnifyflutter/settingscreen.dart';
import 'package:learnifyflutter/utils.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path/path.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_svg/flutter_svg.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  bool showPassword = false;

  TextEditingController firstnameContoller = new TextEditingController();
  TextEditingController lastnameController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController birthdateController = new TextEditingController();
  TextEditingController degreeController = new TextEditingController();
  TextEditingController jobController = new TextEditingController();

  late String userid;
  late String firstName;
  late String lastName;
  late String profilePicpath;
  late String profilePic;
  late String email;
  late String birthDate;
  late String degree;
  late String job;

  late Future<bool> fetchedUser;

  Future<bool> fetchUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userid = prefs.getString("_id")!;

    http.Response response = await http
        .get(Uri.parse(BaseURL + "users/" + userid))
        .then((response) async {
      print(response.statusCode);
      if (response.statusCode == 201) {
        Map<String, dynamic> userData = json.decode(response.body);

        firstName = userData["firstName"];
        lastName = userData["lastName"];
        profilePicpath = userData["profilePic"];
        profilePic = profilePicpath.substring(22, profilePicpath.length);
        email = userData["email"];
        birthDate = userData["birthdate"];
        degree = userData["degree"];
        job = userData["job"];

        //print(profilePic);
      }
      return response;
    });
    return true;
  }

  @override
  void initState() {
    // TODO: implement initState
    fetchedUser = fetchUser();
    super.initState();
  }

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Stack(
      fit: StackFit.expand,
      children: [
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.teal, Colors.indigo],
            ),
          ),
        ),
        FutureBuilder(
            future: fetchedUser,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Scaffold(
                  backgroundColor: Colors.transparent,
                  body: Form(
                    key: _formkey,
                    child: SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 73),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ProfileScreen()));
                                  },
                                  child: Icon(
                                    Icons.arrow_back_ios,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  'Edit Profile',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontFamily: 'Nisebuschgardens',
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                SettingScreen()));
                                  },
                                  child: Icon(
                                    Icons.logout,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Center(
                              child: Container(
                                child: Stack(
                                  children: [
                                    Container(
                                      width: 130,
                                      height: 130,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              width: 4,
                                              color: Theme.of(context)
                                                  .scaffoldBackgroundColor),
                                          boxShadow: [
                                            BoxShadow(
                                                spreadRadius: 2,
                                                blurRadius: 10,
                                                color: Colors.black
                                                    .withOpacity(0.1),
                                                offset: Offset(0, 10))
                                          ],
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: NetworkImage(
                                                BaseURL +
                                                    'images/uploads/' +
                                                    profilePic,
                                              ))),
                                    ),
                                    Positioned(
                                        bottom: 0,
                                        right: 0,
                                        child: Container(
                                          height: 40,
                                          width: 40,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              width: 4,
                                              color: Theme.of(context)
                                                  .scaffoldBackgroundColor,
                                            ),
                                            color: Colors.green,
                                          ),
                                          child: Icon(
                                            Icons.edit,
                                            color: Colors.white,
                                          ),
                                        )),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Center(
                              child: Stack(
                                children: [
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    height: height * 0.7,
                                    width: width,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: Colors.white,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15),
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: 10,
                                          ),
                                          SizedBox(
                                            height: 25,
                                          ),
                                          Container(
                                            height: height * 0.65,
                                            child: Column(
                                              children: [
                                                buildTextFormField(
                                                    firstnameContoller,
                                                    "First Name",
                                                    firstName,
                                                    false),
                                                buildTextFormField(
                                                    lastnameController,
                                                    "Last Name",
                                                    lastName,
                                                    false),
                                                buildTextFormField(
                                                    emailController,
                                                    "E-mail",
                                                    email,
                                                    false),
                                                buildTextFormField(
                                                    birthdateController,
                                                    "Birth Date",
                                                    birthDate,
                                                    false),
                                                buildTextFormField(
                                                    degreeController,
                                                    "degree",
                                                    degree,
                                                    false),
                                                buildTextFormField(
                                                    jobController,
                                                    "Job",
                                                    job,
                                                    false),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(
                                        left: 10, right: 10, top: 20),
                                    padding:
                                        EdgeInsets.only(left: 55, right: 55),
                                    alignment: Alignment.center,
                                    height: 45,
                                    width: 160,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.red),
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    child: Text(
                                      "Cancel",
                                      style: TextStyle(color: Colors.redAccent),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                        left: 10, right: 10, top: 20),
                                    alignment: Alignment.center,
                                    width: 160,
                                    height: 45,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                          colors: [
                                            (new Color(0xff4B0082)),
                                            (new Color(0xff00FFFF))
                                          ],
                                          begin: Alignment.centerLeft,
                                          end: Alignment.centerRight),
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    child: InkWell(
                                      onTap: () async {
                                        if (_formkey.currentState!.validate()) {
                                          _formkey.currentState!.save();

                                          Map<String, String> headers = {
                                            "Content-Type":
                                                "application/json; charset=utf-8"
                                          };
                                          Map<String, dynamic> body = {
                                            "firstName":
                                                firstnameContoller.text,
                                            "lastName": lastnameController.text,
                                            "email": emailController.text,
                                            "birthdate":
                                                birthdateController.text,
                                            "degree": degreeController.text,
                                            "job": jobController.text
                                          };
                                          http
                                              .put(
                                                  Uri.parse(BaseURL +
                                                      "users/" +
                                                      userid),
                                                  headers: headers,
                                                  body: json.encode(body))
                                              .then((response) async {
                                            print(response.statusCode);
                                            if (response.statusCode == 200) {
                                              Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (_) =>
                                                      ProfileScreen(),
                                                ),
                                              );
                                              //Navigator.pushReplacementNamed(context, "/home");
                                              print("success login");
                                            } else {
                                              showDialog(
                                                  context: context,
                                                  builder: (context) {
                                                    return const AlertDialog(
                                                      title:
                                                          Text("Informations"),
                                                      content: Text(
                                                          "Email et/ou mot de passe invalides"),
                                                    );
                                                  });
                                            }
                                          });
                                        }
                                      },
                                      child: Text(
                                        "Save",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            })
      ],
    );
  }

  Widget buildTextFormField(TextEditingController textEditingController,
      String labelText, String placeholder, bool isPasswordTextField) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: TextFormField(
        controller: textEditingController,
        obscureText: isPasswordTextField ? showPassword : false,
        decoration: InputDecoration(
            suffixIcon: isPasswordTextField
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        showPassword = !showPassword;
                      });
                    },
                    icon: Icon(
                      Icons.remove_red_eye,
                      color: Colors.grey,
                    ),
                  )
                : null,
            contentPadding: EdgeInsets.only(bottom: 3),
            labelText: labelText,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: placeholder,
            hintStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            )),
      ),
    );
  }
}
