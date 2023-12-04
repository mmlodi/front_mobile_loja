import 'package:flutter/material.dart';

void main() {
  runApp(
    MyApp()
  );
}

class PessoaWidget extends StatelessWidget {
  final String texto;
  const PessoaWidget(this.texto);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(color: Colors.lightBlueAccent),
      child: Text(
        texto, 
        style: TextStyle(fontSize: 30), 
        textDirection: TextDirection.ltr
      )
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    const numeroAleatorio = 12;

    return  MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true,
      ),
      home:  MyHomePage(title: 'Flutter Demo Home Page',)
        // Scaffold(
        //   appBar: AppBar(
        //     title: const Text("Primeiro Programa" ) 
        //   ),
        //   body: const Center(
        //     child: Column(
        //       mainAxisAlignment: MainAxisAlignment.center,
        //       children: [
        //         PessoaWidget("Razer"),
        //         PessoaWidget("Guilherme"),
        //         PessoaWidget("Brunna"),
        //         PessoaWidget("Juan")
        //       ],
        //     )
        //   )
        // )
    ) ;
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _resultado = 0;

  final _number1Controller = TextEditingController();
  final _number2Controller = TextEditingController();

  @override
  void dispose(){
    _number1Controller.dispose();
    _number2Controller.dispose();
    super.dispose();
  }

  void _somar(){
    setState(() {
      this._resultado = int.parse(_number1Controller.text) + int.parse(_number2Controller.text);
    });
  }

  void _subtrai (){
    setState(() {
      this._resultado = int.parse(_number1Controller.text) - int.parse(_number2Controller.text);
    });
  }

  void _multiplica(){
    setState(() {
      this._resultado = int.parse(_number1Controller.text)*int.parse(_number2Controller.text);
    });
  }

  void _divide(){
    setState(() {
      this._resultado = (int.parse(_number1Controller.text)/int.parse(_number2Controller.text)).round();
    });
  }
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              children: [
                Text("Numero 1:"),
                Expanded(
                  child: 
                    TextField(controller: _number1Controller)
                )
              ]
            ),
            Row(
              children: [
                Text("Numero 2:"),
                Expanded(
                  child: 
                    TextField(controller: _number2Controller)
                )
              ]
            ),

            Center( 
              child: Row(
              children:[
                ElevatedButton(
                onPressed: _somar, 
                child: Text("Somar")
                ),
                ElevatedButton(
                onPressed: _subtrai, 
                child: Text("Subtrai")
                )
              ]
            ),
            ),

            Center(
              child: 
                        Row(
              children:[
                ElevatedButton(
                onPressed: _multiplica, 
                child: Text("Multiplica")
                ),
                ElevatedButton(
                onPressed: _divide, 
                child: Text("Divide")
                )
              ]
            ),
            
            ),

            Row(
              children: [
                Text("Resultado: ${this._resultado}" )
              ],
            )
          ]
        )
      )
    );
  }
}
