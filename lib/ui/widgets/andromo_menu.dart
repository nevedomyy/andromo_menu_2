import 'package:flutter/material.dart';

class AndromoMenu extends StatefulWidget {
  final Color backgroundColor;
  final Color itemColor;
  final List<String> menuCaptions;
  final List<Widget> menuItems;

  AndromoMenu({
    Key key,
    @required this.backgroundColor,
    @required this.itemColor,
    @required this.menuCaptions,
    @required this.menuItems
  }): super(key: key);

  @override
  AndromoMenuState createState() => AndromoMenuState();
}

class AndromoMenuState extends State<AndromoMenu> with TickerProviderStateMixin{
  AnimationController _animationController;
  int _pageIndex = 0;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 200));
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  startAnimation(){
    if(_animationController.isCompleted) _animationController.reverse();
    else _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Material(
      color: Colors.white,
      child: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.centerRight,
                    end: Alignment.centerLeft,
                    colors: [widget.backgroundColor, widget.backgroundColor.withOpacity(0.88)]
                )
            ),
            width: size.width,
            height: size.height,
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(widget.menuCaptions.length, (index) => GestureDetector(
                  onTap: (){
                    _pageIndex = index;
                    _animationController.reverse();
                    setState(() {});
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
                    child: Text(
                      widget.menuCaptions[index],
                      style: TextStyle(fontSize: 36.0, color: _pageIndex == index ? widget.itemColor : widget.itemColor.withOpacity(0.4), fontFamily: 'JosefinSans-Thin'),
                    ),
                  ),
                )),
              ),
            ),
          ),
          SlideTransition(
            position: Tween(begin: Offset.zero, end: Offset(0.7, 0.1)).animate(CurvedAnimation(
              curve: Curves.ease,
              parent: _animationController,
            )),
            child: RotationTransition(
              turns: Tween(begin: 1.0, end: 0.98).animate(CurvedAnimation(
                curve: Curves.ease,
                parent: _animationController,
              )),
              child: AnimatedBuilder(
                animation: _animationController,
                builder: (context, child){
                  return Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(_animationController.value*30),
                        boxShadow: [BoxShadow(
                            color: Colors.black26,
                            blurRadius: 5.0,
                            spreadRadius: 1.0
                        )]
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(_animationController.value*30),
                      child: SizedBox.expand(
                        child: IndexedStack(
                          index: _pageIndex,
                          children: widget.menuItems,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}