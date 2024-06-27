import 'dart:async';
import 'package:universal_html/js.dart' as js;
import "package:intl/intl.dart";
import 'package:flutter/material.dart';
import 'package:live_exchange_rate_converter/components/responsive_widget.dart';
import 'package:session_storage/session_storage.dart';
import 'package:live_exchange_rate_converter/api.dart';
import 'package:live_exchange_rate_converter/components.dart';
import 'package:live_exchange_rate_converter/components/themed_textbox.dart';

void main() {
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Currency Converter - Made with love by Jeremy Soh & Powered by flutter web',
      theme: ThemeData(
        fontFamily: "Overpass",
        useMaterial3: true,
        visualDensity: VisualDensity.adaptivePlatformDensity
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  String selectedAmtValue = "sgd";
  String selectedConvertToValue = "usd";
  NumberFormat currencyFormatter = NumberFormat("#,##0.00", "en_US");
  TextEditingController amtValInputController = TextEditingController(text: "100.00");
  TextEditingController convertedToValInputController = TextEditingController();
  late Future<CurrencyInfo> currencyInfo;
  final session = SessionStorage();
  bool isRefreshingRates = false;

  @override
  void initState() {
    currencyInfo = getCurrencyInfo();
    debugPrint("Session: ${session['$selectedAmtValue-to-$selectedConvertToValue']}");
    if(session['$selectedAmtValue-to-$selectedConvertToValue'] == null){
      getRates(baseCurrency: selectedAmtValue, targetCurrency: selectedConvertToValue).then((value){
        session['$selectedAmtValue-to-$selectedConvertToValue'] = value.toString();
      });
    }


    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;  
     
    void quickSelectAmount(int selectedAmt){
      setState(() {
        amtValInputController.text = currencyFormatter.format(selectedAmt);
      });
    }

//TODO: -> functions, and fix swap

    return Stack(
      children: [
        Scaffold( //TODO: Change back to no responsive for bg color
          backgroundColor: ResponsiveWidget.isMaxScreen(context) 
                  ? const Color(0xff010059)
                  : ResponsiveWidget.isLargeScreen(context)
                    ? Colors.pink
                    : ResponsiveWidget.isMediumScreen(context)
                      ? Colors.purple
                      : ResponsiveWidget.isSmallScreen(context)
                        ? Colors.blue
                        : Colors.green,
          body: Padding(
            padding: ResponsiveWidget.isMaxScreen(context) 
                  ? EdgeInsets.symmetric(vertical: screenSize.height * 0.125)
                  : ResponsiveWidget.isLargeScreen(context)
                    ? EdgeInsets.symmetric(vertical: screenSize.height * 0.175)
                    : ResponsiveWidget.isMediumScreen(context)
                      ? EdgeInsets.symmetric(vertical: screenSize.height * 0.2125)
                      : EdgeInsets.symmetric(vertical: screenSize.height * 0.1),
            child: Center(
              child: Container(
                padding: ResponsiveWidget.isMaxScreen(context) 
                  ? const EdgeInsets.fromLTRB(150, 0, 150, 0)
                  : ResponsiveWidget.isLargeScreen(context)
                    ? const EdgeInsets.fromLTRB(115, 35, 115,50)
                    : ResponsiveWidget.isMediumScreen(context)
                      ? const EdgeInsets.fromLTRB(40, 35, 40, 35)
                      : ResponsiveWidget.isSmallScreen(context)
                        ? const EdgeInsets.fromLTRB(15, 35, 15, 35)
                        : const EdgeInsets.fromLTRB(10, 35, 10, 35),
                constraints:ResponsiveWidget.isMaxScreen(context) 
                  ? BoxConstraints(maxWidth: screenSize.width / 1.375)
                  : ResponsiveWidget.isLargeScreen(context)
                    ? BoxConstraints(maxWidth: screenSize.width / 1.25)
                    : BoxConstraints(maxWidth: screenSize.width / 1.125), 
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: AssetImage("assets/images/background.png"),
                    // fit: BoxFit.cover,
                    repeat: ImageRepeat.repeat
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(25)),
                  border: Border.all(color: const Color(0xffDBB86B), width: 2),
                  color: const Color(0xff1C1F7A).withOpacity(1),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xffFDFBF6).withOpacity(0.25),
                      spreadRadius: 2,
                      blurRadius: 25,
                      offset: const Offset(0, 0), // changes position of shadow
                    )
                  ]
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppComponent.appTitle('CURRENCY CONVERTER'), 
                      SizedBox(
                        height: ResponsiveWidget.isMaxScreen(context)
                        ? 35
                        : ResponsiveWidget.isLargeScreen(context)
                          ? 35
                          : ResponsiveWidget.isMediumScreen(context) 
                            ? 15
                            : null
                      ),
                      AppComponent.quickSelections(selectedAmtValue, quickSelectAmount),
                      SizedBox(
                        height: ResponsiveWidget.isMaxScreen(context)
                        ? 35
                        : ResponsiveWidget.isLargeScreen(context)
                          ? 35
                          : ResponsiveWidget.isMediumScreen(context) 
                            ? 15
                            : 25
                      ),
                      Wrap(
                        alignment: WrapAlignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ThemedTextBox(
                                textController: amtValInputController,
                                labelText: "Amount", 
                                textboxInputType: TextInputType.number,
                                textAlign: TextAlign.right,
                                prefix:AppComponent.currencySelection(selectedAmtValue, (value) {  
                                  setState(() {
                                    selectedAmtValue = value!;
                                  });
                                }),
                                onTextUpdate: (value) {
                                
                                },
                              ),
                              
                              (ResponsiveWidget.isSmallScreen(context) || ResponsiveWidget.isTinyScreen(context))
                              ? const SizedBox.shrink()
                              : isRefreshingRates 
                                ? Center(
                                    child: Container(width: 10, height: 35, padding: const EdgeInsets.fromLTRB(0,10,0,15), 
                                      child: const CircularProgressIndicator(strokeWidth: 2)
                                    )
                                  )
                                : (session['$selectedAmtValue-to-$selectedConvertToValue'] == null 
                                    && session['$selectedConvertToValue-to-$selectedAmtValue'] == null)
                                  ? FutureBuilder(
                                      future: getRates(baseCurrency: selectedAmtValue, targetCurrency: selectedConvertToValue), 
                                      builder:(context, snapshot) {
                                        if(snapshot.hasError){
                                          return Center(
                                            child: Container(width: 10, height: 35, padding: const EdgeInsets.fromLTRB(0,10,0,15), 
                                              child: const CircularProgressIndicator(strokeWidth: 2)
                                            )
                                          );
                                        }
                                        else{
                                          if(snapshot.hasData){ 
                                            session['$selectedAmtValue-to-$selectedConvertToValue'] = snapshot.data!.toStringAsFixed(4);
                                            session['$selectedConvertToValue-to-$selectedAmtValue'] = (1/snapshot.data!).toStringAsFixed(4);
                                            return Text("1 $selectedAmtValue = ${
                                              double.parse(session['$selectedAmtValue-to-$selectedConvertToValue']!).toStringAsFixed(4)
                                            } $selectedConvertToValue", 
                                              textAlign: TextAlign.left, 
                                              style: const TextStyle(fontWeight: FontWeight.w400,color: Color(0xffFDFBF6), fontFamily: "Overpass", fontSize: 14, height: 2.5),
                                            );
                                          }
                                          else{
                                            return Center(
                                              child: Container(width: 10, height: 35, padding: const EdgeInsets.fromLTRB(0,10,0,15), 
                                                child: const CircularProgressIndicator(strokeWidth: 2)
                                              )
                                            );
                                          }
                                        }
                                      }
                                    )
                                  : Text("1 $selectedAmtValue = ${
                                      double.parse(
                                        (session['$selectedAmtValue-to-$selectedConvertToValue'] 
                                          ?? ['$selectedConvertToValue-to-$selectedAmtValue']
                                        ) as String
                                      ).toStringAsFixed(4)
                                      
                                    } $selectedConvertToValue", 
                                      textAlign: TextAlign.left, 
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w400,color: Color(0xffFDFBF6), fontFamily: "Overpass", fontSize: 14, height: 2.5
                                      )
                                    ),
                                  
                              (ResponsiveWidget.isSmallScreen(context) || ResponsiveWidget.isTinyScreen(context))
                              ? const SizedBox.shrink()
                              : RichText(
                                  text:TextSpan(
                                    children:[
                                      const TextSpan(
                                        text:"Live rates as at ", 
                                        style: TextStyle(color: Color(0xffFDFBF6), fontFamily: "Overpass", fontWeight: FontWeight.w400, fontSize: 14, height: 0.75)
                                      ),
                                      TextSpan(
                                        text:DateFormat('dd MMM yyyy').format(DateTime.now()), 
                                        style: const TextStyle(color: Color(0xffDBB86B), fontFamily: "Overpass", fontWeight: FontWeight.w600, fontSize: 14, height: 0.75)
                                      )
                                    ],
                                  )
                                ),
                                
                                
                              SizedBox(
                                height: (ResponsiveWidget.isSmallScreen(context) || ResponsiveWidget.isTinyScreen(context)) 
                                  ? 0 
                                  : screenSize.height * 0.025
                              ),
                            ]
                          ),
                          SizedBox(
                            width: ResponsiveWidget.isMaxScreen(context)
                            ? 10 
                            : ResponsiveWidget.isLargeScreen(context)
                              ? 10
                              : 5
                          ),
                          AppComponent.swapCurrencyButton(() {
                            setState(() {
                              isRefreshingRates = true;
                              String tempStore = selectedAmtValue;
                              selectedAmtValue = selectedConvertToValue;
                              selectedConvertToValue = tempStore;
                              Timer(const Duration(seconds: 1), () {
                                setState(() {
                                  isRefreshingRates = false;
                                });
                              });
                            }); 
                          }),
                          SizedBox(
                            width: ResponsiveWidget.isMaxScreen(context)
                            ? 10 
                            : ResponsiveWidget.isLargeScreen(context)
                              ? 10
                              : 5
                          ),
                          ThemedTextBox(
                            onTextUpdate:(p0) {
                              
                            },
                            textController: convertedToValInputController = TextEditingController(
                              text: "100.00" 
                            ),
                            labelText: "Converted", 
                            textboxInputType: TextInputType.number,
                            textAlign: TextAlign.right,
                            prefix: AppComponent.currencySelection(selectedConvertToValue, (value) { 
                              setState(() {
                                selectedConvertToValue = value!;
                              });
                            })
                          ),
                          (ResponsiveWidget.isSmallScreen(context) || ResponsiveWidget.isTinyScreen(context))
                            ? Padding(
                                padding: ResponsiveWidget.isSmallScreen(context) 
                                  ? const EdgeInsets.fromLTRB(0,0, 50,0) 
                                  : const EdgeInsets.fromLTRB(0,0, 75,0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children:[
                                    isRefreshingRates 
                                    ? Center(
                                        child: Container(width: 10, height: 35, padding: const EdgeInsets.fromLTRB(0,10,0,15), 
                                          child: const CircularProgressIndicator(strokeWidth: 2)
                                        )
                                      )
                                    : (session['$selectedAmtValue-to-$selectedConvertToValue'] == null 
                                        && session['$selectedConvertToValue-to-$selectedAmtValue'] == null)
                                      ? FutureBuilder(
                                          future: getRates(baseCurrency: selectedAmtValue, targetCurrency: selectedConvertToValue), 
                                          builder:(context, snapshot) {
                                            if(snapshot.hasError){
                                              return Center(
                                                child: Container(width: 10, height: 35, padding: const EdgeInsets.fromLTRB(0,10,0,15), 
                                                  child: const CircularProgressIndicator(strokeWidth: 2)
                                                )
                                              );
                                            }
                                            else{
                                              if(snapshot.hasData){ 
                                                session['$selectedAmtValue-to-$selectedConvertToValue'] = snapshot.data!.toStringAsFixed(4);
                                                session['$selectedConvertToValue-to-$selectedAmtValue'] = (1/snapshot.data!).toStringAsFixed(4);
                                                return Text("1 $selectedAmtValue = ${
                                                  double.parse(session['$selectedAmtValue-to-$selectedConvertToValue']!).toStringAsFixed(4)
                                                } $selectedConvertToValue", 
                                                  textAlign: ResponsiveWidget.isSmallScreen(context) ? TextAlign.center : TextAlign.left, 
                                                  style: const TextStyle(fontWeight: FontWeight.w400,color: Color(0xffFDFBF6), fontFamily: "Overpass", fontSize: 14, height: 2.5),
                                                );
                                              }
                                              else{
                                                return Center(
                                                  child: Container(width: 10, height: 35, padding: const EdgeInsets.fromLTRB(0,10,0,15), 
                                                    child: const CircularProgressIndicator(strokeWidth: 2)
                                                  )
                                                );
                                              }
                                            }
                                          }
                                        )
                                      : Text("1 $selectedAmtValue = ${
                                          double.parse(
                                            (session['$selectedAmtValue-to-$selectedConvertToValue'] 
                                              ?? ['$selectedConvertToValue-to-$selectedAmtValue']
                                            ) as String
                                          ).toStringAsFixed(4)
                                          
                                        } $selectedConvertToValue", 
                                          textAlign: ResponsiveWidget.isSmallScreen(context) ? TextAlign.center : TextAlign.left, 
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w400,color: Color(0xffFDFBF6), fontFamily: "Overpass", fontSize: 14, height: 2.5
                                          )
                                        ),
                                    RichText(
                                      text:TextSpan(
                                        children:[
                                          const TextSpan(
                                            text:"Live rates as at ", 
                                            style: TextStyle(color: Color(0xffFDFBF6), fontFamily: "Overpass", fontWeight: FontWeight.w400, fontSize: 14, height: 0.75)
                                          ),
                                          TextSpan(
                                            text:DateFormat('dd MMM yyyy').format(DateTime.now()), 
                                            style: const TextStyle(color: Color(0xffDBB86B), fontFamily: "Overpass", fontWeight: FontWeight.w600, fontSize: 14, height: 0.75)
                                          )
                                        ],
                                      )
                                    ), 
                                    SizedBox(height: (ResponsiveWidget.isSmallScreen(context) || ResponsiveWidget.isTinyScreen(context)) ? screenSize.height * 0.025 : 0)

                                  ] 
                                ),
                            )
                            
                            
                            : const SizedBox.shrink()

                        ],
                      ),
                      AppComponent.generics.linkButton(
                        "Transfer via Wise now ",
                        () { 
                          js.context.callMethod('open', ["https://wise.prf.hn/click/camref:1011l3NYBV/pubref:jdevcc/ar:jdar/destination:http%3A%2F%2Fportfolio.jellydevelops.com%2Fflutter-currency-converter"]); 
                        },
                        hoverBackgroundColor: const Color(0xffDBB86B),
                        hoverBorderColor: const Color(0xff010017),
                        hoverFontColor: const Color(0xff010017),
                      ),
                      SizedBox(height: screenSize.height * 0.0125),
                      SizedBox(
                        width: ResponsiveWidget.isMaxScreen(context) 
                          ? 700
                          : ResponsiveWidget.isLargeScreen(context) 
                            ? 700
                            : ResponsiveWidget.isMediumScreen(context) 
                              ? 550
                              : ResponsiveWidget.isSmallScreen(context)
                                ? 430
                                : 245, 
                        child: Text(
                          "Please note that the live exchange rates provided on this web app are sourced from ExchangeRate-API. These rates are for informational purposes only and may from those provided by other services, including Wise.com. For the most accurate and up-to-date exchange rates tailored to your currency transfer or exchange transactions, we recommend visiting Wise.com directly. You can access their latest rates and services via the affiliated button above.", 
                          style: const TextStyle(fontSize: 12, color: Color(0xffFDFBF6)), 
                          textAlign: ResponsiveWidget.isTinyScreen(context) ? TextAlign.justify : TextAlign.center
                        )
                      ),

                      
                    ],
                  ),
                ),
              )
            ),
          )
        )

      ],
    );
    
    
  }
}



