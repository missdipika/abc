import 'package:abc/register.dart';
import 'package:flutter/material.dart';
import 'package:abc/ab.dart';
//import 'package:flutter/secondScreen.dart';

void main() {
  runApp(MaterialApp(
//     title: "new",
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _value = 1;
  bool _isVissiblePassword = true;
  bool _isChecked = false;
  // static const _suc = true;
  bool isEmailCorrect = false;
  bool isPassCorrect = false;
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailCtl = TextEditingController();
  TextEditingController passCtl = TextEditingController();
  bool _isValid = false;

  void _saveForm() {
    setState(() {
      bool _isValid = _formKey.currentState!.validate();
    });
  }

  //bool isHiddenPassword = true;

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Scaffold(
            backgroundColor: Colors.white.withOpacity(0.9),
            body: SingleChildScrollView(
                // key: formkey,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                  Container(
                    padding: const EdgeInsets.only(top: 5, left: 30, right: 30),
                    height: 200,
                    width: 180,
                    //   alignment: Alignment.center,
                    child: const CircleAvatar(
                      backgroundImage: NetworkImage(
//                 "https://media.wired.com/photos/5926ffe47034dc5f91bed4e8/master/pass/google-logo.jpg"
                        //       "https://images.unsplash.com/photo-1658070781263-ca4cef87d5cd?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyfHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=400&q=60"
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTQEaZw3o7TsI-mVQh5y5gZ7QFK35WDFZ8SCw&usqp=CAU",
                      ),
                      radius: 120,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: emailCtl,
                      onChanged: (value) {
                        bool emailCheck = RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(value);
                        if (emailCheck) {
                          setState(() {
                            isEmailCorrect = true;
                          });
                        } else {
                          setState(() {
                            isEmailCorrect = false;
                          });
                        }
                      },
                      validator: (value) {
                        bool emailCheck = RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(value!);
                        if (value.isEmpty) {
                          return 'Please Enter Email';
                        } else if (!emailCheck) {
                          return 'Enter Correct Email';
                        }
                        return null;

                        // suffixIcon: _suc == true ? Icon(Icons.check_circle_rounded, color: Colors.green): Icon(Icons.close, color: Colors.red) ,
                      },
                      decoration: InputDecoration(
                        suffixIcon: emailCtl.text.isEmpty
                            ? null
                            : isEmailCorrect == true
                                ? const Icon(Icons.check_circle_rounded,
                                    color: Colors.green)
                                : const Icon(Icons.close, color: Colors.red),
                        //border: OutlineInputBorder(),
                        hintText: 'Email/Student Code',
                        //Validator: EmailValidator(errorText)
                        // errorText: emailCtl.text == '' ? "Enter valid Email" : null,
                        hintStyle: const TextStyle(fontSize: 15),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: TextFormField(
                      obscureText: _isVissiblePassword,
                      obscuringCharacter: "*",
                      maxLength: 10,

                      // keyboardType: TextInputType.,
                      controller: passCtl,
                      onChanged: (value) {
                        bool passCheck = RegExp(
                                r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                            .hasMatch(value);
                        if (passCheck) {
                          setState(() {
                            isPassCorrect = true;
                          });
                        } else {
                          setState(() {
                            isPassCorrect = false;
                          });
                        }
                      },
                      validator: (value) {
                        bool passCheck = RegExp(
                                r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                            .hasMatch(value!);
                        if (value.isEmpty) {
                          return 'Please Enter password';
                        } else if (!passCheck) {
                          return 'Enter Correct password';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                            icon: _isVissiblePassword
                                ? Icon(
                                    Icons.visibility_off,
                                    color: Colors.grey,
                                  )
                                : Icon(
                                    Icons.visibility,
                                    color: Colors.green,
                                  ),
                            onPressed: () => {
                                  setState(() {
                                    _isVissiblePassword = !_isVissiblePassword;
                                  })
                                }),

                        //border: OutlineInputBorder(),
                        hintText: 'password',
                        hintStyle: TextStyle(fontSize: 15),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Checkbox(
                              value: _isChecked,
                              checkColor: Colors.white,
                              activeColor: Colors.green,
                              //groupValue: _value,
                              onChanged: (status) {
                                setState(() {
                                  _isChecked = status!;
                                });

                                // SizedBox(width: 10.0);
                              }),
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Text(
                              'Remember me',
                              style: TextStyle(color: Colors.black),
                            ),
                          )
                        ],
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          textStyle: const TextStyle(fontSize: 15),
                        ),
                        onPressed: () {},
                        child: const Text('Forgot Password?'),
                      ),
                    ],
                  ),
                  Container(
                    width: 650,
                    height: 50,
                    padding: const EdgeInsets.only(
                      top: 12,
                      left: 10,
                      right: 10,
                      // top: constraints.maxHeight *0.05,
                    ),
                    child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            print("validate");
                          } else
                            print("button");
                        },
                        child: const Text(
                          "LOGIN",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.deepPurpleAccent,
                        )),
                  ),
                  const SizedBox(height: 42),
                  const Text(
                    "or",
                    style: const TextStyle(fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Expanded(
                      child: Container(
                        height: 43,
                        //width: 180,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: const Color(0xFF375E95)),
                          onPressed: () {},
                          child: const Icon(Icons.facebook),
                        ),
                      ),
                    ),
                    const SizedBox(width: 30),
                    Expanded(
                      child: Container(
                        height: 43,

                        //width: 200,
                        child: ElevatedButton(
                            style:
                                ElevatedButton.styleFrom(primary: Colors.white),
                            onPressed: () {},
                            child: Image.asset(
                              "assets/g.png",
                              // "https://images.unsplash.com/photo-1658070781263-ca4cef87d5cd?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyfHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=400&q=60"
                              width: 25,
                              height: 25,
                            )),
                        //               child: Row(
                        //                 // mainAxisAlignment: MainAxisAlignment.spaceAround,
                        //                 children: [
                        // //                   SizedBox(width: 26),

                        //                   // Icon(Icons.google),
                        //                   /* CircleAvatar(
                        //                       backgroundImage: NetworkImage(
                        //                     "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAOEAAADhCAMAAAAJbSJIAAABaFBMVEX////qQzU0qFNChfT7vAUzfvPK3ew4gPSdu/jqPzD7ugCxyPr7uQDqQTPpNCIupk8opUvpOSkfo0b74uDpNyfpLxz2t7PqRjj4ysf7393pLhr98fD1rqn8wQD92H/x+fMzqUmSzaDzoJrtX1TuamBTs2un1rJDg/zf8OP51dPzmJHvd2797ezrTUDtZFrykYr3wL33ozT80m3946jpODX+8tP8yEr/+en93pn8xz3+7s37wCP//vb81G9Bhu6y27zG5M2CxpJiuHd7w41ErV/P6dbj8ubxg3vwfnbsVEj3oRXuZUPyiDv6tR7wdz71mTz4rSrvbEL7z47l7vVrnu+vzuc4h+P+6Lmzy/NspOT8z1t0qea+1+fh1YyXtEFkr1DS3vzSui2Yv+attz9/sknivCBRrleCsefJujR1sk+VtkrKtyCmx+g/jdM8lbI4nog1pWY9kcI6m5lAi9o+kMc8lLg6mZ83oXbE8S5XAAAK7UlEQVR4nO2c+X/bthXAaUqOS9Y8RVnWkerWJDmytDjHUqe2Th9d161z6jTt1q5H2h3pmrU7/v2BkqyTAEGQAEh99P0pyacJ9fV7eO+BgCoIW7Zs2bJly5YtwZBNpBuHB7lSs9lut5ulUu7gsJFOZHl/rEBId0qXx9cpyVBVyzKmWJYKfiulriuXucM0749ITLaRu2xlkqplSApgZw3wh5JkqcnMdfsgwfvTeiV72KwYSUty8HJAMaykclRKRyZr07lKSjUw7WaWIJqto4MHvD+8O+lmy8KN3bqlapRzoZYEehmDzG4eyszxQUjTNXtQSfrTmyKp0mWDt806icuUKgWgN0Yx1PIBb6NlGgGFb46kqs3wrMjOcSaw8M1RjGQ7HG2yUw4uPVcdjUv+jofU/KaObb6FNU0lP5cd1RI/vwdtmvGbOaqtDifB3E7A9ROGpFZ4LMfEscrGb+yYZJ+qJRYJOkdRy2zHnHSZYQAnSEwrTs5gGsAJinrMasjJVpKsAzhBSrIZVhspg4sfQMlcMhDMWRwydIZVpt43rpiXmGUk45CqX7ZscfXbsTM1R1Ew0eK2BBdQ6Q3jDYnnEpwhGbTWYodTk1hBStESPOBcY6ZIO7QEcyERpBbBXEhSVNl0we0aJKWz6YKNTU/RBOFRUsDQE8y2wjHJUEtRoRyGWZRimxCuuO8mbOilKBhleMvZUIxgwwpDlaEYwexOcKeeiiRJ0/s04FdO10+ggvSKjFAJpMookqFaO9flypV9IarZbh9Vyq0dFfe+BsUIgmnUv52hJq+vSp30yrvO7IN0p3nUwrhzQzOCab8nL4qRVC5Rd2SyidyVij4gpykolH0tQhC9VhPn0trhpaJCI0kzRYWSn0Yhqak2/lnK4ZHhXLSpRjDhY0MhJcser/0kmjsOjlQFfeSolCmTvLbNrcWRYqMXfAwzikrkN36mslR0qK5B4YGXlryI1fJxQJRtL5yK0I2g0Cbr9VKm5O+FdGN2eE43gkKaqMwoVtn/nebc5PycbpERhGOSMhPQQXTi2KIeQeEwQyBopIK6TNBM0o4gUadQK8EdCXVoC3a8dwpFbdL9TMHiPYSKSvPcMnBOPmx5rKSKxevqGRnP4r/77SNvEaR7uB40L/fj8fsfPcIPo6KG8OI5iidyHCj+OoWrqFjRiqDwGITQVsTNVEWN1hoUhIdyfMpHWIrRqqKAp/EZ93+PkanR6oM2J/sLiu6ZalR4f2DPPJHji3yMVpRaIf2OEpzH+0uCIFNRbSNyfQLw3nIIgeIfWvAwWhy/KUDK/VXDeHz/E5iiVOb9cb2zmqSTMMIGnEwEv6W8lqR3meqkGMUcFeKOhqBtOGSqEr06CklSWKaqIfsSJBa/gRquj+JRLDNr7X4lU5cHnEzEdhRjnsL9xixmajRD+BKepNNMnSsmoxhCSK9wzNRohhC5DO/4eBLGSBZS4TmG4HQUV1IR7IWC8L7LMpwq2qO40eb9YYlAdMNlPnkUwV2TzUOcLJ1k6jXvz0qGw84Jxh+JH3Jzjy43qIfjJinYMj4mNnx3ly4vEM+Gj93rEAsCwxhVbvPwZ7tNNHPkh+E13EWkKXYpje+fhNjwU/izP8cuNPtPw2u49w782c9wDeXT5yE2RJSaU2zDz8kFqRvGbqGPdtscLhi+F2bDXeijH+Mvw5ehNrzn31Am7/csDKHFFG9nMcZHKWVg+Bns0dgN31cppW+49wPs0SfYhs98CDIwfAV7NPZIIz8Jt+EvsEe7voaaGfpph/QNYwEYfhBuQ2jLxzf00/AZGJ7BHv3BphjGtoaba7j563BjaincELvjh7wfQrvFpsw0cMNNmUvhM83G7C2ghpuyP4TvLTZlj7/3hX/DcL+ngb8w3Zh3bdC3GJvyvhTxWn8z3nnHdv8EffZmnFugDp824+wJ8c57Q84P4YP3ppwBw4c2gdk5Pl1B+EgjeLmLsf/n8Bq+i3g47n0aOf7l0IfhHhG4hqhTbtxiKp9+JZojUsO/vEPEF7iK8MM1AXd3IX8tiqLeIzUk5FPc5D5DXRl6jpWh34pjENdWaIAdQ/ght437/VL59G8TQfOckdqUW0xBZCnFeN0mvxanaFVGahNucJN07xvkv+My1cjyt+IMs8vGbcJnuIbIQuO2RZRPv5sLMg7iC9xliCw0Anohyq+/FxdhGcQbTD+3QoPsiPJfxWVYBvEb7GUIPcSfAh2+5fh34ioMyyluJUVtf6dAvrsmv/5KWzPUhqx64j3sWXbX9SM594u1DJ2gF1noAV5hT6Vuy9A5TWX5S0dBkKd1BnoemqFbNxyzvoMCGQoRZFVs8EPo0g3HrKXpeNCGYbLIU/xViJGka2m6NMY4KRLvovDB7vaIF/qLLDX92aANzVP6e4w3+CHESdLlY0T56+/RgkCxT1kwf4YtGDvD+nEvzKYuGcpmKeKXGcwknb+tcRpjHBVrNAWx9/bYSTqrNauDNkKxS0/wBj+CyHfBy4xrDWSMcUSnppi/9WCI0+4nvL8PmsTf8QUp9gz8RhFDfx9ohWf7p7gZSjdRX3l5e+zyhmaJk3948xMpJeoPnl6P49aZMdX1rZJrFIOvqN4E93Amthld07Nh8H3RU4qCEL7x9K8TBFE0+0EOcPkXHk9w8OaZGSRBBDNqcCX1npc2YYPfKqb0CYIoaoFl6puYR8FYzGsC1UmCCDK1GsSu/8bjEgTseg2hIPR0IkUQRt+rsXv7K6+CXlehTZ5IEKAP/b1krPfNtz96VSQIoSDUyPLUDmO1S+yX7+maqBX+6VGRIIQCWcfw6XjRMyeLo/DTmaeJFHWyDYew2Nw5nnv+sXYH5mzxF97+gh9G1JebkRR9KAJHseelPdaLVXMxaTTtX9iKnibSJcjzdIxuDot4zaNeG5r6ysO0ws+Yiep6GoN4MFnHWPiUuqkPzi9Qz8jXzwfamt6Ywv/wBhuyMjOBuJ4uoJvmcFDs1i9WP0e+Pqr1+qKpQ3+OhSFO2yAsM1OIhrc1NBBLUxxW+4NerwjoDfr96hC4646xW/iLGG3Dy8bXgbwYiOLUE6BPsH+J9ZcKP7lNqH5y1Gbkdyn6xa1tuB+JuhHEUvSFpv0HobhLXkdnDHhHUUS0DW+vLmD47IpBKL6FtQ23uyV45IfcFXXx346Z6n8RTqhj1j2KaIX/OigS7ZkcGfGuNqI94KztNnx2wiWIXkwFrbg64BDvKBw5D4GiVlhqG3uo/zEbAdzbok3h58UBJ5AyGjrFhbYRtGBIFDXtrm0Qb3oRhGEt3rWNPRqCdkXl3hfFSdsgf23hwoh/6wcUxB9pCYLphv8AZ79ypnlfMF/lvtPQad9qHXCuNybtO1iga7i8W6EsyOIy5CjAdzce0RhdLc/3OWWqLrK5kyzwylRzwMoPUK8yD6OmM/4uWZHxgGP2kYcDNLhgGUaN7hVPGDWRUfvXOARwQr7HJFX1YZePn029T91RZ9LkEXSrVB11c8D4C8dsHXWzz6zHI6HkqJmDcPjZjPpmwHVVA/nJqYBCuOiJAQZSM4c1/utvlfx53/nGgWc9sPy6vG0g1Ivrt0a86w1r4UrPFepF0e3+AVoP8woOV+o1+w6JV0tgJ/bDHb1F8t1i3/0yyVwO/Lf94ih8tQVNflQbDE3T9oSJ2rdPTPtGUS1ydnPq3dqgOrRz0HadYf9OE4f9Qa0bgXWHQf6iPuqe1+z7UONbUbXz7mj9HtiWLVu2bNmyZQsp/wdTDrrXAkl6QAAAAABJRU5ErkJggg==",
                        //                   ))*/
                        //                 ],
                        //               ),
                      ),
                    ),
                  ]),
                  const SizedBox(height: 42),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "don't have an account sign up?",
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          textStyle: const TextStyle(fontSize: 15),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SecondScreen()));
                        },
                        child: const Text('Register Now'),
                      ),
                    ],
                  ),
                ]))));
  }
}

//import 'package:flutter/material.dart';

