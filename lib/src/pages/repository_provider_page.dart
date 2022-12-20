import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_widget_sample/src/bloc/sample_bloc.dart';
import 'package:flutter_bloc_widget_sample/src/bloc/sample_bloc_di.dart';
import 'package:flutter_bloc_widget_sample/src/repository/repository_sample.dart';

class RepositoryProviderPage extends StatefulWidget {
  const RepositoryProviderPage({super.key});

  @override
  State<RepositoryProviderPage> createState() => _RepositoryProviderPageState();
}

class _RepositoryProviderPageState extends State<RepositoryProviderPage> {
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => RepositorySample(),
      child: BlocProvider(
        create: (context) => SampleBlocDI(context.read<RepositorySample>()),
        child: SamplePage(),
      ),
    );
  }
}

class SamplePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocBuilder<SampleBlocDI, int>(
          builder: (context, state) => Text(
            state.toString(),
            style: TextStyle(fontSize: 70),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<SampleBlocDI>().add(SampleDIEvent());
        },
      ),
    );
  }
}
