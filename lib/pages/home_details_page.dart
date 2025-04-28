import 'package:first_app/models/catalog.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailPage extends StatefulWidget {
  final Item catalog;

  const HomeDetailPage({super.key, required this.catalog});

  @override
  State<HomeDetailPage> createState() => _HomeDetailPageState();
}

class _HomeDetailPageState extends State<HomeDetailPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 700),
    );

    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );

    _slideAnimation = Tween<Offset>(
      begin: Offset(0, 0.1),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final catalog = widget.catalog;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: context.canvasColor,
      bottomNavigationBar: Container(
        color: context.cardColor,
        child: OverflowBar(
          alignment: MainAxisAlignment.spaceBetween,
          children: [
            "\$${catalog.price}".text.bold.xl4.red800.make(),
            ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                backgroundColor:
                    WidgetStateProperty.all(context.theme.colorScheme.primary),
                shape: WidgetStateProperty.all(StadiumBorder()),
              ),
               child: "Add to Cart".text.color(Colors.yellow).make(),
            ).wh(140, 50),
          ],
        ).p16(),
      ),
      body: SafeArea(
        bottom: false,
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: SlideTransition(
            position: _slideAnimation,
            child: Column(
              children: [
                Hero(
                  tag: Key(catalog.id.toString()),
                  child: Image.network(
                    catalog.image,
                    height: 300,
                  ),
                ),
                Expanded(
                  child: VxArc(
                    height: 30.0,
                    arcType: VxArcType.convey,
                    edge: VxEdge.top,
                    child: Container(
                      color: context.cardColor,
                      width: context.screenWidth,
                      child: SingleChildScrollView(   
                        child: Column(
                          children: [
                            catalog.name.text.xl4.color(context.accentColor)
                                .bold
                                .make(),
                            catalog.desc.text
                                .textStyle(context.captionStyle)
                                .xl
                                .make(),
                            10.heightBox,
                            "The iPhone 12 Pro offers powerful performance with Apple’s A14 Bionic chip, a stunning Super Retina XDR display, and a pro-grade triple-camera system. With 5G support, advanced LiDAR technology for improved AR, and a sleek stainless steel design, it delivers an exceptional experience for photography, gaming, and everyday use."
                                .text
                                .textStyle(context.captionStyle)
                                .make()
                                .p16()
                          ],
                        ).py64(),
                      ),
                    ),
                  ),
                ),
              ],
            ).p16(),
          ),
        ),
      ),
    );
  }
}
