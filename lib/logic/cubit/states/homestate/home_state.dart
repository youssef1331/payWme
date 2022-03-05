abstract class HomeStates {}

class InitialHomeState extends HomeStates {}

class HomeUserLoadingState extends HomeStates {}

class HomeGetUserDataSucsessfulyState extends HomeStates {}

class HomeGetUserDataErrorState extends HomeStates {
  final String error;
  HomeGetUserDataErrorState(this.error);
}

class HomeChangeBottomSheetSucess extends HomeStates {}

class HomeChangeServciesAppBarTitleSucess extends HomeStates {}
