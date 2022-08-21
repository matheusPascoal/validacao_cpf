import 'package:flutter/material.dart';
import 'package:validator_cpf/cpf/cpf_store.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final store = CpfStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('VALIDADOR CPF'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                autovalidateMode: AutovalidateMode.always,
                onChanged: (text) => store.validateCPF(text, true),
                validator: (text) => store.validateCPF(text, false),
              ),
              AnimatedBuilder(
                  animation: store,
                  builder: ((_, __) {
                    return Text(store.result);
                  }))
            ],
          )),
        ));
  }
}
