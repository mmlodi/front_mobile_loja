class SegundaTela extends StatelessWidget {
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(title: Text("Segunda Tela Linda"), ),
body: Center(
child: ElevatedButton(
onPressed: () {
Navigator.pop(context);
},
child: Text('Voltar'),
),
),
);
}
}