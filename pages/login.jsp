<%@page import="far.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html ng-app="myStore">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.5.3/angular.min.js"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.5.3/angular-animate.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.13.1/jquery.validate.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-rtl/3.2.0-rc2/css/bootstrap-rtl.min.css"></script>
    <script type="text/javascript" src="ui-bootstrap-tpls-1.3.2.min.js"></script>
    <script type="text/javascript" src="angular-messages.min.js"></script>
    <script type="text/javascript" src="app.js"></script>
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-rtl/3.2.0-rc2/css/bootstrap-rtl.min.css">
    <link rel="stylesheet" type="text/css" href="style.css">
    <link rel="stylesheet" type="text/css" href="ui-bootstrap-custom-1.3.2-csp.css">
      <link rel="stylesheet" href="css/fonts.min.css" />
  </head>



  </head>


  <body ng-app="myStore">
		<div class="background">
			<div class="container">
				<div class="row">
				<h2><em>به هسته‌ معاملات بورس خوش آمدید.</em></h2>
				</br></br>
      </div>
			  <div class="row">
			    <div class="col-sm-4">
			    </div>

			    <div class="col-sm-4">
            <div class="row">
  				    <div class="content">
  			            <div class="wrap">
  			                <form name="loginForm" class="login" method="post" action="j_security_check">
  				                <input name="j_username" ng-model="user" type="text" placeholder="شناسه کاربری" required/>
  				                <input name="j_password" ng-model="pass" type="password" placeholder="رمز عبور" required/>
  				                <input type="submit" value="ورود" class="btn btn-default btn-sm" />
  			                </form>
  			            </div>
              </div>
            </div>
            </br>

            <div class="row">
              <div  ng-controller="ModalDemoCtrl" >
                <script type="text/ng-template" id="myModalContent.html">
                  <div name="mymodal">
                    <form name="reqForm" role="form" action="register.jsp">
                      <div class="modal-header">
                        <h3 class="modal-title">عضویت</h3>
                      </div>
                      <div class="modal-body">

                        <!-- <label for="quantity" class="control-label">تعداد</label> -->
                        <input type="text"
                        placeholder="نام"
                        name="name"
                        class="form-control"
                        id="name"
                        ng-model="selected.name"
                        required />
                        <div ng-messages="reqForm.name.$error" ng-if="reqForm.name.$touched">
                          <div ng-message="required" class="error-msg">لطفا نام خود را وارد کنید.</div>
                        </div> </br>

                        <!-- <label for="price" class="control-label">قیمت</label> -->
                        <input type="text"
                        name="family"
                        class="form-control"
                        id="family"
                        ng-model="selected.family"
                        placeholder="نام خانوادگی"
                        required />
                        <div ng-messages="reqForm.family.$error" ng-if="reqForm.family.$touched">
                          <div ng-message="required" class="error-msg">لطفا نام خانوادگی خود را وارد کنید.</div>
                        </div> </br>
                        <input type="email"
                        name="email"
                        class="form-control"
                        id="email"
                        ng-model="selected.email"
                        placeholder="آدرس ایمیل"
                        required />
                        <div ng-messages="reqForm.email.$error" ng-if="reqForm.email.$touched">
                          <div ng-message="required" class="error-msg">لطفا آدرس ایمیل را صحیح وارد کنید.</div>
                        </div> </br>
                        <input type="text"
                        name="id"
                        class="form-control"
                        id="id"
                        ng-model="selected.id"
                        placeholder="شناسه کاربری"
                        required />
                        <div ng-messages="reqForm.id.$error" ng-if="reqForm.id.$touched">
                          <div ng-message="required" class="error-msg">لطفا شناسه کاربری انتخاب کنید.</div>
                        </div> </br>

                        <input type="password"
                          name="pwd" ng-model="thePwd"
                          class="form-control"
                          id="password"
                          placeholder="رمز عبور"
                          required />
                        </br>
                        <input type="password"
                          name="chk" ng-model="chkPwd"
                          class="form-control"
                          id="repassword"
                          placeholder="تکرار رمز عبور"
                          wj-validation-error="chkPwd != thePwd ? 'Passwords don\'t match' : ''" />

                        </div>
                        <div class="modal-footer">
                          <button class="btn btn-success" ng-click="ok(reqForm)" type="submit"  >ثبت نام</button>
                          <button class="btn btn-danger" type="button" ng-click="cancel()">لغو</button>
                        </div>
                      </form>
                    </div>
                  </script>

                  <p>&emsp;&emsp;&emsp;&emsp;&emsp;نخستین ورود شما به سامانه است؟
                    <a type="button" ng-click="open('sm',symbol.name)">
                      عضویت
                    </a>
                  </p>
                </br></br>
              </div>



            </div>

			   			<!-- LOGIN FORM -->
						<%-- <div class="login-form-1">
							<form id="login-form" class="text-left">
								<div class="login-form-main-message"></div>
								<div class="main-login-form">
									<div class="login-group">
										<div class="form-group">
											<label for="lg_username" class="sr-only">Username</label>
											<input type="text" class="form-control" id="lg_username" name="lg_username" placeholder="username">
										</div>
										<div class="form-group">
											<label for="lg_password" class="sr-only">Password</label>
											<input type="password" class="form-control" id="lg_password" name="lg_password" placeholder="password">
										</div>
									</div>
									<button type="submit"  class="login-button"><i class="fa fa-chevron-right">ورود</i></button>
								</div>
							</form>
						</div>
           --%>

          </div>


			   	<div class="col-sm-4">
            </br>

	    		</div>
			  </div>
			</div>
		</div>
	</body>
</html>

