import 'package:flutter/material.dart';
import 'package:live_exchange_rate_converter/components/responsive_widget.dart';

class QuickSelections extends StatefulWidget {

  final String selectedCurrencyCode;
  final void Function(int) quickSelectAmtFunc;
  const QuickSelections({super.key, required this.selectedCurrencyCode, required this.quickSelectAmtFunc});
  

  @override
  State<QuickSelections> createState() => _QuickSelectionsState();
}

class _QuickSelectionsState extends State<QuickSelections> {

  Color textColor1 = const Color(0xff1A2130);
  Color textColor10 = const Color(0xff1A2130);
  Color textColor100 = const Color(0xff1A2130);
  Color textColor1000 = const Color(0xff1A2130);
  Color textColor10000 = const Color(0xff1A2130);
  Color textColor100000 = const Color(0xff1A2130);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Column(
      children: [

        ResponsiveWidget.isSmallScreen(context) || ResponsiveWidget.isTinyScreen(context)
        ? Container(
            padding: const EdgeInsets.fromLTRB(0,25,0,0),
            child:const Text("QUICK SELECT ", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24, color: Color(0xffFDFBF6))) ,
          )
        : const SizedBox.shrink(), 
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          alignment: WrapAlignment.center,
          runSpacing: 5,
          children: [

            ResponsiveWidget.isSmallScreen(context) || ResponsiveWidget.isTinyScreen(context)
            ? const SizedBox.shrink()
            : const Text("QUICK SELECT: ", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 12, color: Color(0xffFDFBF6))),
            SizedBox(width: ResponsiveWidget.isTinyScreen(context) ? 1 : screenSize.width / 250),
            OutlinedButton(
              onPressed: (){
                widget.quickSelectAmtFunc(1);
              }, 
              onHover: (hovering) {
                setState(() {
                  if (hovering){
                    textColor1 = const Color(0xffFDFFE2);
                  }
                  else{
                    textColor1 = const Color(0xff1A2130);
                  }
                });
              },
              style: ButtonStyle(
                side: const MaterialStatePropertyAll(BorderSide(color: Color(0xff010059), width: 2)),
                padding: const MaterialStatePropertyAll(EdgeInsets.symmetric(horizontal: 0)),
                backgroundColor: MaterialStateProperty.resolveWith<Color>(
                  (Set<MaterialState> states) {
                  if (states.contains(MaterialState.hovered)) {
                  return const Color(0xff224ED0).withOpacity(0.85); // null throus error in flutter 2.2+.
                  }
                    return const Color(0xffDBB86B).withOpacity(0.85);
                  }
                )
              ), 
              child: Text("1 ${widget.selectedCurrencyCode.toUpperCase()}", style: TextStyle(fontSize: 12,color: textColor1))
            ),
            SizedBox(width: ResponsiveWidget.isTinyScreen(context) ? 1 : screenSize.width / 250),
            OutlinedButton(
              onPressed: (){
                widget.quickSelectAmtFunc(10);
              }, 
              onHover: (hovering) {
                setState(() {
                  if (hovering){
                    textColor10 = const Color(0xffFDFFE2);
                  }
                  else{
                    textColor10 = const Color(0xff1A2130);
                  }
                });
              },
              style: ButtonStyle(
                side: const MaterialStatePropertyAll(BorderSide(color: Color(0xff010059), width: 2)),
                padding: const MaterialStatePropertyAll(EdgeInsets.symmetric(horizontal: 10)),
                backgroundColor: MaterialStateProperty.resolveWith<Color>(
                  (Set<MaterialState> states) {
                  if (states.contains(MaterialState.hovered)) {
                  return const Color(0xff224ED0).withOpacity(0.85); // null throus error in flutter 2.2+.
                  }
                    return const Color(0xffDBB86B).withOpacity(0.85);
                  }
                )), 
              child: Text("10 ${widget.selectedCurrencyCode.toUpperCase()}", style: TextStyle(fontSize: 12,color: textColor10))
            ),
            SizedBox(width: ResponsiveWidget.isTinyScreen(context) ? 1 : screenSize.width / 250),
            OutlinedButton(
              onPressed: (){
                widget.quickSelectAmtFunc(100);
              }, 
              onHover: (hovering) {
                setState(() {
                  if (hovering){
                    textColor100 = const Color(0xffFDFFE2);
                  }
                  else{
                    textColor100 = const Color(0xff1A2130);
                  }
                });
              },
              style: ButtonStyle(
                side: const MaterialStatePropertyAll(BorderSide(color: Color(0xff010059), width: 2)),
                padding: const MaterialStatePropertyAll(EdgeInsets.symmetric(horizontal: 10)),
                backgroundColor: MaterialStateProperty.resolveWith<Color>(
                  (Set<MaterialState> states) {
                  if (states.contains(MaterialState.hovered)) {
                  return const Color(0xff224ED0).withOpacity(0.85); // null throus error in flutter 2.2+.
                  }
                    return const Color(0xffDBB86B).withOpacity(0.85);
                  }
                )), 
              child: Text("100 ${widget.selectedCurrencyCode.toUpperCase()}", style: TextStyle(fontSize: 12,color: textColor100))
            ),
            SizedBox(width: ResponsiveWidget.isTinyScreen(context) ? 1 : screenSize.width / 250),
            OutlinedButton(
              onPressed: (){
                widget.quickSelectAmtFunc(1000);
              }, 
              onHover: (hovering) {
                setState(() {
                  if (hovering){
                    textColor1000 = const Color(0xffFDFFE2);
                  }
                  else{
                    textColor1000 = const Color(0xff1A2130);
                  }
                });
              },
              style: ButtonStyle(
                side: const MaterialStatePropertyAll(BorderSide(color: Color(0xff010059), width: 2)),
                padding: const MaterialStatePropertyAll(EdgeInsets.symmetric(horizontal: 10)),
                backgroundColor: MaterialStateProperty.resolveWith<Color>(
                  (Set<MaterialState> states) {
                  if (states.contains(MaterialState.hovered)) {
                  return const Color(0xff224ED0).withOpacity(0.85); // null throus error in flutter 2.2+.
                  }
                    return const Color(0xffDBB86B).withOpacity(0.85);
                  }
                )), 
              child: Text("1,000 ${widget.selectedCurrencyCode.toUpperCase()}", style: TextStyle(fontSize: 12,color: textColor1000))
            ),
            SizedBox(width: ResponsiveWidget.isTinyScreen(context) ? 1 : screenSize.width / 250),
            OutlinedButton(
              onPressed: (){
                widget.quickSelectAmtFunc(10000);
              }, 
              onHover: (hovering) {
                setState(() {
                  if (hovering){
                    textColor10000 = const Color(0xffFDFFE2);
                  }
                  else{
                    textColor10000 = const Color(0xff1A2130);
                  }
                });
              },
              style: ButtonStyle(
                side: const MaterialStatePropertyAll(BorderSide(color: Color(0xff010059), width: 2)),
                padding: const MaterialStatePropertyAll(EdgeInsets.symmetric(horizontal: 10)),
                backgroundColor: MaterialStateProperty.resolveWith<Color>(
                  (Set<MaterialState> states) {
                  if (states.contains(MaterialState.hovered)) {
                  return const Color(0xff224ED0).withOpacity(0.85); // null throus error in flutter 2.2+.
                  }
                    return const Color(0xffDBB86B).withOpacity(0.85);
                  }
                )), 
              child: Text("10,000 ${widget.selectedCurrencyCode.toUpperCase()}", style: TextStyle(fontSize: 12,color: textColor10000))
            ),
            SizedBox(width: ResponsiveWidget.isTinyScreen(context) ? 1 : screenSize.width / 250),
            OutlinedButton(
              onPressed: (){
                widget.quickSelectAmtFunc(100000);
              }, 
              onHover: (hovering) {
                setState(() {
                  if (hovering){
                    textColor100000 = const Color(0xffFDFFE2);
                  }
                  else{
                    textColor100000 = const Color(0xff1A2130);
                  }
                });
              },
              style: ButtonStyle(
                side: const MaterialStatePropertyAll(BorderSide(color: Color(0xff010059), width: 2)),
                padding: const MaterialStatePropertyAll(EdgeInsets.symmetric(horizontal: 10)),
                backgroundColor: MaterialStateProperty.resolveWith<Color>(
                  (Set<MaterialState> states) {
                  if (states.contains(MaterialState.hovered)) {
                  return const Color(0xff224ED0).withOpacity(0.85); // null throus error in flutter 2.2+.
                  }
                    return const Color(0xffDBB86B).withOpacity(0.85);
                  }
                )), 
              child: Text("100,000 ${widget.selectedCurrencyCode.toUpperCase()}", style: TextStyle(fontSize: 12,color: textColor100000))
            ),
          ],
        )
      ]
    );
  }

}