import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:merchant_app/features/menu/presentation/manager/menu_bloc.dart';
import 'package:merchant_app/features/menu/presentation/manager/menu_event.dart';
import 'package:merchant_app/features/menu/presentation/manager/menu_state.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  final _formKey=GlobalKey<FormState>();
  final TextEditingController newPasswordController= TextEditingController();
  final TextEditingController oldPasswordController=TextEditingController();
   bool _isPasswordVisible = false;
   @override
   void dispose(){
    newPasswordController.dispose();
    oldPasswordController.dispose();
    super.dispose();
   }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Change Password'),
        backgroundColor:Colors.blue,
      ),
      body: SingleChildScrollView(
          child:  Padding(
          padding: const EdgeInsets.all(20),
          child:Form(
            key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:  [
              const SizedBox(height: 80,),
              
              const Text('Change Password',style: TextStyle(fontSize: 30,color: Color(0xFF025AA2)),),
              const SizedBox(height: 20,),
              const Text('Please Change Your Password'),
              const  SizedBox(height: 30,),
             TextFormField(
              controller: oldPasswordController,
              obscureText: _isPasswordVisible,
              decoration: InputDecoration(
                border:  const OutlineInputBorder(
                  borderRadius: BorderRadius.zero,
                ),
                labelText: 'Old Password',
                suffixIcon: IconButton(
                  icon: Icon(_isPasswordVisible ? Icons.visibility : Icons.visibility_off),
                  onPressed: (){
                   setState(() {
                     _isPasswordVisible=!_isPasswordVisible;
                   });
                  },)
              ),
              validator: (value) {
                if(value==null || value.isEmpty){
                  return 'Please Enter old password';
                }
              },
             ),
             const SizedBox(height: 20,),
              TextFormField(
              controller: newPasswordController,
              obscureText: _isPasswordVisible,
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.zero),
                labelText: 'New Password',
                suffixIcon: IconButton(
                  icon: Icon(_isPasswordVisible ? Icons.visibility : Icons.visibility_off),
                  onPressed: (){
                   setState(() {
                     _isPasswordVisible=!_isPasswordVisible;
                   });
                  }, )
              ),
              validator: (value) {
                if(value==null || value.isEmpty){
                  return 'Please Enter New Pasword';
                }
              },
             ) ,
             const  SizedBox(height: 40,),
             ElevatedButton(
              onPressed: (){
                if(_formKey.currentState!.validate()){
                final oldPassword=oldPasswordController.text;
                final newPassword=newPasswordController.text;
                context.read<MenuBloc>().add(ChangePasswordEvent(oldPassword: oldPassword, newPassword: newPassword));
                }
              },
             child: const Text('Change Password',style: TextStyle(fontSize:20,color:  Color(0xFF025AA2),),)),
             const SizedBox(height: 20,),
             
              BlocListener<MenuBloc,MenuState>(
                listener: (context,state){
                 if(state  is ChangePasswordFailureState){
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Something Went Wrong"),
                      backgroundColor: Colors.red,
                      ),
                  );
                 
                 }
                },
                   child: const SizedBox(),
                ),
             const SizedBox(height: 30,),
             BlocBuilder<MenuBloc,MenuState>(
              builder: (context,state){
               if(state is ChangePasswordLoading){
                return const CircularProgressIndicator(color: Colors.blue,);
               }else if(state is ChangePasswordSuccess){
                
               }
               return const SizedBox();
              }),
            ],
          ),
          ),
        ),
      ),
      
    );
  }
}