List<String> imageUrl = [
  "https://firebasestorage.googleapis.com/v0/b/chatbox-ce822.appspot.com/o/Post%20Picture%2Fmimi1.gif?alt=media&token=1e490f12-2005-48cc-9c51-98739b703f61",
  "https://firebasestorage.googleapis.com/v0/b/chatbox-ce822.appspot.com/o/Post%20Picture%2Fmimi2.gif?alt=media&token=2955f127-3831-44fa-b70f-f9d8df71c586",
  "https://firebasestorage.googleapis.com/v0/b/chatbox-ce822.appspot.com/o/Post%20Picture%2Fmimi4.gif?alt=media&token=05679ae7-9a1c-414a-9dea-beeac8a01054",
  "https://firebasestorage.googleapis.com/v0/b/chatbox-ce822.appspot.com/o/Post%20Picture%2Fmimi5.gif?alt=media&token=97421156-063b-4c56-b991-376384a97f20",
  "https://firebasestorage.googleapis.com/v0/b/chatbox-ce822.appspot.com/o/Post%20Picture%2Fmimi6.gif?alt=media&token=89e364ac-3aeb-4c3a-b454-ed8451386749",
  "https://firebasestorage.googleapis.com/v0/b/chatbox-ce822.appspot.com/o/Post%20Picture%2Fmimi7.gif?alt=media&token=fa2cf014-4559-4987-b749-d58754754533",
  "https://firebasestorage.googleapis.com/v0/b/chatbox-ce822.appspot.com/o/Post%20Picture%2Fmimi8.gif?alt=media&token=06cda37a-510f-4d27-b74a-21a328a8f640",
  "https://firebasestorage.googleapis.com/v0/b/chatbox-ce822.appspot.com/o/Post%20Picture%2F485173417511878678.gif?alt=media&token=73d84182-4a36-4e91-a913-0668cb6b6881"
];

class BasicCustomSingleChildLayout extends StatefulWidget {
  @override
  _BasicCustomSingleChildLayoutState createState() => _BasicCustomSingleChildLayoutState();
}

class _BasicCustomSingleChildLayoutState extends State<BasicCustomSingleChildLayout> {
  Color abc = Colors.amber;
  Color def = Colors.black;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var a = MediaQuery.of(context);
    print("Padding" + a.padding.toString());
    print("accessibleNavigation" + a.accessibleNavigation.toString());
    print("alwaysUse24HourFormat" + a.alwaysUse24HourFormat.toString());
    print("boldText" + a.boldText.toString());
    print("boldText" + a.devicePixelRatio.toString());
    print("boldText" + a.disableAnimations.toString());
    print("boldText" + a.hashCode.toString());
    print("boldText" + a.highContrast.toString());
    print("boldText" + a.invertColors.toString());
    print("boldText" + a.orientation.toString());
    print("boldText" + a.platformBrightness.toString());
    print("boldText" + a.physicalDepth.toString());
    print("boldText" + a.size.toString());
    print("boldText" + a.systemGestureInsets.toString());
    return Scaffold(
      appBar: AppBar(title: Text("CustomSingleChildLayout Widget"),actions: <Widget>[
        IconButton(
          icon: Icon(Icons.menu),
          onPressed: (){
            abc = RandomColor().randomColor();
            def = RandomColor().randomColor();
            setState(() {
              
            });
           
          },
        )
      ],),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            AnimatedContainer(
              width: double.infinity,
              height: 200,
              duration: Duration(seconds: 1),
              color: abc,
              curve: Curves.easeOut,
              child: Text("data",style: TextStyle(fontSize: 30,color:def ),textAlign: TextAlign.center,),
            ),
            Container(
              height: 300,
              width: double.infinity,
              padding: EdgeInsets.all(10),
              color: Colors.pink[100],
              child: FittedBox(
                fit: BoxFit.fill,
                alignment: Alignment.topCenter,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      height: 1000,
                      width: 1000,
                      color: Colors.blue,
                      child: Image.network(imageUrl.first, fit: BoxFit.cover),
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  print(constraints.maxWidth);
                  print(constraints.maxHeight);
                  if (constraints.maxWidth < 400) {
                    return ListView.separated(
                      separatorBuilder: (_, index) {
                        return SizedBox(
                          height: 10,
                        );
                      },
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      itemCount: imageUrl.length,
                      itemBuilder: (_, index) {
                        return ClipRRect(
                          borderRadius: BorderRadius.vertical(
                              top: Radius.circular(20),
                              bottom: Radius.circular(10)),
                          child: Column(
                            children: <Widget>[
                              AnimatedContainer(
                                duration: Duration(seconds: 1),
                                curve: Curves.easeOut,
                                child: Image.network(
                                  imageUrl[index],
                                  fit: BoxFit.fill,
                                ),
                                width: double.infinity,
                                height: 200,
                                color: abc,
                              ),
                              Container(
                                height: 60,
                                padding: EdgeInsets.symmetric(horizontal: 15),
                                width: double.infinity,
                                color: def,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      "About the great cartoon",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 20,
                                      ),
                                    ),
                                    IconButton(
                                      icon: Icon(Icons.favorite,
                                          color: Colors.pink),
                                      onPressed: () {},
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    );
                  } else {
                    return GridView.builder(
                      shrinkWrap: true,
                      gridDelegate:
                          new SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              mainAxisSpacing: 5,
                              crossAxisSpacing: 5),
                      physics: BouncingScrollPhysics(),
                      itemCount: imageUrl.length,
                      itemBuilder: (context, index) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          clipBehavior: Clip.hardEdge,
                          child: Container(
                            child: Image.network(
                              imageUrl[index],
                              fit: BoxFit.fill,
                            ),
                            //  width: a.size.width/2,
                            height: 30,
                            color: Colors.grey.withOpacity(0.2),
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ),
            // Html(
            //     padding: EdgeInsets.all(12.0),
            //     backgroundColor: Colors.blue.withOpacity(0.1),
            //     blockSpacing: 1.0,
            //     imageProperties: ImageProperties(
            //         width: double.infinity,
            //         height: 100,
            //         color: Colors.black.withOpacity(0.5),
            //         colorBlendMode: BlendMode.color,
            //         fit: BoxFit.fill),
            //     onLinkTap: (a) {
            //       print(a);
            //     },
            //     data: """
            //   <html>
            //   <head><title>fsf</title>
            //     <div>
            //       <a href="http://www.jahaaj.tech">jahaaj.tech </a>
            //       <hr>
            //       <p>
            //         We provide <u>exclusive</u> content for programming <b>mobile apps</b>:
            //         <ul>
            //           <li>Android Tutorials</li>
            //           <li>Flutter Tutorials</li>
            //           <li>React Native Tutorials</li>
            //         </ul>
            //       </p>
            //       <table>
            //       <tr>
            //       <th>Name</th>
            //       <th>Name</th>
            //       <th>Name</th>
            //       <th>Name</th>
            //       </tr>
            //       <tr>
            //       <td> Hardik </td>
            //       <td> Hardik </td>
            //       <td> Hardik </td>
            //       <td> Hardik </td>
            //       </tr>
            //       </table>
            //       <img src="https://inducesmile.com/wp-content/uploads/2019/01/codesnippets.jpg"/>

            //     </div>
            //   """),
            RaisedButton(
              child: Text("data"),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
