abstract class AppRegisterStates{

}
class RegisterInitialState extends AppRegisterStates{}
class RegisterSignUpSuccessState extends AppRegisterStates{}
class RegisterSignUpErrorState extends AppRegisterStates{}
class RegisterCreateUserSuccessState extends AppRegisterStates{}
class RegisterCreateUserLoadingState extends AppRegisterStates{}
class RegisterCreateUserErrorState extends AppRegisterStates{
  final String error;
  RegisterCreateUserErrorState(this.error);
}
class RegisterDisposeState extends AppRegisterStates{}
class RegisterPasswordConfirmedState extends AppRegisterStates{}
class RegisterOpenSignInScreenState extends AppRegisterStates{}
class PickImageState extends AppRegisterStates{}
class ggState extends AppRegisterStates{}
class PickImagefaildState extends AppRegisterStates{
  String s;
  PickImagefaildState(this.s);
}

