import 'package:flutter/material.dart';
import 'package:learnifyflutter/drawerscreen.dart';
import 'package:learnifyflutter/editprofilescreen.dart';
import 'package:learnifyflutter/mainscreen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 73),
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
                                  builder: (context) => MainScreen()));
                        },
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'My Profile',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontFamily: 'Nisebuschgardens',
                        ),
                      ),
                      Icon(
                        Icons.logout,
                        color: Colors.white,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: height * 0.34,
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        double innerHeight = constraints.maxHeight;
                        double innerWidth = constraints.maxWidth;
                        return Stack(
                          fit: StackFit.expand,
                          children: [
                            Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: Container(
                                height: innerHeight * 0.69,
                                width: innerWidth,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: Colors.white,
                                ),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 30,
                                    ),
                                    Text(
                                      'Sami Tfifha',
                                      style: TextStyle(
                                        color: Color.fromRGBO(39, 105, 171, 1),
                                        fontFamily: 'Nunito',
                                        fontSize: 25,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 0,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Column(
                                          children: [
                                            Text(
                                              'Courses',
                                              style: TextStyle(
                                                color: Colors.grey[700],
                                                fontFamily: 'Nunito',
                                                fontSize: 15,
                                              ),
                                            ),
                                            Text(
                                              '10',
                                              style: TextStyle(
                                                color: Color.fromRGBO(
                                                    39, 105, 171, 1),
                                                fontFamily: 'Nunito',
                                                fontSize: 15,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 50,
                                            vertical: 8,
                                          ),
                                          child: Container(
                                            height: 50,
                                            width: 3,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ),
                                        Column(
                                          children: [
                                            Text(
                                              'Rates',
                                              style: TextStyle(
                                                color: Colors.grey[700],
                                                fontFamily: 'Nunito',
                                                fontSize: 15,
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                Icon(
                                                  Icons.star,
                                                  color: Colors.amber,
                                                  size: 15,
                                                ),
                                                Icon(
                                                  Icons.star,
                                                  color: Colors.amber,
                                                  size: 15,
                                                ),
                                                Icon(
                                                  Icons.star,
                                                  color: Colors.amber,
                                                  size: 15,
                                                ),
                                                Icon(
                                                  Icons.star,
                                                  color: Colors.amber,
                                                  size: 15,
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              top: 110,
                              right: 20,
                              child: Icon(
                                Icons.settings,
                                color: Colors.grey[700],
                                size: 30,
                              ),
                            ),
                            Positioned(
                              top: 110,
                              left: 20,
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              EditProfileScreen()));
                                },
                                child: Icon(
                                  Icons.edit,
                                  color: Colors.grey[700],
                                  size: 30,
                                ),
                              ),
                            ),
                            Positioned(
                              top: 0,
                              left: 0,
                              right: 0,
                              child: Center(
                                child: Container(
                                  child: Image.asset(
                                    'assets/images/profile.png',
                                    width: innerWidth * 0.30,
                                    fit: BoxFit.fitWidth,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: height * 0.5,
                    width: width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            'My courses',
                            style: TextStyle(
                              color: Color.fromRGBO(39, 105, 171, 1),
                              fontSize: 27,
                              fontFamily: 'Nunito',
                            ),
                          ),
                          Divider(
                            thickness: 2.5,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: height * 0.15,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: height * 0.15,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
