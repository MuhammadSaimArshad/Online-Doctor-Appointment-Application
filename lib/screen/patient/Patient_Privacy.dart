import 'package:flutter/material.dart';

class PatientPrivacy extends StatefulWidget {
  const PatientPrivacy({super.key});

  @override
  State<PatientPrivacy> createState() => _PatientPrivacyState();
}

class _PatientPrivacyState extends State<PatientPrivacy> {
  var height, width;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: height,
        width: width,
        color: Colors.white,
        child: Column(
          children: [
            SizedBox(
              height: height * 0.05,
            ),
            Row(
              children: [
                SizedBox(
                  width: width * 0.02,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back_ios_new,
                    size: width * 0.04,
                  ),
                ),
                SizedBox(
                  width: width * 0.03,
                ),
                Text(
                  "Privacy",
                  style: TextStyle(
                      fontSize: width * 0.04, fontWeight: FontWeight.bold),
                )
              ],
            ),
            SizedBox(
              height: height * 0.03,
            ),
            Container(
              height: height * 0.6,
              width: width * 0.95,
              color: Colors.white,
              child: Center(
                child: Text(
                  textAlign: TextAlign.justify,
                  "Privacy is paramount in our  application. We understand the sensitivity of personal health information and prioritize the highest standards of data security. Our platform adheres strictly to HIPAA (Health Insurance Portability and Accountability Act) regulations to ensure the confidentiality of user data. All information shared on our platform, from medical records to appointment details, is encrypted and securely stored on our servers. We employ advanced encryption techniques and access controls to safeguard against unauthorized access or breaches. Additionally, we never share user data with third parties without explicit consent. Our commitment to privacy extends to every aspect of our application, providing users with peace of mind as they seek medical care online.",
                  style: TextStyle(fontSize: width * 0.04),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
