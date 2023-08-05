import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => MyAppUi();
}

class MyAppUi extends State<MyApp> {
  Map<String, double> number = {"First": 0, "Second": 0};
  double result = 0;

  final fieldText1 = TextEditingController();
  final fieldText2 = TextEditingController();

  numberInsert(key, inputValue) {
    number.update(key, (value) => double.parse(inputValue));
  }

// =================================================================

  Map<String, double> discount = {"First": 0, "Second": 0};
  double discountResult = 0;
  double discountAmount = 0;

  final fieldText3 = TextEditingController();
  final fieldText4 = TextEditingController();

  discountNumberInsert(key, inputValue) {
    discount.update(key, (value) => double.parse(inputValue));
  }

// =================================================================
  @override
  Widget build(BuildContext context) {
    // Function
    //----(+)
    addAllNumber() {
      setState(() {
        result = number["First"]! + number["Second"]!;
      });
    }

    //----(-)
    subAllNumber() {
      setState(() {
        if (number["First"]! < number["Second"]!) {
          result = number["Second"]! - number["First"]!;
        } else {
          result = number["First"]! - number["Second"]!;
        }
      });
    }

    //----(*)
    malAllNumber() {
      setState(() {
        result = number["First"]! * number["Second"]!;
      });
    }

    //----(/)
    divAllNumber() {
      setState(() {
        result = number["First"]! / number["Second"]!;
      });
    }

    //----(C)
    clcAllNumber() {
      setState(() {
        result = 0;
        number["First"] = 0;
        number["Second"] = 0;
      });
    }

    //======================== Discount ===========================
    productDiscount() {
      discountAmount = (discount["Second"]! * discount["First"]!) / 100;
      setState(() {
        discountResult = discount["First"]! - discountAmount;
      });
    }

    disClcNumber() {
      setState(() {
        discountResult = 0;
        discount["First"] = 0;
        discount["Second"] = 0;
      });
    }

    //============================================================
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.blue.shade200,
        body: Padding(
          padding: const EdgeInsets.only(top: 50, left: 15, right: 15),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Text("Basic Calculator",
                    style: GoogleFonts.aldrich(
                        textStyle: const TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold))),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  cursorColor: Colors.black,
                  style: const TextStyle(
                      fontSize: 25, fontWeight: FontWeight.w500),
                  controller: fieldText1,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.black12,
                      hintText: "First Number",
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.blue, width: 2),
                          borderRadius: BorderRadius.circular(15.0)),
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.white, width: 3),
                          borderRadius: BorderRadius.circular(15.0))),
                  onChanged: (value1) {
                    numberInsert("First", value1);
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  cursorColor: Colors.black,
                  style: const TextStyle(
                      fontSize: 25, fontWeight: FontWeight.w500),
                  controller: fieldText2,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.black12,
                      hintText: "Second Number",
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.blue, width: 2),
                          borderRadius: BorderRadius.circular(15.0)),
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.white, width: 3),
                          borderRadius: BorderRadius.circular(15.0))),
                  onChanged: (value2) {
                    numberInsert("Second", value2);
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Result : ${result.toStringAsFixed(1)}",
                  style: GoogleFonts.robotoSlab(
                      textStyle: const TextStyle(
                          fontSize: 25, fontWeight: FontWeight.w500)),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    ElevatedButton(
                        style: ButtonStyle(
                          overlayColor:
                              MaterialStateProperty.all(Colors.black12),
                          elevation: MaterialStateProperty.all(25),
                          shadowColor: MaterialStateProperty.all(Colors.green),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.green),
                        ),
                        onPressed: () {
                          addAllNumber();
                        },
                        child: const Text(
                          "+",
                          style: TextStyle(fontSize: 50),
                        )),
                    const SizedBox(
                      width: 8,
                    ),
                    ElevatedButton(
                        style: ButtonStyle(
                          overlayColor:
                              MaterialStateProperty.all(Colors.black12),
                          elevation: MaterialStateProperty.all(25),
                          shadowColor: MaterialStateProperty.all(Colors.orange),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.orange),
                        ),
                        onPressed: () {
                          subAllNumber();
                        },
                        child: const Text(
                          "-",
                          style: TextStyle(fontSize: 50),
                        )),
                    const SizedBox(
                      width: 8,
                    ),
                    ElevatedButton(
                        style: ButtonStyle(
                          overlayColor:
                              MaterialStateProperty.all(Colors.black12),
                          elevation: MaterialStateProperty.all(25),
                          shadowColor: MaterialStateProperty.all(Colors.purple),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.purple),
                        ),
                        onPressed: () {
                          malAllNumber();
                        },
                        child: const Text(
                          "*",
                          style: TextStyle(fontSize: 50),
                        )),
                    const SizedBox(
                      width: 8,
                    ),
                    ElevatedButton(
                        style: ButtonStyle(
                          overlayColor:
                              MaterialStateProperty.all(Colors.black12),
                          elevation: MaterialStateProperty.all(25),
                          shadowColor: MaterialStateProperty.all(Colors.black),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.black),
                        ),
                        onPressed: () {
                          divAllNumber();
                        },
                        child: const Text(
                          "/",
                          style: TextStyle(fontSize: 50),
                        )),
                    const SizedBox(
                      width: 8,
                    ),
                    ElevatedButton(
                        style: ButtonStyle(
                          overlayColor:
                              MaterialStateProperty.all(Colors.black12),
                          elevation: MaterialStateProperty.all(25),
                          shadowColor: MaterialStateProperty.all(Colors.red),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.red),
                        ),
                        onPressed: () {
                          clcAllNumber();
                          fieldText1.clear();
                          fieldText2.clear();
                        },
                        child: const Text(
                          "C",
                          style: TextStyle(fontSize: 50),
                        )),
                  ],
                ),

                const SizedBox(
                  height: 10,
                ),
                const Divider(thickness: 3),

                //==========================================================
                //==================== Discount offer ======================
                //==========================================================
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  cursorColor: Colors.black,
                  style: const TextStyle(
                      fontSize: 25, fontWeight: FontWeight.w500),
                  controller: fieldText3,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.black12,
                      hintText: "Product price",
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.blue, width: 2),
                          borderRadius: BorderRadius.circular(15.0)),
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.white, width: 3),
                          borderRadius: BorderRadius.circular(15.0))),
                  onChanged: (value1) {
                    discountNumberInsert("First", value1);
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  cursorColor: Colors.black,
                  style: const TextStyle(
                      fontSize: 25, fontWeight: FontWeight.w500),
                  controller: fieldText4,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.black12,
                      hintText: "Discount %",
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.blue, width: 2),
                          borderRadius: BorderRadius.circular(15.0)),
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.white, width: 3),
                          borderRadius: BorderRadius.circular(15.0))),
                  onChanged: (value2) {
                    discountNumberInsert("Second", value2);
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Discount: ${discountResult.toStringAsFixed(0)}",
                  style: GoogleFonts.robotoSlab(
                      textStyle: const TextStyle(
                          fontSize: 25, fontWeight: FontWeight.w500)),
                ),
                const SizedBox(
                  height: 20,
                ),
                //==================== Discount Button ======================
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        style: ButtonStyle(
                          overlayColor:
                              MaterialStateProperty.all(Colors.black12),
                          elevation: MaterialStateProperty.all(25),
                          shadowColor: MaterialStateProperty.all(Colors.cyan),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.cyan),
                        ),
                        onPressed: () {
                          productDiscount();
                        },
                        child: const Text(
                          "%",
                          style: TextStyle(fontSize: 50),
                        )),
                    const SizedBox(
                      width: 8,
                    ),
                    ElevatedButton(
                        style: ButtonStyle(
                          overlayColor:
                              MaterialStateProperty.all(Colors.black12),
                          elevation: MaterialStateProperty.all(25),
                          shadowColor:
                              MaterialStateProperty.all(Colors.pink[200]),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.pink[200]),
                        ),
                        onPressed: () {
                          disClcNumber();
                          fieldText3.clear();
                          fieldText4.clear();
                        },
                        child: const Text(
                          "C",
                          style: TextStyle(fontSize: 50),
                        )),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),

                //==================== Copyright ======================
                Text("Copyright 2023 Sarwar",
                    style: GoogleFonts.roboto(
                        textStyle: const TextStyle(
                            fontWeight: FontWeight.bold, letterSpacing: 2)))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
