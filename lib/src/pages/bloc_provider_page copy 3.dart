import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_widget_sample/src/bloc/sample_bloc_di_multi.dart';
import 'package:flutter_bloc_widget_sample/src/repository/repository_sample.dart';
import 'package:flutter_bloc_widget_sample/src/repository/repository_seconds_sample.dart';

class MultiRepositoryProviderPage extends StatefulWidget {
  const MultiRepositoryProviderPage({super.key});

  @override
  State<MultiRepositoryProviderPage> createState() =>
      _MultiRepositoryProviderPageState();
}

class _MultiRepositoryProviderPageState
    extends State<MultiRepositoryProviderPage> {
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => RepositorySample(),
        ),
        RepositoryProvider(
          create: (context) => RepositorySecondSample(),
        )
      ],
      child: BlocProvider(
        create: (context) => SampleBlocDIMulti(
          context.read<RepositorySample>(),
          context.read<RepositorySecondSample>(),
        ),
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder<SampleBlocDIMulti, int>(
            builder: (context, state) => Text(
              state.toString(),
              style: TextStyle(fontSize: 70),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    context.read<SampleBlocDIMulti>().add(SampleDiFirstEvent());
                  },
                  child: Text('first')),
              const SizedBox(width: 15),
              ElevatedButton(
                  onPressed: () {
                    context
                        .read<SampleBlocDIMulti>()
                        .add(SampleDiSecondEvent());
                  },
                  child: Text('second')),
            ],
          ),
        ],
      ),
    ));
  }
}
