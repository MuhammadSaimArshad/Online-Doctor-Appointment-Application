// ignore_for_file: must_be_immutable

import 'package:custom_clippers/custom_clippers.dart';
import 'package:flutter/material.dart';

class ChatSample extends StatelessWidget {
  var height, width;

  ChatSample({super.key});
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(right: 80),
          child: ClipPath(
            clipper: UpperNipMessageClipper(MessageType.receive),
            child: Container(
              padding: EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: Color(0xFFE1E1E2),
              ),
              child: Text(
                "Hello, what i can do for, you can book appointment directly",
                style: TextStyle(
                  fontSize: height * 0.04,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
        Container(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: EdgeInsets.only(left: 80, top: 20),
            child: ClipPath(
              clipper: LowerNipMessageClipper(MessageType.send),
              child: Container(
                padding:
                    EdgeInsets.only(left: 20, top: 10, bottom: 25, right: 20),
                decoration: const BoxDecoration(
                  color: Color(0xFF7165D6),
                ),
                child: Text(
                  "Hello, Doctor are you there?",
                  style: TextStyle(
                    fontSize: width * 0.03,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
