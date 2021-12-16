import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nash_mini/Api/Services/api_manager.dart';
import 'package:nash_mini/Models/card_model.dart';
import 'package:nash_mini/Models/client_model.dart';
import 'package:nash_mini/Models/operations_model.dart';
import 'package:nash_mini/Models/transaction_model.dart';
import 'package:nash_mini/Screens/Bloc/BlocTest.dart';
import 'package:nash_mini/Screens/complete_profile/complete_profile_screen.dart';
import 'package:nash_mini/Screens/otp/otp_screen.dart';
import 'package:nash_mini/Screens/signup/signup_screen.dart';
import 'package:nash_mini/Screens/splash/splash_screen.dart';
import 'package:nash_mini/constants.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = "/home";

  const HomeScreen({Key? key, int? clientId}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<TransactionsModel> _transactionModel;
  late Future<ClientModel> _clientModel;

  @override
  void initState() {
    _clientModel = API_Manager().get_client.getClient(1);
    //_transactionModel = API_Manager().transaction.getTransactions();
    super.initState();
  }

  //selected indicator
  int current = 0;
  int pageIndex = 0;
  final Screen = [
    HomeScreen(),
    SignUpScreen(),
    CompleteProfileScreen(),
    SplashScreen(),
    OtpVerificationScreen()
  ];

  //handling indicator
  List<T> indicatorMap<T>(List list, Function handler) {
    List<T> result = [];

    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }

    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        buttonBackgroundColor: kPrimaryColor,
        color: kPrimaryColor,
        index: pageIndex,
        items: [
          menuIcons(icon: Icons.home),
          menuIcons(icon: Icons.payment),
          menuIcons(icon: Icons.person),
          menuIcons(icon: Icons.account_balance),
          menuIcons(icon: Icons.settings),
        ],
        onTap: (index) {
          setState(() {
            pageIndex = index;

            switch (pageIndex) {
              case 0:
                Navigator.pushNamed(context, HomeScreen.routeName);
                break;
              case 1:
                Navigator.pushNamed(context, BlocTestScreen.routeName);
                break;
              default:
                Navigator.pushNamed(context, HomeScreen.routeName);
            }
          });
        },
        animationCurve: Curves.easeInBack,
        animationDuration: defaultDuration,
      ),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(left: 0.0, top: 0.0, right: 0.0, bottom: 0.0),
          child: ListView(
            physics: ClampingScrollPhysics(),
            children: <Widget>[
              //Custom AppBar Section #############################################
              Container(
                margin: EdgeInsets.only(left: 16, right: 16, top: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    //Menu Icon
                    GestureDetector(
                        onTap: () {
                          _clientModel = API_Manager().get_client.getClient(1);
                        },
                        child: SvgPicture.asset('assets/svg/icon_menu.svg')),

                    //UserImage
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                              image:
                                  AssetImage('assets/images/user_image.png'))),
                    )
                  ],
                ),
              ),

              SizedBox(
                height: 25,
              ),

              //Name Section ######################################################
              Padding(
                padding: EdgeInsets.only(left: 16, bottom: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Good morning',
                      style: GoogleFonts.inter(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                    FutureBuilder<ClientModel>(
                      future: _clientModel,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          var json = API_Manager().get_client.getClient(1);
                          print('### NAME ' +
                              ClientModel.fromJson(json).displayName);
                          return Text(
                            ClientModel.fromJson(json).displayName,
                            style: GoogleFonts.inter(
                                fontSize: 25,
                                fontWeight: FontWeight.w700,
                                color: Colors.black),
                          );
                        } else {
                          return Text('');
                        }
                      },
                    ),
                  ],
                ),
              ),

              //Card Section ######################################################
              Container(
                height: 199,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.only(left: 16, right: 6),
                    itemCount: cards.length,
                    itemBuilder: (context, index) {
                      return Container(
                        //cards
                        margin: EdgeInsets.only(right: 10),
                        height: 199,
                        width: 344,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Color(cards[index].cardBackground),
                        ),

                        //card details
                        child: Stack(
                          children: <Widget>[
                            //circle at top
                            Positioned(
                                top: -20,
                                left: -70,
                                child: SvgPicture.asset(
                                    cards[index].cardElementTop)),

                            //circle at bottom
                            Positioned(
                                bottom: 0,
                                right: 0,
                                child: SvgPicture.asset(
                                    cards[index].cardElementBottom)),

                            //TV card number
                            Positioned(
                              left: 30,
                              top: 50,
                              child: Text(
                                'Card Number',
                                style: GoogleFonts.inter(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white),
                              ),
                            ),

                            //Item cardNumber
                            Positioned(
                              left: 30,
                              top: 65,
                              child: Text(
                                cards[index].cardNumber,
                                style: GoogleFonts.inter(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white),
                              ),
                            ),

                            //IV cardType
                            Positioned(
                                right: 21,
                                top: 25,
                                child: Image.asset(
                                  cards[index].cardType,
                                  height: 27,
                                  width: 27,
                                )),

                            //TV card holder name
                            Positioned(
                              left: 30,
                              bottom: 45,
                              child: Text(
                                'Card Holder Name',
                                style: GoogleFonts.inter(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white),
                              ),
                            ),

                            //Item cardHolderName
                            Positioned(
                              left: 30,
                              bottom: 21,
                              child: Text(
                                cards[index].user,
                                style: GoogleFonts.inter(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white),
                              ),
                            ),

                            //TV card expiry date
                            Positioned(
                              left: 200,
                              bottom: 45,
                              child: Text(
                                'Expiry Date',
                                style: GoogleFonts.inter(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white),
                              ),
                            ),

                            //Item cardExpiry
                            Positioned(
                              left: 200,
                              bottom: 21,
                              child: Text(
                                cards[index].cardExpired,
                                style: GoogleFonts.inter(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
              ),

              //Operation section #################################################
              Padding(
                padding: const EdgeInsets.only(
                    left: 16, top: 10, bottom: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Operations',
                      style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                    ),
                    Row(
                      children: indicatorMap<Widget>(
                        datas,
                        (index, selected) {
                          return Container(
                            alignment: Alignment.centerLeft,
                            height: 10,
                            width: 10,
                            margin: EdgeInsets.only(right: 6),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: current == index
                                    ? kPrimaryColor
                                    : Colors.grey),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),

              Container(
                height: 123,
                child: ListView.builder(
                    itemCount: datas.length,
                    padding: EdgeInsets.only(left: 16),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            current = index;
                          });
                        },
                        child: OperationCard(
                            operation: datas[index].operation,
                            selectedIcon: datas[index].selectedIcon,
                            unselectedIcon: datas[index].unselectedIcon,
                            isSelected: current == index,
                            context: this),
                      );
                    }),
              ),

              //Transaction section ###############################################
              Padding(
                padding: const EdgeInsets.only(
                    left: 16, top: 10, bottom: 10, right: 10),
                child: Text(
                  'Transaction History',
                  style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
              ),

              ListView.builder(
                itemCount: transaction.length,
                padding: EdgeInsets.only(left: 16, right: 16),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Fluttertoast.showToast(
                          msg: transaction[index].name +
                              " of " +
                              transaction[index].amount,
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.black45,
                          textColor: Colors.white,
                          fontSize: 15.0);
                    },
                    child: Container(
                      height: 60,
                      margin: EdgeInsets.only(bottom: 12),
                      padding: EdgeInsets.only(
                          left: 15, right: 15, bottom: 12, top: 12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey,
                              blurRadius: 8,
                              spreadRadius: 2,
                              offset: Offset(5.0, 5.0))
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image:
                                          AssetImage(transaction[index].photo),
                                    )),
                              ),
                              SizedBox(width: 12),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    transaction[index].name,
                                    style: GoogleFonts.inter(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black),
                                  ),
                                  Text(
                                    transaction[index].date,
                                    style: GoogleFonts.inter(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black54),
                                  ),
                                ],
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                transaction[index].amount,
                                style: GoogleFonts.inter(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.blue),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class menuIcons extends StatelessWidget {
  final IconData icon;
  const menuIcons({Key? key, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      color: Colors.white,
      size: 30,
    );
  }
}

class OperationCard extends StatefulWidget {
  final String operation;
  final String selectedIcon;
  final String unselectedIcon;
  final bool isSelected;
  _HomeScreenState context;

  OperationCard(
      {required this.operation,
      required this.selectedIcon,
      required this.unselectedIcon,
      required this.isSelected,
      required this.context});

  @override
  _OperationCardState createState() => _OperationCardState();
}

class _OperationCardState extends State<OperationCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10, top: 5),
      child: Container(
        margin: EdgeInsets.only(right: 16),
        height: 123,
        width: 123,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: Colors.grey,
                  blurRadius: 8,
                  spreadRadius: 2,
                  offset: Offset(5.0, 5.0))
            ],
            borderRadius: BorderRadius.circular(15),
            color: widget.isSelected ? kPrimaryColor : Colors.white),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SvgPicture.asset(widget.isSelected
                ? widget.selectedIcon
                : widget.unselectedIcon),
            SizedBox(height: 8),
            Text(
              widget.operation,
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: widget.isSelected ? Colors.white : kPrimaryColor),
            )
          ],
        ),
      ),
    );
  }
}
