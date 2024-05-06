import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CalculatorView extends StatefulWidget {
  const CalculatorView({super.key});
  

  @override
  State<CalculatorView> createState() => _CalculatorViewState();
}

class _CalculatorViewState extends State<CalculatorView> {

  int x = 0;
  int y = 0;
  num z = 0;

  final displayOneController = TextEditingController();
  final displayTwoController = TextEditingController();

  late final AppLifecycleListener _listener;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    TextEditingController displayOneController = TextEditingController();
    displayOneController.text = x.toString();
    TextEditingController displayTwoController = TextEditingController();
    displayTwoController.text = y.toString();


    _listener = AppLifecycleListener(

    onShow : _onShow,
    onHide : _onHide,
    onResume : _onResume,
    onPause : _onPause,
    onDetach : _onDetach,
    onInactive : _onInactive,
    onRestart : _onRestart,
    onStateChange : _onStateChange,
    //onExitRequested : _onExitRequested, 

    );
  }

  void _onShow() => print("onShow Called");
  void _onHide() => print("onHide Called");
  void _onResume() => print("onResume Called");
  void _onPause() => print("onPause Called");
  void _onDetach() => print("onDetach Called");
  void _onInactive() => print("onInactive Called");
  void _onRestart() => print("onRestart Called");
  void _onStateChange(AppLifecycleState state) {
    print("onStateChange Called: $state");
  }
  // void _onExitRequested() => print("onExitRequested Called");


  @override
  void dispose() {
    // TODO: implement dispose
    _listener.dispose();
    displayOneController.dispose();
    displayTwoController.dispose();
    super.dispose();
    
  }


  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(32.0),
      child:  Column(
        children: [
          CalculatorDisplay(hint: "Enter First Number", controller: displayOneController),
          const SizedBox(
            height: 30,
          ),
          CalculatorDisplay(hint: "Enter Second Number", controller: displayTwoController),

          const SizedBox(
            height: 30,
          ),
          
          Text(z.toString(), style: const TextStyle(
            fontSize: 60,
            fontWeight: FontWeight.bold,
          ),),
          

          const Spacer(),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: (){
                  setState(() {
                    z = num.tryParse(displayOneController.text)! + num.tryParse(displayTwoController.text)!;
                  });
                  
                },
                child: const Icon(CupertinoIcons.add),
              ),
              ElevatedButton(
                onPressed: (){
                  setState(() {
                    z = num.tryParse(displayOneController.text)! - num.tryParse(displayTwoController.text)!;
                  });
                },
                child: const Icon(CupertinoIcons.minus),
              ),
              ElevatedButton(
                onPressed: (){
                  setState(() {
                    z = num.tryParse(displayOneController.text)! * num.tryParse(displayTwoController.text)!;
                  });
                },
                child: const Icon(CupertinoIcons.multiply),
              ),
              ElevatedButton(
                onPressed: (){
                  setState(() {
                    z = num.tryParse(displayOneController.text)! / num.tryParse(displayTwoController.text)!;
                  });
                },
                child: const Icon(CupertinoIcons.divide),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),

          FloatingActionButton.extended(
            onPressed: (){
              setState(() {
                x = 0;
                y = 0;
                displayOneController.clear();
                displayTwoController.clear();
                z = 0;
              });
              
            },
            label: const Text("Clear"),
          )
        ],
      ),
    );
  }
}

class CalculatorDisplay extends StatelessWidget {
  const CalculatorDisplay({
    super.key,
    this.hint = "Enter a number",
    required this.controller
  });

  final String? hint;

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      autofocus: true,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.black,
            width: 3.0,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.black,
            width: 3.0,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        hintText: hint,
        hintStyle: const TextStyle(
          color: Colors.black,
        ),
        )
      );
  }
}