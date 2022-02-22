import 'package:flutter/material.dart';
import 'main.dart';

List<String> breadcrumb = [HomePage.route];

class Breadcrumb extends StatelessWidget {
  const Breadcrumb({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      width: double.infinity,
      color: const Color.fromRGBO(239, 243, 247, 1.0),
      child: Row(
        children: breadcrumb.map((e) =>
          BreadcrumbItem(name: e)
        ).toList(),
      )
    );
  }
}

class BreadcrumbItem extends StatefulWidget {
  final String name;
  const BreadcrumbItem({Key? key, required this.name}) : super(key: key);

  @override
  _BreadcrumbItemState createState() => _BreadcrumbItemState();
}

class _BreadcrumbItemState extends State<BreadcrumbItem> {
  bool onIt = false;
  Color color = Colors.black;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text((widget.name == '/') ? '' : '/',),
        GestureDetector(
          onTap: () {
            while(breadcrumb.last != widget.name) {
              setState(() {
                Navigator.pop(context);
                breadcrumb.removeLast();
              });
            }
          },
          child: MouseRegion(
            opaque: true,
            onEnter: (value) {
              setState(() {
                onIt = true;
                color = Colors.grey;
              });
            },
            onExit: (value) {
              setState(() {
              onIt = true;
              color = Colors.grey;
              });
            },
            child: Text((widget.name == '/') ? 'Home' : widget.name.substring(1),
                style: TextStyle(
                  color: (widget.name == breadcrumb.last) ? Colors.grey : color,
                  decoration: (onIt) ? (widget.name == breadcrumb.last) ? TextDecoration.none: TextDecoration.underline : TextDecoration.none,
                )
            ),
          )
        )
      ],
    );
  }
}
