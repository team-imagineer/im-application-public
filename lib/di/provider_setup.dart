import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:im_application/data/repository/bookmark_repository_impl.dart';
import 'package:im_application/data/repository/explore_book_repository_impl.dart';
import 'package:im_application/data/repository/review_repository_impl.dart';
import 'package:im_application/data/source/database_helper.dart';
import 'package:im_application/domain/model/filter/filter_item.dart';
import 'package:im_application/domain/usecase/bookmark_use_case.dart';
import 'package:im_application/domain/usecase/review_use_case.dart';
import 'package:im_application/presentation/explore/explore_problem_view_model.dart';
import 'package:im_application/presentation/login/login_view_model.dart';
import 'package:im_application/presentation/main/main_view_model.dart';
import 'package:im_application/presentation/my_book/my_book_view_model.dart';
import 'package:im_application/presentation/review/review_detail_view_model.dart';
import 'package:im_application/presentation/review/review_view_model.dart';
import 'package:im_application/presentation/setting/setting_view_model.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:sqflite/sqflite.dart';

import '../data/repository/login_repository_impl.dart';
import '../data/repository/my_book_repository_impl.dart';
import '../data/repository/scoring_repository_impl.dart';
import '../data/repository/util/model_maker.dart';
import '../data/source/api.dart';
import '../data/source/kakao_api.dart';
import '../data/source/secure_data.dart';
import '../domain/manager/user_manager.dart';
import '../domain/model/filter/filter_row.dart';
import '../domain/usecase/explore_use_case.dart';
import '../domain/usecase/login_use_case.dart';
import '../domain/usecase/my_book_use_case.dart';
import '../domain/usecase/scoring_use_case.dart';
import '../domain/usecase/tutorial_use_case.dart';
import '../presentation/explore/explore_view_model.dart';
import '../presentation/init/init_view_model.dart';
import '../presentation/my_book/my_book_detail_view_model.dart';
import '../presentation/others/webview/webview_view_model.dart';
import '../presentation/solve/result/result_view_model.dart';
import '../presentation/solve/solve_view_model.dart';
import '../ui/manager/theme_manager.dart';

Future<List<SingleChildWidget>> getProviders() async {
  // DB ?????? ?????? ??? ??? ????????? ?????? ?????? ?????? ?????? ??????.
  // deleteDatabase(join(await getDatabasesPath(), 'seodaang.db'));

  // DB ??????
  Database database = await openDatabase(
    join(await getDatabasesPath(), 'seodaang.db'),
    version: 1,
    onCreate: (db, version) async {
      db.execute(
          'CREATE TABLE solve (id INTEGER PRIMARY KEY AUTOINCREMENT, learningId TEXT NOT NULL, bookId TEXT NOT NULL, problemId TEXT NOT NULL, answer INTEGER, scribbleData TEXT)');
      db.execute(
          'CREATE TABLE passage (id INTEGER PRIMARY KEY AUTOINCREMENT, learningId TEXT NOT NULL, bookId TEXT NOT NULL, passageId TEXT NOT NULL, time INTEGER NOT NULL, scribbleData TEXT)');
      db.execute(
          'CREATE TABLE status (id INTEGER PRIMARY KEY AUTOINCREMENT, learningId TEXT NOT NULL, bookId TEXT NOT NULL, duration INTEGER NOT NULL, indexNum INTEGER NOT NULL)');
    },
  );

  // Independent tModels
  http.Client client = http.Client();
  KakaoApi kakaoApi = KakaoApi();
  FlutterSecureStorage secureStorage = const FlutterSecureStorage();
  ModelMaker modelMaker = ModelMaker();

  // Data Sources
  Api api = Api(client);
  DatabaseHelper databaseHelper = DatabaseHelper(database);
  SecureData secureData = SecureData(secureStorage);

  // Repositories
  LoginRepositoryImpl loginRepositoryImpl =
      LoginRepositoryImpl(api, kakaoApi, databaseHelper);
  MyBookRepositoryImpl myBookRepositoryImpl =
      MyBookRepositoryImpl(api, databaseHelper, modelMaker);
  ExploreBookRepositoryImpl exploreBookRepositoryImpl =
      ExploreBookRepositoryImpl(api, modelMaker);
  ScoringRepositoryImpl scoringRepositoryImpl = ScoringRepositoryImpl(api);
  ReviewRepositoryImpl reviewRepositoryImpl =
      ReviewRepositoryImpl(api, modelMaker);
  BookmarkRepositoryImpl bookmarkRepositoryImpl = BookmarkRepositoryImpl(api);

  // Managers
  UserManager userManager = UserManager(secureData, loginRepositoryImpl);

  // UseCases
  TutorialUseCase tutorialUseCase = TutorialUseCase(userManager);
  LoginUseCase loginUseCase = LoginUseCase(loginRepositoryImpl, userManager);
  MyBookUseCase myBookUseCase =
      MyBookUseCase(myBookRepositoryImpl, userManager);
  ExploreUseCase exploreUseCase =
      ExploreUseCase(exploreBookRepositoryImpl, userManager);
  ScoringUseCase scoringUseCase =
      ScoringUseCase(scoringRepositoryImpl, userManager);
  ReviewUseCase reviewUseCase =
      ReviewUseCase(reviewRepositoryImpl, userManager);
  BookmarkUseCase bookmarkUseCase =
      BookmarkUseCase(bookmarkRepositoryImpl, userManager);

  // Filter Data
  List<FilterRow> bookFilters = _getBaseFilters();

  List<FilterRow> problemFilters = _getBaseFilters();

  List<FilterRow> reviewFilters = _getBaseFilters()
    ..addAll([
      FilterRow(id: "bookmarkedOnly", showName: "????????? ??????", itemList: [
        FilterItem(id: "true", showName: "????????????"),
      ]),
    ]);

  // VIEW MODEL
  InitViewModel initViewModel = InitViewModel(loginUseCase);
  MainViewModel mainViewModel = MainViewModel(tutorialUseCase);
  LoginViewModel loginViewModel = LoginViewModel(loginUseCase);
  MyBookViewModel myBookViewModel = MyBookViewModel(myBookUseCase);
  MyBookDetailViewModel myBookDetailViewModel =
      MyBookDetailViewModel(myBookUseCase);
  ExploreViewModel exploreViewModel =
      ExploreViewModel(exploreUseCase, bookFilters);
  ExploreProblemViewModel exploreProblemViewModel =
      ExploreProblemViewModel(exploreUseCase, reviewUseCase, problemFilters);
  SolveViewModel solveViewModel = SolveViewModel(
      myBookUseCase, bookmarkUseCase, tutorialUseCase, databaseHelper);
  ResultViewModel resultViewModel = ResultViewModel(scoringUseCase);
  ReviewViewModel reviewViewModel =
      ReviewViewModel(reviewUseCase, bookmarkUseCase, reviewFilters);
  ReviewDetailViewModel reviewDetailViewModel =
      ReviewDetailViewModel(databaseHelper);
  WebViewViewModel webViewViewModel = WebViewViewModel();
  SettingViewModel settingViewModel = SettingViewModel(loginUseCase);

  ThemeManager themeManager = ThemeManager(secureData);

  return [
    ChangeNotifierProvider(create: (_) => initViewModel),
    ChangeNotifierProvider(create: (_) => mainViewModel),
    ChangeNotifierProvider(create: (_) => loginViewModel),
    ChangeNotifierProvider(create: (_) => myBookViewModel),
    ChangeNotifierProvider(create: (_) => myBookDetailViewModel),
    ChangeNotifierProvider(create: (_) => exploreViewModel),
    ChangeNotifierProvider(create: (_) => exploreProblemViewModel),
    ChangeNotifierProvider(create: (_) => solveViewModel),
    ChangeNotifierProvider(create: (_) => resultViewModel),
    ChangeNotifierProvider(create: (_) => reviewViewModel),
    ChangeNotifierProvider(create: (_) => reviewDetailViewModel),
    ChangeNotifierProvider(create: (_) => webViewViewModel),
    ChangeNotifierProvider(create: (_) => settingViewModel),
    ChangeNotifierProvider(create: (_) => themeManager),
  ];
}

List<FilterRow> _getBaseFilters() {
  return [
    FilterRow(
      id: "grades",
      showName: "??????",
      itemList: List.generate(
        3,
        (index) => FilterItem(id: "${index + 1}", showName: "???${index + 1}"),
      ),
    ),
    // FilterRow(id: "category", showName: "????????????", itemList: [
    //   FilterItem(id: "??????", showName: "??????"),
    //   FilterItem(id: "??????", showName: "??????"),
    //   FilterItem(id: "???????????????", showName: "???????????????"),
    //   FilterItem(id: "???????????????", showName: "???????????????"),
    // ]),
    FilterRow(
      id: "years",
      showName: "?????? ??????",
      itemList: List.generate(
        7,
        (index) =>
            FilterItem(id: "${index + 2016}", showName: "${index + 2016}???"),
      ),
    ),
    FilterRow(id: "months", showName: "?????? ???", itemList: [
      FilterItem(id: "03", showName: "3???"),
      FilterItem(id: "04", showName: "4???"),
      FilterItem(id: "06", showName: "6???"),
      FilterItem(id: "07", showName: "7???"),
      FilterItem(id: "09", showName: "9???"),
      FilterItem(id: "10", showName: "10???"),
      FilterItem(id: "11", showName: "11???"),
    ]),
  ];
}
