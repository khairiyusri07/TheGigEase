import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/wallet_provider.dart';
import 'wallet__main_screen.dart';

class TransferScreen extends StatefulWidget {
  const TransferScreen({Key? key}) : super(key: key);

  @override
  _TransferScreenState createState() => _TransferScreenState();
}

class _TransferScreenState extends State<TransferScreen> {
  int selectedAmount = 0;

  TextEditingController customAmountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final walletProvider = Provider.of<WalletProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Transfer",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.red,
      ),
      body: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            "Transfer to:",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        TextFormField(),
                      ],
                    ),


                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                child: Text(
                  "Amount",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              SizedBox(height: 00),
              //this is the box
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      buildTopUpButton("5"),
                      SizedBox(width: 10),
                      buildTopUpButton("10"),
                      SizedBox(width: 10),
                      buildTopUpButton("20"),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      buildTopUpButton("50"),
                      SizedBox(width: 10),
                      buildTopUpButton("100"),
                      SizedBox(width: 10),
                      buildTopUpButton("200"),
                    ],
                  )
                ],
              ),
              SizedBox(height: 10),
              //enter the amount
              Container(
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.grey
                    )
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                      child: Text(
                        "RM",
                        textAlign: TextAlign.right,
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: "${selectedAmount.toString()}",

                        ),
                        controller: customAmountController,
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          setState(() {
                            selectedAmount = int.tryParse(value) ?? 0;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 1),
              //receipt
              Container(
                height: 80,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey
                  )
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(height: 10,),
                      Text("Transfer Amount: RM$selectedAmount", style: TextStyle(fontWeight: FontWeight.normal),),
                      Text("Total Payment: RM${selectedAmount.toString()}", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                    ],
                  ),
                ),
              ),

            ],
          ),
          Center(
            child: Container(
              width: 350,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(35, 10, 35, 10),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Theme.of(context).primaryColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0))
                  ),
                  child:Text("Transfer Now",  style: TextStyle(color: Colors.white)),
                  onPressed: () {
                    Navigator.pop(context);
                    double transferAmount = selectedAmount.toDouble();
                    // If custom amount is entered, use that instead
                    if (customAmountController.text.isNotEmpty) {
                      transferAmount = double.tryParse(customAmountController.text) ?? 0.0;
                    }
                    _transferSuccessAllert(context);
                    // Check if withdrawal amount is less than balance
                    if (transferAmount > walletProvider.balance) {
                      // Display an error message
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content: Text('Insuficience Balance in your account'),
                            duration: Duration(seconds: 2)
                        ),

                      );
                    } else {
                      walletProvider.Transfer(transferAmount.toDouble());
                    }

                  },
                ),
              ),

            ),
          ),
        ],
      ),


    );
  }

  Widget buildTopUpButton(String amount) {
    bool isSelected = selectedAmount == int.parse(amount);
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedAmount = int.parse(amount);
          customAmountController.clear();
        });
      },
      child: Container(
        height: 90,
        width: 90,
        decoration: BoxDecoration(
          border: Border.all(
              color: isSelected ? Theme.of(context).primaryColor : Colors.grey,
              width: 1.5),
        ),
        alignment: Alignment.center,
        child: Text(
          amount,
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: isSelected ? Theme.of(context).primaryColor
                : Colors.grey,),
        ),
      ),
    );
  }
  void _transferSuccessAllert (BuildContext context){
    showDialog(
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
            title: const Text("Transfer"),
            content: Container(
              height: 80,
              child: Column(
                children: [
                  Text(
                    "RM ${selectedAmount.toString()} has been deducted from your account",
                    style: const TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 18,
                    ),
                  ),

                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Close"),
              ),
            ],


          );
        });

  }
}
