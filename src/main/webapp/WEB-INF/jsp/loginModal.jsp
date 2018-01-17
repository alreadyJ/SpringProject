<%--
  Created by IntelliJ IDEA.
  User: alreadyj
  Date: 14/01/2018
  Time: 5:20 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!--Modal: Login / Register Form-->
<div class="modal fade" id="modalLRForm" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog cascading-modal" role="document">
        <!--Content-->
        <div class="modal-content">

            <!--Modal cascading tabs-->
            <div class="modal-c-tabs">

                <!-- Nav tabs -->
                <ul class="nav nav-tabs tabs-2 light-blue darken-3" role="tablist">
                    <li class="nav-item">
                        <a class="nav-link active" data-toggle="tab" href="#panel7" role="tab"><i class="fa fa-user mr-1"></i> Login</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" data-toggle="tab" href="#panel8" role="tab"><i class="fa fa-user-plus mr-1"></i> Register</a>
                    </li>
                </ul>

                <!-- Tab panels -->
                <div class="tab-content">
                    <!--Panel 7-->
                    <div class="tab-pane fade in show active" id="panel7" role="tabpanel">

                        <!--Body-->
                        <div class="modal-body mb-1">
                            <div class="md-form form-sm">
                                <i class="fa fa-envelope prefix"></i>
                                <input type="email" id="form22" class="form-control validate">
                                <label data-error="wrong" data-success="right" for="form22">Your email</label>
                            </div>

                            <div class="md-form form-sm">
                                <i class="fa fa-lock prefix"></i>
                                <input type="password" id="form23" class="form-control validate">
                                <label data-error="wrong" data-success="right" for="form23">Your password</label>
                            </div>
                            <div class="text-center mt-2">
                                <button class="btn btn-info">Log in <i class="fa fa-sign-in ml-1"></i></button>
                            </div>
                        </div>
                        <!--Footer-->
                        <div class="modal-footer">
                            <div class="options text-center text-md-right mt-1">
                                <p>Not a member? <a href="#" class="blue-text">Sign Up</a></p>
                                <p>Forgot <a href="#" class="blue-text">Password?</a></p>
                            </div>
                            <button type="button" class="btn btn-outline-info waves-effect ml-auto" data-dismiss="modal">Close</button>
                        </div>

                    </div>
                    <!--/.Panel 7-->

                    <!--Panel 8-->
                    <div class="tab-pane fade" id="panel8" role="tabpanel">

                        <!--Body-->
                        <form name="signUpForm" method="post" id="signUpForm" action="signUp">
                            <input type="hidden" id="email_ch" name="email_ch" value="false"/>
                            <input type="hidden" id="pass_ch" name="pass_ch" value="false"/>
                            <input type="hidden" id="m_name_ch" name="m_name_ch" value="false"/>

                            <div class="modal-body">
                                <div class="md-form form-sm">
                                    <i class="fa fa-envelope prefix"></i>
                                    <input type="email" id="m_email" name="m_email" class="form-control validate">
                                    <label data-error="wrong" data-success="right" for="m_email">Your email
                                        <p id="email_notice" style="display: none; color: red;">    Check the Your email!</p>
                                    </label>
                                </div>

                                <div class="md-form form-sm">
                                    <i class="fa fa-lock prefix"></i>
                                    <input type="password" id="m_pass" name="m_pass" class="form-control validate">
                                    <label data-error="wrong" data-success="right" for="m_pass">Your password
                                        <p id="info_pass1" style="display: none; color:red;">    English & number & more than 8 char</p>
                                    </label>

                                </div>

                                <div class="md-form form-sm">
                                    <i class="fa fa-lock prefix"></i>
                                    <input type="password" id="m_pass_ch" class="form-control validate">
                                    <label data-error="wrong" data-success="right" for="m_pass_ch">Repeat password
                                        <p id="pass_ch_notice" style="display: none; color:red;">    The password does not match!</p>
                                    </label>

                                </div>

                                <div class="md-form form-sm">
                                    <input type="text" id="m_name" name="m_name" class="form-control validate">
                                    <label data-error="wrong" data-success="right" for="m_name">Your Nickname</label>
                                    <p id="name_notice" style="display: none;color:red;">    Your nickname can't contain spaces!</p>
                                </div>

                                <div class="text-center form-sm mt-2">
                                    <button class="btn btn-info" onclick="doSubmit();">Sign up <i class="fa fa-sign-in ml-1"></i></button>
                                </div>

                            </div>
                        </form>
                        <!--Footer-->
                        <div class="modal-footer">
                            <div class="options text-right">
                                <p class="pt-1">Already have an account? <a href="#panel7" class="blue-text">Log In</a></p>
                            </div>
                            <button type="button" class="btn btn-outline-info waves-effect ml-auto" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                    <!--/.Panel 8-->
                </div>

            </div>
        </div>
        <!--/.Content-->
    </div>
</div>
<!--Modal: Login / Register Form-->

<div class="text-center">
    <a href="" class="btn btn-default btn-rounded" data-toggle="modal" data-target="#modalLRForm" style="padding :10px 25px;">LogIn</a>
</div>