import 'package:flutter/material.dart';

/// Displays detailed information about a SampleItem.
class SampleItemDetailsView extends StatelessWidget {
  const SampleItemDetailsView({super.key});

  static const routeName = '/sample_item';

  @override
  Widget build(BuildContext context) {
    final m = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text('Cards & Wallets'),
        backgroundColor: Colors.grey[200],
      ),
      body: Padding(
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
                  text: 'Card Status: ',
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
              onPressed: () {
                print("Button Pressed");
              },
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
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Text("Activate your Lifeline Card"),
                          ],
                        ),
                      ),
                      Image.asset(
                        "assets/images/person.png",
                        height: 120,
                        fit: BoxFit.fitWidth,
                      )
                    ],
                  ),
                  Divider(),
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

            _buildWalletCard(
              m,
              mainWidget: Row(
                children: [
                  Image.asset(
                    "assets/images/hand.png",
                    height: 90,
                    width: 90,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                              "2356",
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
                                ),
                              ),
                            ),
                            Text(
                              "2356",
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
              bottomWidget: RichText(
                text: TextSpan(
                  text: 'Card Status: ',
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
              buttonText: "More",
              onPressed: () {
                print("Button Pressed");
              },
            ),
          ],
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
                  child: Text(buttonText),
                ),
              ],
            )
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
        Colors.lightBlueAccent,
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
