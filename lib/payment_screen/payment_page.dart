import 'package:coffee_shop_ui/home_page/text.dart';
import 'package:flutter/material.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  @override
  Widget build(BuildContext context) {
    double sw = MediaQuery.of(context).size.width;
    double sh = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color(0xFF0C0F14),
      body: Container(
        padding: EdgeInsets.all(sw*0.03),
        child: Column(
          children: [
            SizedBox(
              height: sh*0.05,
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: (){
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    width: sw*0.10,
                    height: sh*0.05,
                  // color: Colors.blue,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                        Color(0xFF212747),
                        Color(0xFF0F151D),
                      ],
                       begin: Alignment.topLeft,
                        end:Alignment.bottomRight ,
                    ),
                      borderRadius: BorderRadius.circular(sw*0.03)
                  ),
                    child: Icon(Icons.arrow_back_ios_new_outlined,color: Colors.grey[600],),
                  ),
                ),
                SizedBox(width:sw*0.245),
                Data(text: "Payment",color: Colors.white,size: sw*0.075,)
              ],
            ),
            SizedBox(height: sh*0.03,),

            Container(
              width: double.infinity,
              height: sh*0.34,
              decoration: BoxDecoration(
              // color: Colors.blue ,
                borderRadius: BorderRadius.circular(sw*0.06),
                border: Border.all(
                  color: Colors.orange,
                  width: sw*0.005
                ),
              ),
              padding: EdgeInsets.all(sw*0.03),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Data(text: "Credit Card",color: Colors.white,size: sw*0.045,),
                  SizedBox(height: sh*0.016,),
                  Container(
                    margin: EdgeInsets.only(left: sw*0.005,right: sw*0.005,),
                    padding: EdgeInsets.all(sw*0.02),
                    height: sh*0.26,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                          Color(0xFF212747),
                          Color(0xFF0F151D),
                        ],
                          begin: Alignment.topLeft,
                          end:Alignment.bottomRight ,
                        ),
                        borderRadius: BorderRadius.circular(sw*0.03)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: sw*0.10,
                              height: sh*0.04,
                              margin: EdgeInsets.only(top: sw*0.01,left: sw*0.01),
                              padding: EdgeInsets.zero,
                              child: Image.asset("assets/images/chip.png",fit: BoxFit.cover,),
                            ),
                            Container(
                              width: sw*0.2,
                              height: sh*0.04,
                              margin: EdgeInsets.only(right: sw*0.01),
                              padding: EdgeInsets.zero,
                              child: Image.asset("assets/images/visa.png",fit: BoxFit.cover,),
                            )
                          ],
                        ),
                        SizedBox(height: sh*0.055,),
                        Data(text: " 3 8 9 7   8 9 2 3   6 7 4 5   4 6 3 8",color: Colors.white,size: sw*0.05,),
                        SizedBox(height: sh*0.067,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,

                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Data(text: "Card Holder Name",color: Colors.grey,),
                                SizedBox(height: sh*0.005,),
                                Data(text: "Muhammad Arslan",color: Colors.white,size: sw*0.05,)
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Data(text: "Expiry Date",color: Colors.grey,),
                                SizedBox(height: sh*0.005,),
                                Data(text: "02/30",color: Colors.white,size: sw*0.05,)
                              ],
                            )

                          ],
                        )
                        
                      ],
                    ),
                  )

                ],
              ),
            ),
            SizedBox(height: sh*0.02,),
            Container(
              width: double.infinity,
              height: sh*0.09,
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Color(0xFF212747),
                    Color(0xFF0F151D),
                  ],
                    begin: Alignment.topLeft,
                    end:Alignment.bottomRight ,
                  ),
                  borderRadius: BorderRadius.circular(sw*0.12)
              ),
              child: Center(
                child: ListTile(
                  leading: Container(
                      width: sw*0.1,
                      height: sh*0.05,

                      child: Image.asset("assets/images/wallet.png",fit: BoxFit.cover,)),
                  title: Data(text: "Wallet",color: Colors.white,size: sw*0.048,),
                  trailing: Data(text: "\$ "+"100.50",color: Colors.white,size: sw*0.045,),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
