import 'package:flutter/material.dart';
import 'package:rick_and_morty/models/personaje.dart';

class ProfileScreen extends StatefulWidget {
  final Personaje personaje;

  const ProfileScreen({Key? key, required this.personaje}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(

      // color: const Color.fromRGBO(28, 34, 34,1),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/img/fondo.jpg"),
              fit: BoxFit.cover,
            ),
          ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
        child: Center(
          child: Stack(
            children: [
              Column(
                children: [
                  CircleAvatar(
                    radius: 120, // Image radius
                    backgroundImage:
                        NetworkImage(widget.personaje.image.toString()),
                  ),
                  SizedBox(
                    height: height * 0.41,
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        double innerHeight = constraints.maxHeight;
                        double innerWidth = constraints.maxWidth;
                        return Stack(
                          fit: StackFit.expand,
                          children: [
                            Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: Container(
                                height: innerHeight * 0.72,
                                width: innerWidth,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: const Color.fromRGBO(
                                      12, 28, 58, 0.95),
                                ),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Text(
                                        widget.personaje.name.toString(),
                                        style: const TextStyle(
                                          // color: Color.fromRGBO(39, 105, 171, 1),
                                          color: Color.fromRGBO(
                                              224, 224, 224, 1.0),
                                          fontFamily: 'Nunito',
                                          fontSize: 28,
                                        ),
                                      ),
                                    ),
                                    const Divider(),
                                    _block(
                                      'Status',
                                      widget.personaje.status.toString(),
                                      'Species',
                                      widget.personaje.species.toString(),
                                    ),
                                    const Divider(),
                                    _block(
                                      'Gender',
                                      widget.personaje.gender.toString(),
                                      'Origin',
                                      widget.personaje.origin!['name']
                                          .toString(),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _block(String tag, String value, String tag2, String value2) {
    final styleTag = TextStyle(
      // color: Colors.grey[700],
      color: Color.fromRGBO(0, 108, 255, 1.0),
      fontFamily: 'Nunito',
      fontSize: 25,
    );

    const styleValue = TextStyle(
      color: Color.fromRGBO(117, 250, 68, 1.0),
      fontFamily: 'Nunito',
      fontSize: 25,
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            Text(
              tag,
              style: styleTag
            ),
            Text(
              value.toLowerCase(),
              overflow: value.length > 10 ? TextOverflow.ellipsis : null,
              style: styleValue
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 25,
            vertical: 8,
          ),
          child: Container(
            height: 50,
            width: 3,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: Colors.grey,
            ),
          ),
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              tag2,
              style: styleTag,
              // style: TextStyle(
              //   color: Colors.grey[700],
              //   fontFamily: 'Nunito',
              //   fontSize: 25,
              // ),
            ),
            Flexible(
              child: Container(
                // color: Colors.orange,
                constraints: const BoxConstraints(
                  maxWidth: 100
                ),
                child: Text(
                  value2.toLowerCase(),
                  overflow: value2.length > 10 ? TextOverflow.ellipsis : null,
                  softWrap: false,
                  // maxLines: 1,
                  style: styleValue,
                  // style: const TextStyle(
                  //   color: Color.fromRGBO(39, 105, 171, 1),
                  //   fontFamily: 'Nunito',
                  //   fontSize: 25,
                  // ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
