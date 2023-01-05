import 'dart:math';

import 'package:flutter/material.dart';

class MortgageApp extends StatefulWidget {
  const MortgageApp({Key? key}) : super(key: key);

  @override
  State<MortgageApp> createState() => _MortgageAppState();
}

class _MortgageAppState extends State<MortgageApp> {
  double _interest = 0.0;
  int _lengthOfLoan = 0;
  double _homePrice = 0.0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.blue, title: Text("Mortage Payments")),
        body: Container(
          child: ListView(
            padding: EdgeInsets.all(10),
            children: <Widget>[
              Container(
                height: 130,
                child: Card(
                  elevation: 10,
                  margin: EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Monthly Payments",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),SizedBox(height: 10,),
                      Text(" ${ ( _homePrice > 0 && _interest > 0.0)
                          ? "\$${calculateMonthlyPayment(_homePrice,
                          _interest, _lengthOfLoan)}" : ""}", )
                    ],
                  ),
                ),
              ),
              Container(
                  padding: EdgeInsets.all(30),
                  child: Column(
                      children: <Widget>[
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            TextField(keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  hintText: "Home", prefixIcon: Icon(Icons.home)), )
                          ],
                        ),
                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text("Length of loan(years)"),
                            Row(
                              children: <Widget>[

                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      if(_lengthOfLoan > 0){
                                        _lengthOfLoan -= 5;
                                      } else {

                                      }
                                    });
                                  },
                                  child: Container(
                                    height: 30,
                                    width: 30,
                                    margin: const EdgeInsets.all(10.0),
                                    decoration: BoxDecoration(color: Colors.grey,
                                      borderRadius: BorderRadius.circular(16),

                                    ),
                                    child: Center(child: Text("-")),


                                  ),
                                ),
                                Text("$_lengthOfLoan"),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      if(_lengthOfLoan > 0){
                                        _lengthOfLoan += 5;
                                      } else {

                                      }
                                    });
                                  },
                                  child: Container(
                                    height: 30,
                                    width: 30,
                                    margin: const EdgeInsets.all(10.0),
                                    decoration: BoxDecoration(color: Colors.grey,
                                      borderRadius: BorderRadius.circular(16),

                                    ),
                                    child: Center(child: Text("+")),

                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                        Row(mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text("Intrest"),
                            Slider(value: _homePrice, onChanged: (value) {

                            },)
                          ],
                        ),
                      ] )
              )],
          ),
        ));
  }

  calculateMonthlyPayment(double homePrice, double interest, int loanLength ) {
    int n = 12 * loanLength;
    double c = interest / 12.0 / 100.0;
    double monthlyPayment = 0.0;

    if (homePrice < 0 || homePrice.toString().isEmpty || homePrice == null) {
      //no go!
      // _homePrice = 0.0;
    }else {
      monthlyPayment = homePrice * c * pow(1 + c, n) / (pow(1 + c, n) - 1);
    }

    return monthlyPayment.toStringAsFixed(2);
  }
}
