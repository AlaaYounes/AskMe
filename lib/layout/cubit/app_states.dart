abstract class AppStates {}
class AppInitialState extends AppStates{}
class AppChangeBottomNavState extends AppStates{}
class AppMoveToSigninScreenState extends AppStates{}
class AppMoveToRegisterScreenState extends AppStates{}
class AppGetUserLoadingState extends AppStates{}
class AppGetUserSuccessState extends AppStates{}
class AppGetUserDataState extends AppStates{}
class ggState extends AppStates{}
class pickImageState extends AppStates{}

class AppGetUserErrorState extends AppStates{
  final String error;
  AppGetUserErrorState(this.error);
}
class pickImagefaildState extends AppStates{
  final String error;
  pickImagefaildState(this.error);
}


