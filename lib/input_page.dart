import 'package:flutter/material.dart';
import 'package:imc_calculator/constant.dart';
import 'card_container.dart';
import 'icon_container.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:imc_calculator/square_rounded_button.dart';
import 'package:imc_calculator/imc_logic.dart';
import 'result_page.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  var selectedGender;
  int height = 120;
  int weight = 60;
  int age = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Your IMC is:'),
        ),
        body: Column(
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CardContainer(
                    color: selectedGender == Gender.male
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: IconContent(
                      text: "MALE",
                      iconData: FontAwesomeIcons.mars,
                    ),
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                  ),
                  CardContainer(
                    color: selectedGender == Gender.female
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: IconContent(
                      text: "FEMALE",
                      iconData: FontAwesomeIcons.venus,
                    ),
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                    child: CardContainer(
                  color: kActiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "HEIGHT",
                        style: kTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            height.toString(),
                            style: kHeightStyle,
                          ),
                          Text(
                            "cm",
                            style: kTextStyle,
                          ),
                        ],
                      ),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          thumbShape: RoundSliderThumbShape(
                            enabledThumbRadius: 15,
                          ),
                          overlayShape:
                              RoundSliderOverlayShape(overlayRadius: 30),
                          overlayColor: Color(0X29EB1555),
                          thumbColor: Color(0XFFEB1555),
                          activeTrackColor: Colors.white,
                          inactiveTrackColor: Color(0XFF952552),
                        ),
                        child: Slider(
                            value: height.toDouble(),
                            min: 120,
                            max: 220,
                            onChanged: (newValue) {
                              setState(() {
                                height = newValue.round();
                              });
                            }),
                      ),
                    ],
                  ),
                  onPress: () {},
                )),
              ],
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CardContainer(
                    color: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('WEIGHT', style: kTextStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(weight.toString(), style: kHeightStyle),
                            Text('kg', style: kTextStyle),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SquareRoundedButton(
                                icon: FontAwesomeIcons.minus,
                                color: kSquareRoundedButtonDefaultColor,
                                height: 50,
                                width: 50,
                                onPressed: () {
                                  setState(() {
                                    if (weight > 0) {
                                      weight--;
                                    }
                                  });
                                }),
                            SizedBox(
                              width: 10,
                            ),
                            SquareRoundedButton(
                                icon: FontAwesomeIcons.plus,
                                color: kSquareRoundedButtonDefaultColor,
                                height: 50,
                                width: 50,
                                onPressed: () {
                                  setState(() {
                                    if (weight > 0) {
                                      weight++;
                                    }
                                  });
                                }),
                          ],
                        )
                      ],
                    ),
                    onPress: () {},
                  ),
                  CardContainer(
                    color: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
                          style: kTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kHeightStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SquareRoundedButton(
                                icon: FontAwesomeIcons.minus,
                                color: kSquareRoundedButtonDefaultColor,
                                height: 50,
                                width: 50,
                                onPressed: () {
                                  setState(() {
                                    if (age > 18) {
                                      age--;
                                    }
                                  });
                                }),
                            SizedBox(
                              width: 10,
                            ),
                            SquareRoundedButton(
                                icon: FontAwesomeIcons.plus,
                                color: kSquareRoundedButtonDefaultColor,
                                height: 50,
                                width: 50,
                                onPressed: () {
                                  setState(() {
                                    age++;
                                  });
                                })
                          ],
                        )
                      ],
                    ),
                    onPress: () {},
                  ),
                ],
              ),
            ),
            Container(
              color: Color(0XFFEB1555),
              height: 60,
              width: double.infinity,
              margin: EdgeInsets.only(top: 10.0),
              child: GestureDetector(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RawMaterialButton(
                      elevation: 0,
                      child: Text('Calcular IMC'),
                      constraints:
                          BoxConstraints.tightFor(height: 55, width: 350),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                        side: BorderSide(width: 3, color: Colors.white),
                      ),
                      fillColor: Colors.transparent,
                      onPressed: () {
                        if (weight.toDouble() != 0) {
                          double result = pmiCalculation(
                              height.toDouble(), weight.toDouble());
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context){
                                return ResultPage(imcResult: result,);
                              })
                          );
                        } else {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Error'),
                                content:
                                    Text('Ingrese un peso superior a 1 kg'),
                                actions: [
                                  TextButton(
                                    child: Text('Cerrar'),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        }
                      },
                    )
                  ],
                ),
              ),
            )
          ],
        ));
  }
}