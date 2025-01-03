import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

/// Displays detailed information about a SampleItem.
class SampleItemDetailsView extends StatelessWidget {
  const SampleItemDetailsView({super.key});

  static const routeName = '/sample_item';

  @override
  Widget build(BuildContext context) {
    final m = MediaQuery.of(context);
    Widget singleWallet = _buildWalletCard(
      m,
      mainWidget: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            "assets/images/hand.png",
            height: 90,
            width: 90,
          ),
          Expanded(
            child: Column(
              spacing: 6,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 6),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        "Cash",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Text(
                      "2356  ",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        "This is the cash wallet",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    Text(
                      "2356  ",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      bottomWidget: Text(
        '11th Sep 2023 to 11 Oct 2023',
        style: const TextStyle(
          color: Colors.grey,
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
      ),
      buttonText: "More",
      onPressed: () {},
    );

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text('Cards & Wallets'),
        backgroundColor: Colors.grey[200],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            spacing: 12,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _buildWalletCard(
                m,
                mainWidget: Image.asset(
                  "assets/images/credit_card.png",
                  fit: BoxFit.fitWidth,
                ),
                bottomWidget: RichText(
                  text: TextSpan(
                    text: '       Card Status: ',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16.0,
                    ),
                    children: [
                      TextSpan(
                        text: 'Inactive',
                        style: const TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                buttonText: "Guide",
                onPressed: () {},
              ),

              // Lifeline Card
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(
                    color: Colors.grey[300]!,
                  ),
                ),
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 8,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(4),
                            child: Column(
                              spacing: 4,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Activate your Lifeline Card",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold)),
                                Text(
                                  "₹ 3499/- Life Time",
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "₹ 9999/- Year",
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text("Offer ends soon"),
                                ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(14),
                                    ),
                                    backgroundColor: Colors.blue[900],
                                    minimumSize: const Size(160, 40),
                                  ),
                                  child: Text(
                                    "Activate Now",
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Image.asset(
                          "assets/images/person.png",
                          height: 160,
                          fit: BoxFit.fitWidth,
                        )
                      ],
                    ),
                    Divider(),
                    Text(
                      "Our Features",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        spacing: 12,
                        children: [
                          _buildFeature1("Udhar Limit: ₹ 2376"),
                          _buildFeature1("CP EMI Limit: ₹ 2376"),
                          _buildFeature1("Udhar Limit: ₹ 2376"),
                          _buildFeature1("CP EMI Limit: ₹ 2376"),
                        ],
                      ),
                    ),
                    Row(
                      spacing: 6,
                      children: [
                        _buildFeature2(
                          "Udhar",
                          "assets/images/money.svg",
                        ),
                        _buildFeature2(
                          "CP EMI",
                          "assets/images/money.svg",
                        ),
                        _buildFeature2(
                          "Business Funds",
                          "assets/images/money.svg",
                        ),
                      ],
                    )
                  ],
                ),
              ),

              Text(
                "Wallet",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              singleWallet,
              singleWallet,
              singleWallet,
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildWalletCard(
    MediaQueryData m, {
    required Widget mainWidget,
    required Widget bottomWidget,
    required String buttonText,
    required Function() onPressed,
  }) {
    return CustomPaint(
      painter: _Painter(),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: mainWidget,
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: bottomWidget,
                  ),
                ),
                ElevatedButton(
                  onPressed: onPressed,
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                    backgroundColor: const Color.fromARGB(255, 194, 169, 248),
                    minimumSize: const Size(160, 40),
                  ),
                  child: Text(
                    buttonText,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildFeature1(String m) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(6),
        ),
      ),
      padding: EdgeInsets.all(4),
      child: Text(
        m,
        style: TextStyle(
          color: Colors.grey,
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
      ),
    );
  }

  Widget _buildFeature2(String text, String asset) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Column(
          spacing: 6,
          children: [
            Container(
              height: 90,
              width: 90,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                ),
                color: Colors.grey[300],
                borderRadius: BorderRadius.all(
                  Radius.circular(6),
                ),
              ),
              padding: EdgeInsets.all(4),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset(asset),
              ),
            ),
            Text(
              text,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
              maxLines: 1,
            ),
          ],
        ),
      ),
    );
  }
}

class _Painter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    const curveRadius = 14.0;
    final height = size.height;
    final width = size.width;

    final gradient = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Colors.white,
        Colors.lightBlue[50]!,
      ],
    );

    final gradientPaint = Paint()
      ..shader = gradient.createShader(Rect.fromLTWH(0, 0, width, height))
      ..style = PaintingStyle.fill;

    final ovalPath = Path();

    ovalPath.moveTo(0, curveRadius);
    ovalPath.arcToPoint(
      Offset(curveRadius, 0),
      radius: Radius.circular(curveRadius),
      clockwise: true,
    );

    ovalPath.lineTo(width - curveRadius, 0);
    ovalPath.arcToPoint(
      Offset(width, curveRadius),
      radius: Radius.circular(curveRadius),
    );

    ovalPath.lineTo(width, height - 50 - curveRadius);
    ovalPath.arcToPoint(
      Offset(width - curveRadius, height - 50),
      radius: Radius.circular(curveRadius),
    );

    ovalPath.lineTo(width - 150, height - 50);

    ovalPath.arcToPoint(
      Offset(width - 150 - curveRadius, height - 50 + curveRadius),
      radius: Radius.circular(curveRadius),
      clockwise: false,
    );

    ovalPath.lineTo(width - 150 - curveRadius, height - curveRadius);

    ovalPath.arcToPoint(
      Offset(width - 150 - 2 * curveRadius, height),
      radius: Radius.circular(curveRadius),
    );

    ovalPath.lineTo(curveRadius, height);
    ovalPath.arcToPoint(
      Offset(0, height - curveRadius),
      radius: Radius.circular(curveRadius),
    );

    ovalPath.lineTo(0, curveRadius);

    canvas.drawPath(
      ovalPath,
      gradientPaint,
    );

    final strokePaint = Paint()
      ..color = Colors.grey[300]!
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    canvas.drawPath(
      ovalPath,
      strokePaint,
    );
  }

  @override
  bool shouldRepaint(_Painter oldDelegate) => false;
}
