import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'App de Viaje',
    theme: ThemeData(primarySwatch: Colors.green),
    debugShowCheckedModeBanner: false,
    home: Home(),
  ));
}

class Home extends StatefulWidget{
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List places = [
    {'imagen': 'paisaje2.jpg', 'nombre': 'Los Angeles', 'precio': '350',
    'descripcion': 'La ciudad de las estrellas, lugar perfecto para hacer turismo y relajarse'},
    {'imagen': 'paisaje3.jpg', 'nombre': 'Nueva York', 'precio': '250',
    'descripcion': 'La ciudad que nunca duerme, la Estatua de la Libertad... Wall Street'},
    {'imagen': 'paisaje4.jpg', 'nombre': 'Londres', 'precio': '150',
    'descripcion': 'Un lugar perfecto para hacer turismo, London Eye... El Big Ben...'},
    {'imagen': 'paisaje5.jpg', 'nombre': 'Paris', 'precio': '100',
    'descripcion': 'La ciudad del amor y la moda, La Torre Eiffel... el Arco del Triunfo...'},
  ];

  @override
  Widget build(BuildContext context){

    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [

              Container(
                height: size.height * 0.4,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/paisaje1.jpg'),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.3),
                      BlendMode.srcOver)
                  ),
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10)
                  )
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Text('Hay un Mundo por Descubrir', style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 34,
                            shadows: [
                              Shadow(
                                color: Colors.black,
                                blurRadius: 10,
                                offset: Offset(0,10)
                              )
                            ]
                          ), textAlign: TextAlign.center,),
                        )
                      ],
                    ),
                    SizedBox(height: 60)
                  ],
                ),
              ),
              Positioned(
                bottom: -20,
                left: 0,
                right: 0,
                child: Container(
                  height: 50,
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(color: Colors.grey, width: 1),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 20,
                        offset: Offset(0,10)
                      )
                    ]
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(horizontal: 20),
                            hintText: 'Search',
                            hintStyle: TextStyle(color: Colors.grey),
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: Icon(Icons.search, color: Colors.grey),
                      )
                    ],
                  ),
                )
              )
            ],
          ),
          SizedBox(height: 20,),
          Expanded(
            child: ListView(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text("Destinos Top", style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),),
                ),
                SizedBox(height: 20,),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      
                      for(var data in places)
                        GestureDetector(
                          onTap: (){
                            
                          },
                          child: Container(
                            width: 250,
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Stack(
                                  alignment: Alignment.topRight,
                                  children: [
                                    ClipRRect(
                                      child: Image.asset('images/'+data['imagen']),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    Container(
                                      padding: EdgeInsets.symmetric(horizontal: 10,
                                      vertical: 5),
                                      decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(30),
                                          bottomLeft: Radius.circular(30),
                                          topRight: Radius.circular(8)
                                        )
                                      ),
                                      child: Text(data['precio'] + 'EUR', style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white
                                      ),),
                                    )
                                  ]
                                ),
                                Text(data['nombre'], style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18
                                ),)
                              ],
                            ),
                          ),
                        )
                    ],
                  ),
                ),

                SizedBox(height: 20,),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Text('Mas Destinos', style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24
                  ),),
                ),

                for(var data in places)
                  Container(
                    padding: EdgeInsets.all(15),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 3,
                          child: Container(
                            height: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              image: DecorationImage(
                                image: AssetImage('images/'+data['imagen']),
                                fit: BoxFit.cover
                              )
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 6,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              children: [
                                Text(data['nombre'], style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16
                                ),),
                                SizedBox(height: 15,),
                                Text(data['descripcion'], style: TextStyle(
                                  fontSize: 14
                                ),),
                                SizedBox(height: 15,),
                                ElevatedButton(
                                  onPressed: (){}, 
                                  child: Text('Reservar')
                                )
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Text(data['precio'] + 'EUR', style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20
                          ),),
                        ),
                      ],
                    ),
                  )
              ],
            )
          )
        ],
      ),
    );
  }
}
