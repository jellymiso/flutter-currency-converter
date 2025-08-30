import 'dart:async';
import 'package:live_exchange_rate_converter/components/currency_selection.dart';
import 'package:universal_html/js.dart' as js;
import "package:intl/intl.dart";
import 'package:flutter/material.dart';
import 'package:live_exchange_rate_converter/components/responsive_widget.dart';
import 'package:session_storage/session_storage.dart';
import 'package:live_exchange_rate_converter/api.dart';
import 'package:live_exchange_rate_converter/components.dart';
import 'package:live_exchange_rate_converter/components/themed_textbox.dart';

void main() {
  final session = SessionStorage();
  //TODO: uncomment below and fix api related error
  if(session['sgd-to-usd'] == null){
    // getRates(baseCurrency: "sgd", targetCurrency: "usd").then((value){
    //   session['sgd-to-usd'] = value.toString();
    //   session['usd-to-sgd'] = (1/value).toStringAsFixed(8);
      runApp(const MyApp());
    // });
  }
  else{
    runApp(const MyApp());
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Live Currency Converter',
      
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

  String baseCurrency = "sgd";
  String targetCurrency = "usd";
  NumberFormat currencyFormatter = NumberFormat("#,##0.00", "en_US");
  TextEditingController amtValInputController = TextEditingController(text: "100.00");
  TextEditingController convertedToValInputController = TextEditingController();
  final session = SessionStorage();
  bool isRefreshingRates = false;

  @override
  void initState() {

    if(session['sgd-to-usd'] == null){
      setState(() {
        getRates(baseCurrency: baseCurrency, targetCurrency: targetCurrency).then((value){
          session['sgd-to-usd'] = value.toString();
          session['sgd-to-usd'] = (1/value).toStringAsFixed(8);
        });
      });
    }

    amtValInputController.addListener((){
      setState(() {
        if(session['$baseCurrency-to-$targetCurrency'] != null){
          convertedToValInputController.text = (double.parse(amtValInputController.text.replaceAll(",", "")) * double.parse(session['$baseCurrency-to-$targetCurrency']!)).toStringAsFixed(2);
        }
        else{
          getRates(baseCurrency: baseCurrency, targetCurrency: targetCurrency).then((value){
            convertedToValInputController.text = (double.parse(amtValInputController.text.replaceAll(",", "")) * value).toStringAsFixed(2);
          });
        }
      });
    });
    convertedToValInputController.addListener((){
      setState(() {
        // amtValInputController.text = convertedToValInputController.text.replaceAll(",", "");
      });
    });

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

    void saveRates(String baseCurrency, String targetCurrency, {double? rate}){
      if (rate == null){
          getRates(baseCurrency: baseCurrency, targetCurrency: targetCurrency).then((value){
            session['$baseCurrency-to-$targetCurrency'] = value.toString();
            session['$targetCurrency-to-$baseCurrency'] = (1/value).toStringAsFixed(8);
          });
      }
      else{
        session['$baseCurrency-to-$targetCurrency'] = rate.toString();
        session['$targetCurrency-to-$baseCurrency'] = (1/rate).toStringAsFixed(8);
      }
    }

    String getRatesMessage(){
      double rate = double.parse(session['$baseCurrency-to-$targetCurrency']!);
      return "1 $baseCurrency = ${rate.toString()} $targetCurrency";
    }

//TODO: -> favicons, google analytics, comments, and cleanup, create and change to production key, refractor

//app: https://currency-converter.adaptable.app/
//colors scheme: https://coolors.co/010017-010059-1c1f7a-224ed0-dbb86b-fdfbf6
//api provider: app.exchangerate-api.com
    return Stack(
      children: [
        Scaffold( 
          backgroundColor: const Color(0xff010059),
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
                        height: (ResponsiveWidget.isMaxScreen(context) || ResponsiveWidget.isLargeScreen(context))
                        ? 35
                        : ResponsiveWidget.isMediumScreen(context) 
                          ? 15
                          : null
                      ),
                      AppComponent.quickSelections(baseCurrency, quickSelectAmount),
                      SizedBox(
                        height: (ResponsiveWidget.isMaxScreen(context) || ResponsiveWidget.isLargeScreen(context))
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
                                prefix:CurrencySelection(selectedValue:  baseCurrency, onSelectionChanged: (value) {  
                                  isRefreshingRates = true;
                                  setState(() {
                                    baseCurrency = value!;
                                  });
                                  Timer(const Duration(seconds: 1), () {
                                    setState(() {
                                      isRefreshingRates = false;
                                    });
                                  });
                                  //needed to force update for onchange listener to pickup
                                  amtValInputController.text = "${amtValInputController.text}0";
                                  amtValInputController.text = double.parse(amtValInputController.text.replaceAll(",","")).toStringAsFixed(2);
                                }),
                                onTextUpdate: (value) { },
                              ),
                              
                              (ResponsiveWidget.isSmallScreen(context) || ResponsiveWidget.isTinyScreen(context))
                              ? const SizedBox.shrink()
                              : isRefreshingRates 
                                ? Container(width: 10, height: 35, padding: const EdgeInsets.fromLTRB(0,10,0,15), 
                                    child: const CircularProgressIndicator(strokeWidth: 2)
                                  )
                                : session['$baseCurrency-to-$targetCurrency'] == null
                                  ? FutureBuilder(
                                      future: getRates(baseCurrency: baseCurrency, targetCurrency: targetCurrency), 
                                      builder:(context, snapshot) {
                                        if(snapshot.hasError){
                                          return Container(
                                            width: 10, height: 35, 
                                            padding: const EdgeInsets.fromLTRB(0,10,0,15), 
                                            color:Colors.red, 
                                            child: const CircularProgressIndicator(strokeWidth: 2)
                                          );
                                        }
                                        else{
                                          if(snapshot.hasData){ 
                                            saveRates(baseCurrency, targetCurrency, rate: snapshot.data!);
                                                  
                                            return Text(
                                              getRatesMessage(), 
                                              textAlign: TextAlign.left, 
                                              style: const TextStyle(fontWeight: FontWeight.w400,color: Color(0xffFDFBF6), fontFamily: "Overpass", fontSize: 14, height: 2.5),
                                            );
                                          }
                                          else{
                                            return Container(width: 10, height: 35, padding: const EdgeInsets.fromLTRB(0,10,0,15), 
                                              child: const CircularProgressIndicator(strokeWidth: 2)
                                            );
                                          }
                                        }
                                      }
                                    )
                                  : Text(getRatesMessage(), 
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
                                        text: DateFormat('dd MMM yyyy').format(DateTime.now()), 
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
                              String tempStore = baseCurrency;
                              baseCurrency = targetCurrency;
                              targetCurrency = tempStore;

                              Timer(const Duration(seconds: 1), () {
                                setState(() {
                                  isRefreshingRates = false;
                                });
                              });
                              //needed to force update for onchange listener to pickup
                              amtValInputController.text = "${amtValInputController.text}0";
                              amtValInputController.text = double.parse(amtValInputController.text.replaceAll(",","")).toStringAsFixed(2);
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
                            textController: convertedToValInputController.text == "" 
                              ? TextEditingController(
                                  text: 
                                  (
                                  //TODO: if error or value is 0, replace ?? "0" with !
                                    double.parse(amtValInputController.text.replaceAll(",", "")) * double.parse(session['$baseCurrency-to-$targetCurrency'] ?? "0")
                                  ).toStringAsFixed(2)
                              ) 
                              : convertedToValInputController,
                            labelText: "Converted", 
                            textboxInputType: TextInputType.number,
                            textAlign: TextAlign.right,
                            prefix: CurrencySelection(selectedValue:  targetCurrency, onSelectionChanged: (value) { 
                              isRefreshingRates = true;

                              setState(() {
                                targetCurrency = value!;
                                saveRates(baseCurrency, targetCurrency);
                              });

                              Timer(const Duration(seconds: 1), () {
                                setState(() {
                                  isRefreshingRates = false;
                                });
                              });
                              //needed to force update for onchange listener to pickup
                              amtValInputController.text = "${amtValInputController.text}0";
                              amtValInputController.text = double.parse(amtValInputController.text.replaceAll(",","")).toStringAsFixed(2);

                            })
                          ),
                          (ResponsiveWidget.isSmallScreen(context) || ResponsiveWidget.isTinyScreen(context))
                            ? Center(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,

                                  children:[
                                    isRefreshingRates 
                                    ? Container(width: 10, height: 35, padding: const EdgeInsets.fromLTRB(0,10,0,15), 
                                        child: const CircularProgressIndicator(strokeWidth: 2)
                                      )
                                    : (session['$baseCurrency-to-$targetCurrency'] == null 
                                        && session['$targetCurrency-to-$baseCurrency'] == null)
                                      ? FutureBuilder(
                                          future: getRates(baseCurrency: baseCurrency, targetCurrency: targetCurrency), 
                                          builder:(context, snapshot) {
                                            if(snapshot.hasError){
                                              return Container(width: 10, height: 35, padding: const EdgeInsets.fromLTRB(0,10,0,15), 
                                                child: const CircularProgressIndicator(strokeWidth: 2)
                                              );
                                            }
                                            else{
                                              if(snapshot.hasData){ 
                                                saveRates(baseCurrency, targetCurrency, rate: snapshot.data!);

                                                return Text(getRatesMessage(), 
                                                  textAlign: ResponsiveWidget.isSmallScreen(context) ? TextAlign.center : TextAlign.left, 
                                                  style: const TextStyle(fontWeight: FontWeight.w400,color: Color(0xffFDFBF6), fontFamily: "Overpass", fontSize: 14, height: 2.5),
                                                );
                                              }
                                              else{
                                                return Container(width: 10, height: 35, padding: const EdgeInsets.fromLTRB(0,10,0,15), 
                                                  child: const CircularProgressIndicator(strokeWidth: 2)
                                                );
                                              }
                                            }
                                          }
                                        )
                                      : Text(getRatesMessage(), 
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


