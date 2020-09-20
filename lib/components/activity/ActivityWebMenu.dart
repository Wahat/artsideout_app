import 'package:artsideout_app/components/activity/OptionCard.dart';
import 'package:artsideout_app/pages/art/MasterArtPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:artsideout_app/pages/home/HomePage.dart';

class ActivityWebMenu extends StatefulWidget {
  Widget activityCard;
  ActivityWebMenu(this.activityCard);
  @override 
  _ActivityWebMenuState createState() =>_ActivityWebMenuState();
}

class _ActivityWebMenuState extends State<ActivityWebMenu> {
  Widget build(BuildContext context) {
    return Expanded( 
      flex: 71,
      child: Stack(
          fit: StackFit.passthrough, 
          overflow: Overflow.clip, 
          children: <Widget>[
            Positioned( 
              top: MediaQuery.of(context).size.height / 10, 
              right: 20, 
              left: 20, 
              bottom: 0, 
              child: Row( 
                children: <Widget>[
                  Expanded( 
                    flex: 3,
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 100),                  
                        OptionCard(
                          "Featured",
                          "assets/icons/aboutConnections.svg",
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                // TODO: Make Featured page?
                                MaterialPageRoute(builder: (context) => HomePage()), 
                              );
                            }
                          ),
                        ),
                        SizedBox(height: 30),
                        OptionCard(
                          "Saved",
                          "assets/icons/saved.svg",
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                // TODO: Make Saved page
                                MaterialPageRoute(builder: (context) => HomePage()), 
                              );
                            }
                          ),
                        ),
                        SizedBox(height: 30),
                        OptionCard(
                          "Art",
                          "assets/icons/installation.svg",
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                // TODO: Make Saved page
                                MaterialPageRoute(builder: (context) => MasterArtPage()), 
                              );
                            }
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded( 
                    flex: 7, 
                    child: widget.activityCard,
                  ),
                ],
              ),
            ),
          ],
        ),
    );
  }
}