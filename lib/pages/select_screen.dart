import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/customer_registration.dart';
import 'package:flutter_application_1/pages/vehicel_form.dart';

class SelectScreen extends StatelessWidget {
  const SelectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(color: Colors.blue),
          child: const Padding(
            padding: EdgeInsets.only(bottom: 550.0),
            child: Image(
              image: AssetImage('assets/images/bg1.png'),
              fit: BoxFit.contain,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 350.0),
          child: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(45),
                    topRight: Radius.circular(45))),
            child: Padding(
              padding: const EdgeInsets.all(26.0),
              child: Column(
                children: [
                  const Text(
                    'Registration',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF180000),
                      fontSize: 24,
                      fontFamily: 'Mulish',
                      fontWeight: FontWeight.w500,
                      height: 0.67,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 70.0, bottom: 30.0),
                    child: Container(
                      width: 300,
                      height: 50,
                      decoration: ShapeDecoration(
                        color: const Color(0x33C4C4C4),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: GestureDetector(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => VehicleForm())),
                        child: const SizedBox(
                          width: 74,
                          height: 18,
                          child: Center(
                            child: Text(
                              'Vehicle',
                              style: TextStyle(
                                color: Color(0xFF3A86FF),
                                fontSize: 18,
                                fontFamily: 'Mulish',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 300,
                    height: 50,
                    decoration: ShapeDecoration(
                      color: const Color(0x33C4C4C4),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: GestureDetector(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  CustomerRegistrationForm())),
                      child: const SizedBox(
                        width: 74,
                        height: 18,
                        child: Center(
                          child: Text(
                            'Customer',
                            style: TextStyle(
                              color: Color(0xFF3A86FF),
                              fontSize: 18,
                              fontFamily: 'Mulish',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    ));
  }
}
