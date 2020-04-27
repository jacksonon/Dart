import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class gridPage extends Page<gridState, Map<String, dynamic>> {
  gridPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<gridState>(
                adapter: null,
                slots: <String, Dependent<gridState>>{
                }),
            middleware: <Middleware<gridState>>[
            ],);

}
