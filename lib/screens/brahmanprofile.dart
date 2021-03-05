import 'package:flutter/material.dart';
import 'package:ant_icons/ant_icons.dart';
import 'package:google_fonts/google_fonts.dart';

class Bprofile extends StatelessWidget {
  final list1 = [
    "Dhrupad Jagannath",
    "Sangram Panda",
    "A Mishra",
    "B Panda",
    "Hrusikesh Panda",
    "S K Tripathy",
    "Trilochan Panda",
  ];
  final List photo = [
    "https://wallpapercave.com/wp/wp6688438.jpg",
    "https://scontent.fshl1-1.fna.fbcdn.net/v/t1.0-9/125464917_2878645419075534_5462803119017108400_o.jpg?_nc_cat=109&ccb=2&_nc_sid=09cbfe&_nc_ohc=Dunpe0sgFFcAX_dCjNA&_nc_ht=scontent.fshl1-1.fna&oh=4f478ad3f9b270c226fab73b3bbc7e27&oe=60411A19",
    "https://lh3.googleusercontent.com/proxy/F7VfO78MnHuQimSuYmoK2BxoJ72ld_FeIaXNPsQAjmdKxwRXZO5Mchak86TgYwl311FUedc3gkfWtuMryxysFR8nrYhHAgPdeUeDTJ4-mLNQm-tduGHzgG4ujcEBMl3cU40d3cw3Nbp98ud-N_RKCg",
    "https://c8.alamy.com/comp/2B017TW/a-brahmin-also-brahman-is-a-member-of-the-priestly-class-in-the-indian-subcontinent-and-belongs-to-the-upper-caste-society-in-hinduism-brahmins-were-charged-with-performing-religious-duties-as-priests-and-preaching-dharma-as-one-who-prays-a-devout-or-religious-man-a-brhman-who-is-well-versed-in-vedic-texts-one-versed-in-sacred-knowledge-2B017TW.jpg",
    "https://c8.alamy.com/comp/E1H5FK/basari-india-2008-a-blind-hindu-brahmin-smoking-E1H5FK.jpg",
    "https://www.sanskritimagazine.com/wp-content/uploads/2014/05/brahmin-300x225.jpg",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRNVbp4GcnAFpqpJB8pIuJ0AqUgU4dYEkgkOg&usqp=CAU",
  ];

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
              colors: [
                Color.fromRGBO(4, 9, 35, 1),
                Color.fromRGBO(39, 105, 171, 1),
              ],
              begin: FractionalOffset.bottomCenter,
              end: FractionalOffset.topCenter,
            ),
          ),
        ),
        Scaffold(
            backgroundColor: Colors.orange[600],
            body: SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 34),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          AntIcons.arrow_left,
                          color: Colors.white,
                        ),
                        Icon(
                          AntIcons.user,
                          color: Colors.white,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text('Profile',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.bangers(
                          fontSize: 20,
                        )),
                    SizedBox(
                      height: 22,
                    ),
                    Container(
                      height: height * 0.43,
                      child: LayoutBuilder(
                        builder: (context, constrains) {
                          double innerHeight = constrains.maxHeight;
                          double innerWidth = constrains.maxWidth;
                          return Stack(
                            fit: StackFit.expand,
                            children: [
                              Positioned(
                                top: 60,
                                bottom: 0,
                                left: 0,
                                right: 0,
                                child: Container(
                                  height: innerHeight * 0.72,
                                  width: innerWidth,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: Colors.white,
                                  ),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 80,
                                      ),
                                      Text(
                                        'Sangram Panda',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: 'Nunito',
                                            fontSize: 20),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Column(
                                            children: [
                                              Text(
                                                'Address',
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontFamily: 'Nunito',
                                                    fontSize: 15),
                                              ),
                                              Text(
                                                'Chandrasekharpur',
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
                                              horizontal: 25,
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
                                                'Contact',
                                                style: TextStyle(
                                                  color: Colors.grey,
                                                  fontFamily: 'Nunito',
                                                  fontSize: 15,
                                                ),
                                              ),
                                              Text(
                                                '9439045906',
                                                style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      39, 105, 171, 1),
                                                  fontFamily: 'Nunito',
                                                  fontSize: 15,
                                                ),
                                              )
                                            ],
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 230,
                                left: 140,
                                child: InkWell(
                                  onTap: () {},
                                  child: Image(
                                    height: 60,
                                    width: 60,
                                    image: AssetImage('assets/images/call.png'),
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 0,
                                left: 0,
                                right: 0,
                                child: Center(
                                  child: CircleAvatar(
                                    radius: 60.0,
                                    backgroundImage: AssetImage(
                                        'assets/images/Brahmin_prof.jpg'),
                                    backgroundColor: Colors.transparent,
                                  ),
                                ),
                              )
                            ],
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 30,
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
                              'About',
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
                              height: height * 0.35,
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                    'Sangram Panda is the most popular Brahmin of Chandrasekharpur.'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )),
      ],
    );
  }
}
