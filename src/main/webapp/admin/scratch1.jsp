<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Insert title here</title>
    <link rel="stylesheet" href="assets/vendors/iconfonts/mdi/css/materialdesignicons.min.css">
    <link rel="stylesheet" href="assets/vendors/iconfonts/ionicons/css/ionicons.css">
    <link rel="stylesheet" href="assets/vendors/iconfonts/typicons/src/font/typicons.css">
    <link rel="stylesheet" href="assets/vendors/iconfonts/flag-icon-css/css/flag-icon.min.css">
    <link rel="stylesheet" href="assets/vendors/css/vendor.bundle.base.css">
    <link rel="stylesheet" href="assets/vendors/css/vendor.bundle.addons.css">
    <!-- endinject -->
    <!-- plugin css for this page -->
    <!-- End plugin css for this page -->
    <!-- inject:css -->
    <link rel="stylesheet" href="assets/css/shared/style.css">
    <!-- endinject -->
    <!-- Layout styles -->
    <link rel="stylesheet" href="assets/css/demo_1/style.css">
    <!-- End Layout styles -->
    <link rel="shortcut icon" href="assets/images/favicon.png"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>
<style>
    body {
        /*font-family: 'Open Sans', sans-serif;*/
        /*background: #3498db;*/
        margin: 0 auto 0 auto;
        width: 100%;
        text-align: center;
        margin: 20px 0px 20px 0px;
    }

    li {
        list-style: none;
    }

    p {
        font-size: 12px;
        text-decoration: none;
        color: #ffffff;
    }

    h1 {
        font-size: 1.5em;
        color: #525252;
    }

    .box {
        background: white;
        width: 300px;
        position: fixed;
        top: 0px;
        border-radius: 6px;
        margin: 0 auto 0 auto;
        padding: 0px 0px 70px 0px;
        border: #2980b9 4px solid;
    }

    .username {
        background: #ecf0f1;
        border: #ccc 1px solid;
        border-bottom: #ccc 2px solid;
        padding: 8px;
        width: 250px;
        color: #AAAAAA;
        margin-top: 10px;
        top: 0px;
        font-size: 1em;
        border-radius: 4px;
    }

    #x {
        position: relative;
        float: right;
        background: #c91508;
        color: white;
        border: 1px;

    }

    #back {
        position: relative;
        float: left;
        background: grey;
        color: white;

    }
</style>

<style>
    /* fixed social*/
    #fixed-social {
        position: fixed;
        top: 0px;
        cursor: pointer;
    }

    #fixed-social a {
        color: #fff;
        display: block;
        height: 40px;
        position: relative;
        text-align: center;
        line-height: 40px;
        width: 40px;
        margin-bottom: 1px;
        z-index: 2;
    }

    #fixed-social a:hover > span {
        visibility: visible;
        left: 41px;
        opacity: 1;
    }

    #fixed-social a span {
        line-height: 40px;
        left: 60px;
        position: absolute;
        text-align: center;
        width: 120px;
        visibility: hidden;
        transition-duration: 0.5s;
        z-index: 1;
        opacity: 0;
    }

    .fixed-facebook {
        background-color: #00AAE5;
    }

    .fixed-facebook span {
        background-color: #00AAE5;
    }
</style>
<script>
    $(document).ready(function () {
        // alert();
        $('#tabs-container .tabs').hide().eq(0).hide();
        $('.div1').hide()
        $('#tabs li').click(function () {
            num = $('#tabs li').index(this);
            $('.div1').hide();
            $('#tabs-container .tabs').hide().eq(num).show();


        });


    });

    function report() {
        $('.div1').show()

    }

    function myFunction(x) {
        // alert($('#'+x));
        $('#content' + x).hide();
        $('.div1').show();
    }

    function close_main() {
        $('.div1').hide();


    }
</script>
<div id="fixed-social">
    <div>
        <a data-toggle="modal" onclick="report()" data-target="#exampleModalLong" class="fixed-facebook"
           target="_blank">@<span>Give a feedback!</span></a>
    </div>

</div>
<div class="main">

    <%--main box start--%>
    <div id="tabs" class="div1 box">
        <button onclick="close_main()" id="x">
            X
        </button>
        <div><br></div>
        <div><br></div>
        <div>Feedback Center</div>


        <div>You can</div>
        <div>
            <li>
                <button id="1" class="btn btn-primary btn-rounded btn-fw">send new feedback</button>
            </li>
        </div>
        <div>or</div>
        <div>
            <li>
                <button id="2" class="btn btn-primary btn-rounded btn-fw">view submitted feedback</button>
            </li>
        </div>

        <div>
            <div></div>
            <br>
            <div>Alternatives detected!</div>
            <br>
            <li>
                <button id="3" class="btn btn-primary btn-rounded btn-fw">participate</button>
            </li>
        </div>

    </div>
    <%--main box end--%>

    <%--send new feedback start--%>
    <div id="tabs-container">
        <div id="content1" class="tabs">

            <div class="box">
                <button onclick="myFunction('1')" id="x">
                    X
                </button>
                <form action="/addTicket" method="post">
                    <div><br></div>
                    <div><br></div>
                    <div>Please fill in first before sending</div>
                    <div>
                        <input type="text" style="width: 80%" class="form-control" name="name"
                               placeholder="Your name (optional)">
                    </div>
                    <div>
                        <input type="text" style="width: 80%" class="form-control" name="email"
                               placeholder="Your contact email (optional)">
                    </div>
                    <div>please enter valid email</div>

                    <div>
                <textarea name="comment" style="width: 80%" class="form-control"
                          placeholder="Enter text here..."></textarea>
                        <textarea name="comment" style="width: 80%" class="form-control"
                                  placeholder="Enter text 2 here..."></textarea>
                        <div><br></div>
                        <button class="btn btn-primary btn-rounded btn-fw" id="add">add new annotation</button>
                        <div><br></div>
                        <button class="btn btn-primary btn-rounded btn-fw" id="send_add">send selected alternatives
                        </button>

                    </div>
                    <div><br></div>
                    <div>

                        <input class="btn btn-primary btn-rounded btn-fw" type="submit" value="Send"/>
                    </div>
            </div>
            </form>
        </div>
        <%--send new feedback end--%>

        <%--view submitted feedback start--%>
        <div id="content2" class="tabs">

            <div class="box">
                <button onclick="myFunction('2')" id="x">
                    X
                </button>
                <div><br></div>
                <div><br></div>
                <div>Enter a specific ticket-ID, to see <br> already
                    submitted feedback
                </div>
                <div>
                    <input type="text" style="width: 80%" class="form-control"
                           placeholder="Enter ticket-ID">
                </div>
            </div>
        </div>
        <%--view submitted feedback end--%>

        <%--participiate alternatives start--%>
        <div id="content3" class="tabs">
            <div class="box">
                <button onclick="myFunction('3')" id="x">
                    X
                </button>
                <!-- Public viewable infos -->
                <div><br></div>
                <div><br></div>
                <table>
                    <tbody>
                    <tr>
                        <td>Guid:</td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>Public:</td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>Sent:</td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>Viewed:</td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>Items:</td>
                        <td></td>
                    </tr>
                    </tbody>
                </table>

                <!-- Private viewable infos -->
                <table>
                    <tbody>
                    <tr>
                        <td>Name:</td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>Email:</td>
                        <td></td>
                    </tr>

                    </tbody>
                </table>

                <div>
                    <div>
                        Ticket settings
                    </div>
                    <div>
                        Local settings
                    </div>
                </div>
                <div>Please adjust the red properties, a <br>change of browser zoom can help.</div>
                <div>Window dimensions</div>
                <div>
                    <div></div>
                    <div><span>1536</span> x <span>437</span></div>
                </div>
                <div>Browser</div>
                <div>
                    <div></div>
                    <div></div>
                </div>
                <div>Browser font-size</div>

            </div>
        </div>
        <%--participiate alternatives end--%>
    </div>
</div>

<script src="assets/vendors/js/vendor.bundle.base.js"></script>
<script src="assets/vendors/js/vendor.bundle.addons.js"></script>
<!-- endinject -->
<!-- Plugin js for this page-->
<!-- End plugin js for this page-->
<!-- inject:js -->
<script src="assets/js/shared/off-canvas.js"></script>
<script src="assets/js/shared/misc.js"></script>
<!-- endinject -->
<!-- Custom js for this page-->
<script src="assets/js/demo_1/dashboard.js"></script>
</body>
</html>