<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!doctype html>
<html lang="de">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="shortcut icon" type="image/png" href="img/uni-logo.png">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
          integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="css/login.css">
    <script
            src="https://code.jquery.com/jquery-3.5.1.min.js"
            integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
            crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"
            integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut"
            crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"
            integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k"
            crossorigin="anonymous"></script>
    <title>Login</title>
    <script src="https://kit.fontawesome.com/258052aeff.js"
            crossorigin="anonymous"></script>

    <style>
        :root {
            --input-padding-x: 1.5rem;
            --input-padding-y: 0.75rem;
        }

        .login,
        .image {
            min-height: 100vh;
        }

        .bg-image {
            background-image: url('https://source.unsplash.com/WEQbe2jBg40/600x1200');
            background-size: cover;
            background-position: center;
        }

        .login-heading {
            font-weight: 300;
        }

        .btn-login {
            font-size: 0.9rem;
            letter-spacing: 0.05rem;
            padding: 0.75rem 1rem;
            border-radius: 2rem;
        }

        .form-label-group {
            position: relative;
            margin-bottom: 1rem;
        }

        .form-label-group>input,
        .form-label-group>label {
            padding: var(--input-padding-y) var(--input-padding-x);
            height: auto;
            border-radius: 2rem;
        }

        .form-label-group>label {
            position: absolute;
            top: 0;
            left: 0;
            display: block;
            width: 100%;
            margin-bottom: 0;
            /* Override default `<label>` margin */
            line-height: 1.5;
            color: #495057;
            cursor: text;
            /* Match the input under the label */
            border: 1px solid transparent;
            border-radius: .25rem;
            transition: all .1s ease-in-out;
        }

        .form-label-group input::-webkit-input-placeholder {
            color: transparent;
        }

        .form-label-group input:-ms-input-placeholder {
            color: transparent;
        }

        .form-label-group input::-ms-input-placeholder {
            color: transparent;
        }

        .form-label-group input::-moz-placeholder {
            color: transparent;
        }

        .form-label-group input::placeholder {
            color: transparent;
        }

        .form-label-group input:not(:placeholder-shown) {
            padding-top: calc(var(--input-padding-y) + var(--input-padding-y) * (2 / 3));
            padding-bottom: calc(var(--input-padding-y) / 3);
        }

        .form-label-group input:not(:placeholder-shown)~label {
            padding-top: calc(var(--input-padding-y) / 3);
            padding-bottom: calc(var(--input-padding-y) / 3);
            font-size: 12px;
            color: #777;
        }

        /* Fallback for Edge
        -------------------------------------------------- */

        @supports (-ms-ime-align: auto) {
            .form-label-group>label {
                display: none;
            }
            .form-label-group input::-ms-input-placeholder {
                color: #777;
            }
        }

        /* Fallback for IE
        -------------------------------------------------- */

        @media all and (-ms-high-contrast: none),
        (-ms-high-contrast: active) {
            .form-label-group>label {
                display: none;
            }
            .form-label-group input:-ms-input-placeholder {
                color: #777;
            }
        }
    </style>
</head>

<body>

<div class="container mt-2 mb-4">
    <c:if test="${not empty error}">
        <div style="text-align: center" class="alert alert-danger alert-dismissible" role="alert">
            <button type="button" onclick="this.parentNode.parentNode.removeChild(this.parentNode);" class="close"
                    data-dismiss="alert"><span aria-hidden="true">x</span><span class="sr-only">Close</span></button>
            <strong><i class="fa fa-warning"></i> Your email or password is invalid. Please try again!</strong>
            <p id="alert" style="font-family: sans-serif; "></p>
        </div>
    </c:if>
</div>

<div class="container-fluid">
    <div class="row no-gutter">
        <div style="margin-top: 120px" class="d-none d-md-flex col-md-4 col-lg-6"><img src="https://www.rostock-heute.de/wp-content/uploads/2018/01/Uni_Rostock_viertschoenste_Europa-780x520.jpg" alt="Test" width="900" height="400">
        </div>

        <div class="col-md-8 col-lg-6">
            <div class="login d-flex align-items-center py-5">
                <div class="container">
                    <div class="row">
                        <div class="col-md-9 col-lg-8 mx-auto">
                            <h3 class="login-heading mb-4">Welcome here!</h3>
                            <form action="/doLogin" method="post">
                                <div class="form-label-group">
                                    <input name="username" type="email" id="inputEmail" class="form-control" placeholder="Email address" required autofocus>
                                    <label for="inputEmail">Email address</label>
                                </div>

                                <div class="form-label-group">
                                    <input name="password" type="password" id="inputPassword" class="form-control" placeholder="Password" required>
                                    <label for="inputPassword">Password</label>
                                </div>

                                <div class="custom-control custom-checkbox mb-3">
                                    <input type="checkbox" class="custom-control-input" id="customCheck1">
                                    <label class="custom-control-label" for="customCheck1">Remember password</label>
                                </div>
                                <button class="btn btn-lg btn-primary btn-block btn-login text-uppercase font-weight-bold mb-2" type="submit">Sign in</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

</body>

</html>