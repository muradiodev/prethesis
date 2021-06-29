<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="utf-8">

    <link href="https://fonts.googleapis.com/css?family=Hind:300,400,500,600,700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:400,700&display=swap" rel="stylesheet">

    <link rel="stylesheet" type="text/css" href="main/file/style.css" media="all">
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"
            integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"
            type="text/javascript"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
            integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
            crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
            integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
            crossorigin="anonymous"></script>
    <%--        <script src="main/file/jquery-1.11.3.min.js" type="text/javascript"></script>--%>

    <script src="https://code.jquery.com/jquery-migrate-1.3.0.js"></script>
    <script>
        $('.carousel').carousel({
            interval: 2000
        });


        $(document).ready(function () {
            var qwerty=0;
            $.ajax
            (
                {
                    url:'/openTicket',
                    data:{"viewGuid": '<%=request.getParameter("id")%>'},
                    type:'post',
                    cache:false,
                    success:function(data){
                        console.log(data);

                        for (i = 0; i < data.annotationList.length; i++){
                            appendedText(data.annotationList[i].left, data.annotationList[i].top, data.annotationList[i].comment);
                        qwerty++;
                        }

                        $('#guid').text(data.viewGuid);
                        $('#publicIs').text(data.isPublic);
                        $('#sentTime').text(data.postDate);
                        $('#commentcount').text(qwerty);
                        $('#name').text(data.name);
                        $('#email').text(data.email);
                        $('#windimensionsDB').text(data.screenWidth +' x '+data.screenHeight);
                        $('#browserDB').text(data.navigatorString);
                        $('#browserfontDB').text(data.browserFontSize);

                    },
                    error:function(){
                        alert('error');}
                }
            );
            $('#windimensions').text($(window).width() + 'x' + $(window).height());
            $('#browsername').text(Object.keys(jQuery.browser)[0] + ' ' + jQuery.browser.version);
            $('#browserfont').text(window.getComputedStyle(document.body,null).getPropertyValue("font-size"));

            $(window).resize(function() {
                $('#windimensions').text($(window).width() + 'x' + $(window).height());
            });

            // alert();
            $('#tabs-container .tabs').hide().eq(0).hide();
            $('.div1').hide()
            $('#tabs li').click(function () {
                num = $('#tabs li').index(this);
                $('.div1').hide();
                $('#tabs-container .tabs').hide().eq(num).show();


            });


            $('#weather_select').on('change', function () {
                console.log("there")
                var selected = $('#weather_select').children("option:selected").val();
                console.log(selected);

                if (selected == 1) {
                    $("#weather_component").css("display", "inline-block");
                } else {
                    $("#weather_component").css("display", "none");
                }
            });

            $('#contact_select').on('change', function () {
                console.log("there")
                var selected = $('#contact_select').children("option:selected").val();
                console.log(selected);

                if (selected == 1) {
                    $("#contact_component").css("display", "inline-block");
                } else {
                    $("#contact_component").css("display", "none");
                }
            });

            // $(".boxmain").parent().css({position: 'relative'});
            // $(".boxmain").css({top: 100px, left: 200px, position:'absolute'});

        });

        function appendedText(left, top, comment ){//bu comment elave eden funksiyadi buttona vuranda comment yaranir
            var txt1 = [
                '<div class="boxmain draggable box' + count + '" style="position:absolute;width: 300px;  left: ' + left + 'px; top:' + top + 'px;z-index: 1002;" id="draggable" >',
                '<div class="modal-dialog"  role="document">',
                '<div style="width: 300px;"  class="modal-content">',
                '<div style="top:-9px;margin-left:5px;position:absolute;width:0;height:0;border-left:10px solid transparent;border-right:10px solid transparent;border-bottom:10px solid #888484;"></div>',
                '<div class="modal-header">',
                '<h5 class="modal-title">Comment: (moveable)</h5>',
                '<button type="button" onclick="this.parentNode.parentNode.parentNode.removeChild(this.parentNode.parentNode); deleteBoxSelected(this); return false;" class="close" id="box' + count + '" data-dismiss="modal" aria-label="Close">',
                ' <span aria-hidden="true">&times;</span>',
                '</button>',

                '</div>',
                '<div class="modal-body">',
                ' <textarea class="form-control tarea" id="tarea' + count + '" placeholder="write any text here" rows="3">'+comment+'</textarea>',
                '</div>',
                '</div>',
                '</div>',
                '</div>'
            ].join("\n");

            $("#mainAppend").append(txt1);
            $(".draggable").draggable();
            count++;
        }

        function participate() {
            $('#weather_config').css("display", "block");
            $('#dash_1').css("display", "block");
            $('#c1085813').css("border", "2px dashed red");
            $('#contact_config').css("display", "block");
        }

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

        function submitCoordinates() {

            var annotations = [];

            $( ".boxmain" ).each(function( index ) {
                var currentElement = $(this);

                console.log(currentElement.find('.tarea').val());
                // var value = currentElement.position().top();
                annotations.push({'top': currentElement.position().top,'left': currentElement.position().left, 'comment':currentElement.find('.tarea').val()});

            });
            var name = $('#ann_name').val();
            var email = $('#ann_email').val();


            var params = '?name=' + name + '&email=' + email;

            var xhr = new XMLHttpRequest();
            xhr.open("POST", '/tickets' + params, true);
            xhr.setRequestHeader('Content-Type', 'application/json');
            xhr.send(JSON.stringify(annotations));


            // $( this ).position().top() + " : "+ $( this ).position().left()

            // console.log(this.count);

            // for (i = 0; i < count; i++) {
            //     var data = $(".box" + i).position();
            //     console.log(".box" + i);
            //
            //     console.log(data.top, data.left);
            // }

            // sendAjax();
        }

        function deleteBoxSelected(button) {
            // console.log("gelen value    "+button)
            var s =  $(button).attr("id");
            console.log("success   "+s);
            $('.'+s).remove();

        }

        var count = 0;


        function appendText() {
            var txt1 = [
                '<div class="boxmain draggable box' + count + '" style="position:absolute;width: 300px;  left: 45%; top:30px;z-index: 1002;" id="draggable" >',
                // '<span class="fm__initial fm__tip fm__tip-up-white"></span>',


                '<div class="modal-dialog"  role="document">',
                '<div style="width: 300px;"  class="modal-content">',
                '<div style="top:-9px;margin-left:5px;position:absolute;width:0;height:0;border-left:10px solid transparent;border-right:10px solid transparent;border-bottom:10px solid #888484;"></div>',
                '<div class="modal-header">',
                '<h5 class="modal-title">Comment: (moveable)</h5>',
                '<button type="button" onclick="this.parentNode.parentNode.parentNode.removeChild(this.parentNode.parentNode); deleteBoxSelected(this); return false;" class="close" id="box' + count + '" data-dismiss="modal" aria-label="Close">',
                ' <span aria-hidden="true">&times;</span>',
                '</button>',

                '</div>',
                '<div class="modal-body">',
                ' <textarea class="form-control tarea" id="tarea' + count + '" placeholder="write any text here" rows="3"></textarea>',
                '</div>',
                '</div>',
                '</div>',
                '</div>'
            ].join("\n");

            $("#mainAppend").append(txt1);
            $(".draggable").draggable();
            count++;
        }




        function sendAjax() {
            var annotation = ['255', '360', 'salam asdfg'];

            // annotation.push();
            console.log(annotation);

            var name = $("#al_name").val();
            let email = $("#al_email").val();
            $.ajax({
                type: "POST",
                url: "/addTicket",
                data: {"email": email, "name": name, "annotation": annotation},
                // dataType: "json",
                success: function () {
                    alert('success');
                },
                error: function () {
                    alert('failure');
                }
            });
        }

        // function closeDiv(){
        //
        // }
        // $("#close").click(function(){
        //     this.hide();
        // });

    </script>

    <style>
        /* fixed social*/
        #fixed-social {
            font-size: 16px;
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
            /*font-size: 12px;*/
            background-color: #00AAE5;
        }

        .fixed-facebook span {
            /*font-size: 12px;*/
            background-color: #00AAE5;
        }

        /*body {*/
        /*    !*font-family: 'Open Sans', sans-serif;*!*/
        /*    !*background: #3498db;*!*/
        /*    margin: 0 auto 0 auto;*/
        /*    width: 100%;*/
        /*    text-align: center;*/
        /*    margin: 20px 0px 20px 0px;*/
        /*}*/

        li {
            list-style: none;
        }

        /*p {*/
        /*    font-size: 12px;*/
        /*    text-decoration: none;*/
        /*    color: #ffffff;*/
        /*}*/

        /*h1 {*/
        /*    font-size: 1.5em;*/
        /*    color: #525252;*/
        /*}*/

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

        .x {
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


    <title>Computer Science - Institutes of Computer Science - Universität Rostock</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=yes">

</head>
<body>

<div style="position: absolute; z-index:1001;width:100%;" id="mainAppend">
<%--    <div id="fixed-social">--%>
<%--        <div>--%>
<%--            <a data-toggle="modal" onclick="report()" data-target="#exampleModalLong" class="fixed-facebook"--%>
<%--               target="_blank">@<span>Give a feedback!</span></a>--%>
<%--        </div>--%>

<%--    </div>--%>

</div>

<div class="topbar">
    <div class="topbar__wrapper">
        <div class="grid">
            <div class="grid__column grid__column--xs-12">
                <div>
                    <a href="../index.html" class="">Deutsch</a>
                    <a class="login-link" title="Login" href="login/index.html">
                        Login
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>


<div id="quicklinks" class="navigation-slidecontainer navigation-slidecontainer--quicklinks">
    <div class="navigation-slidecontainer__content">
        <div class="grid">
            <div class="grid__column grid__column--xs-12 grid__column--sm-12 grid__column--sm-push-0 grid__column--md-8 grid__column--md-push-4">
                <div id="c1179065" class="grid csc-frame csc-frame-default csc-frame--type-gridelements_pi1">


                    <div class="grid__column grid__column--md-3">
                        <div id="c1179059" class="csc-frame csc-frame-default frame-type-text frame-layout-0">
                            <div class="csc-header"><h3 class="">
                                Offers for
                            </h3></div>
                            <p><a href="study-teaching/interest-groups/prospective-students/index.html"
                                  title="Öffnet internen Link" class="internal-link">Prospective students</a><br/><a
                                    href="quicklinks/mitarbeiter/index.html" title="Öffnet internen Link"
                                    class="internal-link">Staff members</a><br/><a href="quicklinks/visitors/index.html"
                                                                                   title="Öffnet internen Link"
                                                                                   class="internal-link">Visitors</a><br/><a
                                    href="https://users.informatik.uni-rostock.de/inforo/" title="Öffnet internen Link"
                                    target="_blank" class="external-link">Association INFO.RO</a></p></div>

                    </div>

                    <div class="grid__column grid__column--md-3">
                        <div id="c1179057" class="csc-frame csc-frame-default frame-type-text frame-layout-0">
                            <div class="csc-header"><h3 class="">
                                Online Services
                            </h3></div>
                            <p><a href="https://studip.uni-rostock.de/index.php?set_language=en_GB"
                                  title="Öffnet internen Link" target="_blank" class="external-link">Stud.IP</a><br/><a
                                    href="https://lsf.uni-rostock.de/qisserver/rds?state=user&amp;type=8&amp;topitem=lectures&amp;breadCrumbSource=portal&amp;language=en"
                                    title="Öffnet internen Link" target="_blank" class="external-link">Academic
                                calendar</a><br/><a href="https://pruefung.uni-rostock.de/" title="Öffnet internen Link"
                                                    target="_blank" class="external-link">Study and examination site</a><br/><a
                                    href="https://www.ub.uni-rostock.de/en/support-for-researchers/subject-areas-i/fakultaet-fuer-informatik-und-elektrotechnik/translate-to-englisch-informatik-facheinstieg/"
                                    title="Öffnet internen Link" target="_blank" class="external-link">Computer Science
                                at University Library</a></p></div>

                    </div>

                    <div class="grid__column grid__column--md-3">
                        <div id="c1179061" class="csc-frame csc-frame-default frame-type-text frame-layout-0">
                            <div class="csc-header"><h3 class="">
                                Search
                            </h3></div>
                            <p><a href="https://webapp.uni-rostock.de/mailsearch/stud" title="Öffnet internen Link"
                                  target="_blank" class="external-link">Students search</a><br/><a
                                    href="https://lsf.uni-rostock.de/qisserver/rds?state=change&amp;type=5&amp;moduleParameter=personSearch&amp;nextdir=change&amp;next=search.vm&amp;subdir=person&amp;_form=display&amp;clean=y&amp;category=person.search&amp;navigationPosition=membersCsearchMembersLsf&amp;breadcrumb=searchMembers&amp;topitem=members&amp;subitem=searchMembersLsf&amp;noDBAction=y&amp;init=y"
                                    title="Öffnet internen Link" target="_blank" class="external-link">Staff search<br/></a>
                            </p></div>

                    </div>

                    <div class="grid__column grid__column--md-3">
                        <div id="c1179063" class="csc-frame csc-frame-default frame-type-text frame-layout-0">
                            <div class="csc-header"><h3 class="">
                                Job vacancies
                            </h3></div>
                            <p><a href="quicklinks/job-vacancies/index.html" title="Öffnet internen Link"
                                  class="internal-link">At the Institute of Computer Science</a><br/><a
                                    href="quicklinks/external-offers/index.html" title="Öffnet internen Link"
                                    class="internal-link">External offers<br/></a></p></div>

                    </div>


                </div>

            </div>
        </div>
        <a href="index.html#" class="close-button navigation-slidecontainer__close">Close</a>
    </div>
</div>


<div id="search" class="navigation-slidecontainer navigation-slidecontainer--search">
    <div class="navigation-slidecontainer__content">
        <div class="grid">
            <div class="grid__column grid__column--xs-12 grid__column--sm-12 grid__column--sm-push-0 grid__column--md-8 grid__column--md-push-4">
                <form enctype="multipart/form-data" method="get"
                      action="https://www.informatik.uni-rostock.de/en/suche/?tx__%5Bcontroller%5D=Standard&amp;cHash=a42722e2eb8f1d2c08c070a1d6c715f6">
                    <div>
                        <input type="hidden" name="__referrer[@extension]" value=""/>
                        <input type="hidden" name="__referrer[@controller]" value="Standard"/>
                        <input type="hidden" name="__referrer[@action]" value="centerContent"/>
                        <input type="hidden" name="__referrer[arguments]"
                               value="YTowOnt9004eaf1d98907f22788c620d053d54b721188966"/>
                        <input type="hidden" name="__referrer[@request]"
                               value="a:3:{s:10:&quot;@extension&quot;;N;s:11:&quot;@controller&quot;;s:8:&quot;Standard&quot;;s:7:&quot;@action&quot;;s:13:&quot;centerContent&quot;;}e6c33d7865d45634ca1be33329ffce4150bcbd74"/>
                        <input type="hidden" name="__trustedProperties"
                               value="a:0:{}abc14f7291615e4bae58c30c66cc9ba44e005ca8"/>
                    </div>

                    <label class="h3-style" for="search-field">Search</label>
                    <input type="text" name="tx_kesearch_pi1[sword]" id="search-field"/>
                    <button class="button button--red" type="submit" name="Submit">Submit</button>
                </form>
            </div>
        </div>
        <a href="index.html#" class="close-button navigation-slidecontainer__close">Close</a>
    </div>
</div>


<!-- theme_hsmv: Templates/Theme/CenterContent.html [begin] -->
<header class="header">
    <div class="header__content">

        <!-- theme_hsmv: Partials/Content/Header.html [begin] -->
        <div class="header__top-wrapper">
            <div class="logo"><a href="http://localhost:8084/" title="Universität Rostock"
                                 class="logo-main"><img src="main/file/csm_rostock_logo_0afd2db082.png" width="800"
                                                        height="174" alt="Universität Rostock"
                                                        title="Universität Rostock"></a></div>

            <div class="organization">


                <a href="index.html">
                    <h3>Informatikinstitute</h3>
                </a>


            </div>

            <div class="header__submenu">
                <ul class="header-submenu">
                    <li id="weather_component" class="header-submenu__item" style="display: none;">
                        <div style="border: 2px dashed red;"><img src="main/file/weather.png"></div>
                    </li>
                    <li class="header-submenu__item"><a href="index.html#" data-content="search"
                                                        class="header-submenu__icon header-submenu__icon--search"><span>Search</span></a>
                    </li>
                    <li class="header-submenu__item"><a href="index.html#" data-content="quicklinks"
                                                        class="header-submenu__icon header-submenu__icon--quicklinks"><span>Quicklinks</span></a>
                    </li>
                </ul>
            </div>
        </div>
        <div class="mobile-toggle">
            <ul class="navigation-list navigation-list--mobile-toggle navigation-list--table">
                <li class="navigation-list__item"><a href="index.html#" id="mobile-toggle"
                                                     class="mobile-toggle__icon mobile-toggle__icon--bars">Menu</a></li>
                <li class="navigation-list__item"><a href="index.html#" data-content="search"
                                                     class="mobile-toggle__icon mobile-toggle__icon--search">Search</a>
                </li>
                <li class="navigation-list__item"><a href="index.html#" data-content="quicklinks"
                                                     class="mobile-toggle__icon mobile-toggle__icon--quicklinks">Quicklinks</a>
                </li>
            </ul>
        </div>
        <nav id="nav" class="navigation">
            <ul class="navigation-list navigation-list--table">
                <li class="navigation-list__item navigation-list__item--level-1" data-dropdown="true"><a
                        href="about-us/index.html">About us</a>
                    <div class="navigation-list__dropdown">
                        <div class="navigation-list__dropdown-content navigation-list__dropdown-content--4-columns">
                            <ul class="navigation-list navigation-list--overview-link">
                                <li class="navigation-list__item navigation-list__item--level-2"><a
                                        href="about-us/portal-site-about-us/index.html">Portal site About us</a></li>
                            </ul>
                            <ul class="navigation-list">
                                <li class="navigation-list__item navigation-list__item--level-2"><span
                                        class="navigation-list__headline"> Division </span>
                                    <ul class="navigation-list">
                                        <li class="navigation-list__item navigation-list__item--level-3"><a
                                                href="about-us/division/institute-of-computer-science/index.html">Institute
                                            of Computer Science</a></li>
                                        <li class="navigation-list__item navigation-list__item--level-3"><a
                                                href="https://vac.uni-rostock.de/en/" target="_blank">Institute for
                                            Visual and Analytic Computing</a></li>
                                        <li class="navigation-list__item navigation-list__item--level-3"><a
                                                href="about-us/division/contact-persons/index.html">Contact persons</a>
                                        </li>
                                        <li class="navigation-list__item navigation-list__item--level-3"><a
                                                href="about-us/division/staff-members-of-the-institute-of-computer-science/index.html">Staff
                                            members of the Institute of Computer Science</a></li>
                                        <li class="navigation-list__item navigation-list__item--level-3"><a
                                                href="about-us/division/staff-members-of-the-institute-for-visual-and-analytic-computing/index.html">Staff
                                            members of the Institute for Visual and Analytic Computing</a></li>
                                        <li class="navigation-list__item navigation-list__item--level-3"><a
                                                href="about-us/division/emeriti/index.html">Emeriti</a></li>
                                        <li class="navigation-list__item navigation-list__item--level-3"><a
                                                href="about-us/division/honorary-doctorates/index.html">Honorary
                                            Doctorates</a></li>
                                        <li class="navigation-list__item navigation-list__item--level-3"><a
                                                href="about-us/division/vacancies/index.html">Vacancies</a></li>
                                    </ul>
                                </li>
                            </ul>
                            <ul class="navigation-list">
                                <li class="navigation-list__item navigation-list__item--level-2"><span
                                        class="navigation-list__headline"> Building </span>
                                    <ul class="navigation-list">
                                        <li class="navigation-list__item navigation-list__item--level-3"><a
                                                href="quicklinks/visitors/index.html">Arrival and Parking</a></li>
                                        <li class="navigation-list__item navigation-list__item--level-3"><a
                                                href="about-us/building/konrad-zuse-building/index.html">Konrad Zuse
                                            Building</a></li>
                                        <li class="navigation-list__item navigation-list__item--level-3"><a
                                                href="about-us/building/meeting-room-reservation-limited-access-and-in-german-only/index.html">Meeting
                                            room reservation (limited access and in German only)</a></li>
                                    </ul>
                                </li>
                            </ul>
                            <ul class="navigation-list">
                                <li class="navigation-list__item navigation-list__item--level-2"><span
                                        class="navigation-list__headline"> History </span>
                                    <ul class="navigation-list">
                                        <li class="navigation-list__item navigation-list__item--level-3"><a
                                                href="about-us/history/1964-1989/index.html">1964-1989</a></li>
                                        <li class="navigation-list__item navigation-list__item--level-3"><a
                                                href="about-us/history/1990-1999/index.html">1990-1999</a></li>
                                        <li class="navigation-list__item navigation-list__item--level-3"><a
                                                href="about-us/history/from-2000/index.html">From 2000</a></li>
                                    </ul>
                                </li>
                            </ul>
                            <ul class="navigation-list">
                                <li class="navigation-list__item navigation-list__item--level-2"><span
                                        class="navigation-list__headline"> Public relation </span>
                                    <ul class="navigation-list">
                                        <li class="navigation-list__item navigation-list__item--level-3"><a
                                                href="news/alle-meldungen/index.html">News 2019 (German)</a></li>
                                        <li class="navigation-list__item navigation-list__item--level-3"><a
                                                href="veranstaltungen/alle-veranstaltungen/index.html">Events
                                            (German)</a></li>
                                        <li class="navigation-list__item navigation-list__item--level-3"><a
                                                href="verein-inforo/index.html" target="_blank">Association INFO.RO
                                            (German)</a></li>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                    </div>
                </li>
                <li class="navigation-list__item navigation-list__item--level-1" data-dropdown="true"><a
                        href="chairs/index.html">Chairs</a>
                    <div class="navigation-list__dropdown">
                        <div class="navigation-list__dropdown-content navigation-list__dropdown-content--4-columns">
                            <ul class="navigation-list navigation-list--overview-link">
                                <li class="navigation-list__item navigation-list__item--level-2"><a
                                        href="chairs/portal-site-chairs/index.html">Portal site Chairs</a></li>
                            </ul>
                            <ul class="navigation-list">
                                <li class="navigation-list__item navigation-list__item--level-2"><span
                                        class="navigation-list__headline"> at the Institute of Computer Science </span>
                                    <ul class="navigation-list">
                                        <li class="navigation-list__item navigation-list__item--level-3"><a
                                                href="chairs/at-the-institute-of-computer-science/architecture-of-application-systems/index.html">Architecture
                                            of Application Systems</a></li>
                                        <li class="navigation-list__item navigation-list__item--level-3"><a
                                                href="chairs/at-the-institute-of-computer-science/database-and-information-systems/index.html">Database
                                            and Information Systems</a></li>
                                        <li class="navigation-list__item navigation-list__item--level-3"><a
                                                href="chairs/at-the-institute-of-computer-science/information-and-communication-services/index.html">Information
                                            and Communication Services</a></li>
                                        <li class="navigation-list__item navigation-list__item--level-3"><a
                                                href="chairs/at-the-institute-of-computer-science/junior-professor-business-information-systems/index.html">Junior
                                            professor Business Information Systems</a></li>
                                        <li class="navigation-list__item navigation-list__item--level-3"><a
                                                href="chairs/at-the-institute-of-computer-science/practical-informatics/index.html">Practical
                                            Informatics</a></li>
                                    </ul>
                                </li>
                            </ul>
                            <ul class="navigation-list">
                                <li class="navigation-list__item navigation-list__item--level-2"><span
                                        class="navigation-list__headline"> at the Institute of Computer Science </span>
                                    <ul class="navigation-list">
                                        <li class="navigation-list__item navigation-list__item--level-3"><a
                                                href="chairs/at-the-institute-of-computer-science/software-engineering/index.html">Software
                                            Engineering</a></li>
                                        <li class="navigation-list__item navigation-list__item--level-3"><a
                                                href="chairs/at-the-institute-of-computer-science/systems-biology-bioinformatics/index.html">Systems
                                            Biology & Bioinformatics</a></li>
                                        <li class="navigation-list__item navigation-list__item--level-3"><a
                                                href="chairs/at-the-institute-of-computer-science/distributed-high-performance-computing/index.html">Distributed
                                            High-Performance Computing</a></li>
                                        <li class="navigation-list__item navigation-list__item--level-3"><a
                                                href="chairs/at-the-institute-of-computer-science/theoretical-computer-science/index.html">Theoretical
                                            Computer Science</a></li>
                                        <li class="navigation-list__item navigation-list__item--level-3"><a
                                                href="chairs/at-the-institute-of-computer-science/business-information-systems/index.html">Business
                                            Information Systems</a></li>
                                    </ul>
                                </li>
                            </ul>
                            <ul class="navigation-list">
                                <li class="navigation-list__item navigation-list__item--level-2"><span
                                        class="navigation-list__headline"> at the Institute for Visual and Analytic Computing </span>
                                    <ul class="navigation-list">
                                        <li class="navigation-list__item navigation-list__item--level-3"><a
                                                href="chairs/at-the-institute-for-visual-and-analytic-computing/computer-graphics/index.html">Computer
                                            Graphics</a></li>
                                        <li class="navigation-list__item navigation-list__item--level-3"><a
                                                href="chairs/at-the-institute-for-visual-and-analytic-computing/mobile-multimedia-information-systems/index.html">Mobile
                                            Multimedia Information Systems</a></li>
                                        <li class="navigation-list__item navigation-list__item--level-3"><a
                                                href="chairs/at-the-institute-for-visual-and-analytic-computing/modeling-and-simulation/index.html">Modeling
                                            and Simulation</a></li>
                                        <li class="navigation-list__item navigation-list__item--level-3"><a
                                                href="chairs/at-the-institute-for-visual-and-analytic-computing/multimedia-communication/index.html">Multimedia
                                            Communication</a></li>
                                        <li class="navigation-list__item navigation-list__item--level-3"><a
                                                href="chairs/at-the-institute-for-visual-and-analytic-computing/visual-computing/index.html">Visual
                                            Computing</a></li>
                                    </ul>
                                </li>
                            </ul>
                            <ul class="navigation-list">
                                <li class="navigation-list__item navigation-list__item--level-2"><span
                                        class="navigation-list__headline"> independent </span>
                                    <ul class="navigation-list">
                                        <li class="navigation-list__item navigation-list__item--level-3"><a
                                                href="about-us/division/homepages/meike-klettke/apl-prof-dr-ing-habil-meike-klettke/index.html"
                                                target="_blank">PD Dr.-Ing. habil. Meike Klettke</a></li>
                                        <li class="navigation-list__item navigation-list__item--level-3"><a
                                                href="https://users.informatik.uni-rostock.de/~le/" target="_blank">apl.
                                            Prof. Dr. rer. nat. habil. Van Bang Le</a></li>
                                        <li class="navigation-list__item navigation-list__item--level-3"><a
                                                href="http://vcg.informatik.uni-rostock.de/~karstens/">Dr.-Ing. Bernd
                                            Karstens</a></li>
                                        <li class="navigation-list__item navigation-list__item--level-3"><a
                                                href="https://theo.informatik.uni-rostock.de/theo-team/">Dr. rer. nat.
                                            Christian Rosenke</a></li>
                                        <li class="navigation-list__item navigation-list__item--level-3"><a
                                                href="http://cmsaat.text2hbm.org/" target="_blank">Junior Research Group
                                            CoMSAAT</a></li>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                    </div>
                </li>
                <li class="navigation-list__item navigation-list__item--level-1" data-dropdown="true"><a
                        href="study-teaching/index.html">Study & Teaching</a>
                    <div class="navigation-list__dropdown">
                        <div class="navigation-list__dropdown-content navigation-list__dropdown-content--4-columns">
                            <ul class="navigation-list navigation-list--overview-link">
                                <li class="navigation-list__item navigation-list__item--level-2"><a
                                        href="study-teaching/portal-site-study-teaching/index.html">Portal site Study &
                                    Teaching</a></li>
                            </ul>
                            <ul class="navigation-list">
                                <li class="navigation-list__item navigation-list__item--level-2"><span
                                        class="navigation-list__headline"> Interest groups </span>
                                    <ul class="navigation-list">
                                        <li class="navigation-list__item navigation-list__item--level-3"><a
                                                href="study-teaching/interest-groups/prospective-students/index.html">Prospective
                                            students</a></li>
                                        <li class="navigation-list__item navigation-list__item--level-3"><a
                                                href="study-teaching/interest-groups/first-semester-students/index.html">First
                                            semester students</a></li>
                                        <li class="navigation-list__item navigation-list__item--level-3"><a
                                                href="study-teaching/interest-groups/foreign-students/index.html">Foreign
                                            students</a></li>
                                    </ul>
                                </li>
                            </ul>
                            <ul class="navigation-list">
                                <li class="navigation-list__item navigation-list__item--level-2"><span
                                        class="navigation-list__headline"> Bachelor study courses </span>
                                    <ul class="navigation-list">
                                        <li class="navigation-list__item navigation-list__item--level-3"><a
                                                href="study-teaching/bachelor-study-courses/computer-science-bsc/index.html">Computer
                                            Science B.Sc.</a></li>
                                        <li class="navigation-list__item navigation-list__item--level-3"><a
                                                href="study-teaching/bachelor-study-courses/business-informatics-bsc/index.html">Business
                                            Informatics B.Sc.</a></li>
                                        <li class="navigation-list__item navigation-list__item--level-3"><a
                                                href="study-teaching/bachelor-study-courses/informational-technologycomputer-engineering-bsc/index.html">Informational
                                            Technology/Computer Engineering B.Sc.</a></li>
                                    </ul>
                                </li>
                            </ul>
                            <ul class="navigation-list">
                                <li class="navigation-list__item navigation-list__item--level-2"><span
                                        class="navigation-list__headline"> Master study courses </span>
                                    <ul class="navigation-list">
                                        <li class="navigation-list__item navigation-list__item--level-3"><a
                                                href="study-teaching/master-study-courses/computer-science-msc/index.html">Computer
                                            Science M.Sc.</a></li>
                                        <li class="navigation-list__item navigation-list__item--level-3"><a
                                                href="study-teaching/master-study-courses/business-informatics-msc/index.html">Business
                                            Informatics M.Sc.</a></li>
                                        <li class="navigation-list__item navigation-list__item--level-3"><a
                                                href="study-teaching/master-study-courses/informational-technologycomputer-engineering-msc/index.html">Informational
                                            Technology/Computer Engineering M.Sc.</a></li>
                                        <li class="navigation-list__item navigation-list__item--level-3"><a
                                                href="study-teaching/master-study-courses/visual-computing-msc/index.html">Visual
                                            Computing M.Sc.</a></li>
                                    </ul>
                                </li>
                            </ul>
                            <ul class="navigation-list">
                                <li class="navigation-list__item navigation-list__item--level-2"><span
                                        class="navigation-list__headline"> Other study courses </span>
                                    <ul class="navigation-list">
                                        <li class="navigation-list__item navigation-list__item--level-3"><a
                                                href="https://pidi.informatik.uni-rostock.de/lehre/lehramtsstudium/lehramt-aktuell/"
                                                target="_blank">Teaching study course Computer Science</a></li>
                                        <li class="navigation-list__item navigation-list__item--level-3"><a
                                                href="study-teaching/other-study-courses/subsidiary-subject-education-computer-science/index.html">Subsidiary
                                            subject education Computer Science</a></li>
                                        <li class="navigation-list__item navigation-list__item--level-3"><a
                                                href="study-teaching/other-study-courses/certificate-course-teacher-further-education/index.html">Certificate
                                            course teacher further education</a></li>
                                    </ul>
                                </li>
                            </ul>
                            <ul class="navigation-list">
                                <li class="navigation-list__item navigation-list__item--level-2"><span
                                        class="navigation-list__headline"> Online Services </span>
                                    <ul class="navigation-list">
                                        <li class="navigation-list__item navigation-list__item--level-3"><a
                                                href="https://lsf.uni-rostock.de/qisserver/rds?state=user&amp;type=8&amp;topitem=lectures&amp;breadCrumbSource=portal&amp;language=en"
                                                target="_blank">Academic calendar</a></li>
                                        <li class="navigation-list__item navigation-list__item--level-3"><a
                                                href="https://pruefung.uni-rostock.de/" target="_blank">Study and
                                            examination site</a></li>
                                        <li class="navigation-list__item navigation-list__item--level-3"><a
                                                href="https://studip.uni-rostock.de/index.php?set_language=en_GB"
                                                target="_blank">Study accompanying portal for Presence Lectures</a></li>
                                        <li class="navigation-list__item navigation-list__item--level-3"><a
                                                href="https://www.ub.uni-rostock.de/en/support-for-researchers/subject-areas-i/fakultaet-fuer-informatik-und-elektrotechnik/translate-to-englisch-informatik-facheinstieg/"
                                                target="_blank">Computer Science at University Library</a></li>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                    </div>
                </li>
                <li class="navigation-list__item navigation-list__item--level-1" data-dropdown="true"><a
                        href="research/index.html">Research</a>
                    <div class="navigation-list__dropdown">
                        <div class="navigation-list__dropdown-content navigation-list__dropdown-content--4-columns">
                            <ul class="navigation-list navigation-list--overview-link">
                                <li class="navigation-list__item navigation-list__item--level-2"><a
                                        href="research/portal-site-research/index.html">Portal site Research</a></li>
                            </ul>
                            <ul class="navigation-list">
                                <li class="navigation-list__item navigation-list__item--level-2"><span
                                        class="navigation-list__headline"> Focuses </span>
                                    <ul class="navigation-list">
                                        <li class="navigation-list__item navigation-list__item--level-3"><a
                                                href="research/focuses/data-science-and-engineering/index.html">Data
                                            Science and Engineering</a></li>
                                        <li class="navigation-list__item navigation-list__item--level-3"><a
                                                href="research/focuses/visual-and-computational-analytics/index.html">Visual
                                            and Computational Analytics</a></li>
                                        <li class="navigation-list__item navigation-list__item--level-3"><a
                                                href="research/focuses/intelligent-assistance/index.html">Intelligent
                                            Assistance</a></li>
                                        <li class="navigation-list__item navigation-list__item--level-3"><a
                                                href="research/focuses/computational-biology/index.html">Computational
                                            Biology</a></li>
                                        <li class="navigation-list__item navigation-list__item--level-3"><a
                                                href="research/focuses/economic-organizational-and-social-systems/index.html">Economic,
                                            Organizational and Social Systems</a></li>
                                    </ul>
                                </li>
                            </ul>
                            <ul class="navigation-list">
                                <li class="navigation-list__item navigation-list__item--level-2"><span
                                        class="navigation-list__headline"> Projects </span>
                                    <ul class="navigation-list">
                                        <li class="navigation-list__item navigation-list__item--level-3"><a
                                                href="research/projects/dfg-funding/index.html">DFG funding</a></li>
                                        <li class="navigation-list__item navigation-list__item--level-3"><a
                                                href="research/projects/federal-funding/index.html">Federal funding</a>
                                        </li>
                                        <li class="navigation-list__item navigation-list__item--level-3"><a
                                                href="research/projects/eu-funding/index.html">EU funding</a></li>
                                        <li class="navigation-list__item navigation-list__item--level-3"><a
                                                href="research/projects/industrial-promotion/index.html">Industrial
                                            promotion</a></li>
                                    </ul>
                                </li>
                            </ul>
                            <ul class="navigation-list">
                                <li class="navigation-list__item navigation-list__item--level-2"><span
                                        class="navigation-list__headline"> Environment </span>
                                    <ul class="navigation-list">
                                        <li class="navigation-list__item navigation-list__item--level-3"><a
                                                href="https://www.igd.fraunhofer.de/en/institute/about-us/locations/fraunhofer-igd-rostock"
                                                target="_blank">Fraunhofer Institute for Computer Graphics Research</a>
                                        </li>
                                        <li class="navigation-list__item navigation-list__item--level-3"><a
                                                href="https://www.dzne.de/en/about-us/sites/rostock-greifswald/"
                                                target="_blank">German Center for Neurogenerative Diseases</a></li>
                                        <li class="navigation-list__item navigation-list__item--level-3"><a
                                                href="https://www.demogr.mpg.de/en/default.htm" target="_blank">Max
                                            Planck Institute for Demographic Research</a></li>
                                        <li class="navigation-list__item navigation-list__item--level-3"><a
                                                href="https://www.io-warnemuende.de/" target="_blank">Leibniz Institute
                                            for Baltic Sea Research Warnemünde</a></li>
                                    </ul>
                                </li>
                            </ul>
                            <ul class="navigation-list">
                                <li class="navigation-list__item navigation-list__item--level-2"><span
                                        class="navigation-list__headline"> Promotion of young researchers </span>
                                    <ul class="navigation-list">
                                        <li class="navigation-list__item navigation-list__item--level-3"><a
                                                href="https://www.ief.uni-rostock.de/index.php?id=allgemeine_akademische_ordnungen"
                                                target="_blank">Dissertation</a></li>
                                        <li class="navigation-list__item navigation-list__item--level-3"><a
                                                href="research/promotion-of-young-researchers/completed-dissertations-and-habilitations/index.html">Completed
                                            dissertations and habilitations</a></li>
                                    </ul>
                                </li>
                            </ul>
                            <ul class="navigation-list">
                                <li class="navigation-list__item navigation-list__item--level-2"><span
                                        class="navigation-list__headline"> Current topics </span>
                                    <ul class="navigation-list">
                                        <li class="navigation-list__item navigation-list__item--level-3"><a
                                                href="research/current-topics/digitization/index.html">Digitization</a>
                                        </li>
                                    </ul>
                                </li>
                            </ul>
                            <ul class="navigation-list">
                                <li class="navigation-list__item navigation-list__item--level-2"><span
                                        class="navigation-list__headline"> Project archive </span>
                                    <ul class="navigation-list">
                                        <li class="navigation-list__item navigation-list__item--level-3"><a
                                                href="research/project-archive/completed-projects/index.html">Completed
                                            projects</a></li>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                    </div>
                </li>
                <li class="navigation-list__item navigation-list__item--level-1" data-dropdown="true"><a
                        href="it-service/index.html">IT service</a>
                    <div class="navigation-list__dropdown">
                        <div class="navigation-list__dropdown-content navigation-list__dropdown-content--4-columns">
                            <ul class="navigation-list navigation-list--overview-link">
                                <li class="navigation-list__item navigation-list__item--level-2"><a
                                        href="it-service/overview-it-service/index.html">Overview IT service</a></li>
                            </ul>
                            <ul class="navigation-list">
                                <li class="navigation-list__item navigation-list__item--level-2"><span
                                        class="navigation-list__headline"> Staff </span>
                                    <ul class="navigation-list">
                                        <li class="navigation-list__item navigation-list__item--level-3"><a
                                                href="it-service/staff/about-ourselves/index.html">About ourselves</a>
                                        </li>
                                        <li class="navigation-list__item navigation-list__item--level-3"><a
                                                href="it-service/staff/contact-persons/index.html">Contact persons</a>
                                        </li>
                                    </ul>
                                </li>
                            </ul>
                            <ul class="navigation-list">
                                <li class="navigation-list__item navigation-list__item--level-2"><span
                                        class="navigation-list__headline"> Information </span>
                                    <ul class="navigation-list">
                                        <li class="navigation-list__item navigation-list__item--level-3"><a
                                                href="it-service/information/instructions/index.html">Instructions</a>
                                        </li>
                                        <li class="navigation-list__item navigation-list__item--level-3"><a
                                                href="it-service/information/user-account/index.html">User Account</a>
                                        </li>
                                        <li class="navigation-list__item navigation-list__item--level-3"><a
                                                href="it-service/information/access-opportunities-from-outside/index.html">Access
                                            opportunities from outside</a></li>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                    </div>
                </li>
            </ul>
        </nav>
        <!-- theme_hsmv: Partials/Content/Header.html [end] -->

    </div>
    <div id="weather_config"
         style="border:2px solid red; right:10px; top:39px; text-align:center; position:absolute; padding:10px;display: none;">
        <div style="margin:20px;">What is your opinion?</div>
        <select id="weather_select">
            <option value="0">Do not show weather</option>
            <option value="1">Show weather</option>
        </select>
    </div>
</header>
<!-- theme_hsmv: Templates/Theme/CenterContent.html [end] -->
<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
    <ol class="carousel-indicators">
        <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
        <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
        <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
    </ol>
    <div class="carousel-inner">
        <div class="carousel-item active">
            <img class="d-block w-100"
                 src="main/storages/uni-rostock/alle_ief/informatik/images/banner/1200x340_lndw_suedstadt_28-04-16_0192a-orig.jpg"
                 alt="First slide">
        </div>
        <div class="carousel-item">
            <img class="d-block w-100"
                 src="main/storages/uni-rostock/alle_ief/informatik/images/banner/1200x340_itmz_18_-orig.jpg"
                 alt="Second slide">
        </div>
        <div class="carousel-item">
            <img class="d-block w-100"
                 src="main/storages/uni-rostock/alle_ief/informatik/images/banner/1200x340_itmz_6-orig.jpg"
                 alt="Third slide">
        </div>
    </div>
    <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
    </a>
    <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
    </a>
</div>

<!-- theme_hsmv: Templates/Theme/CenterContent.html [begin] -->
<div class="container">

    <!-- theme_hsmv: Partials/Content/Main.html [begin] -->
    <main class="main-content">
        <div id="c1085811" class="csc-frame csc-frame-default frame-type-gridelements_pi1 frame-layout-0">
            <div class="container">

            </div>
        </div>


        <div id="c1085835" class="grid csc-frame csc-frame-default csc-frame--type-gridelements_pi1">


            <div class="grid__column grid__column--md-8">
                <div id="c1085819" class="csc-frame csc-frame-default frame-type-textpic frame-layout-0">
                    <div class="csc-header"><h2 class="">
                        Welcome to the Computer Science Division
                    </h2></div>
                    <div class="csc-textpic csc-textpic-responsive csc-textpic-intext-right">
                        <div class="csc-textpic-text"><p>Computer Science is the sciene of machine processing of
                            information. It is the basis of our modern society and permeates all spheres of our
                            life.<br/> The Computer Science Division at the University of Rostock comprises the <a
                                    href="about-us/division/institute-of-computer-science/index.html"
                                    title="Öffnet internen Link" class="internal-link">Institute of Computer Science</a>
                            and the <a href="https://vac.uni-rostock.de/en/" title="Öffnet internen Link"
                                       target="_blank" class="external-link">Institute for Visual and Analytic
                                Computing</a>. They form the central institution for university research and teaching in
                            the field of computer science in Mecklenburg-Vorpommern&nbsp;</p></div>
                    </div>
                </div>


                <div id="c1085821" class="csc-frame csc-frame-default frame-type-div frame-layout-0">
                    <hr class="ce-div"/>
                </div>


                <div id="c1085823" class="csc-frame csc-frame-default frame-type-text frame-layout-0">
                    <div class="csc-header"><h3 class="">
                        Research
                    </h3></div>
                    <p>The varied activites of the <a href="chairs/portal-site-chairs/index.html"
                                                      title="Öffnet internen Link" class="internal-link">scientists</a>
                        at the Computer Science Division include basic research as much as application-oriented projects
                        related to all&nbsp; subject areas. The <a href="research/portal-site-research/index.html"
                                                                   title="Öffnet internen Link" class="internal-link">research
                            at the institute</a> is characterized by a high share of interdisciplinary issues resulting
                        from the cooperation with the <a href="https://www.inf.uni-rostock.de/en"
                                                         title="Öffnet internen Link" target="_blank"
                                                         class="external-link">Interdisciplinary Faculty</a>.</p></div>


                <div id="c1085825" class="csc-frame csc-frame-default frame-type-text frame-layout-0">
                    <div class="csc-header"><h3 class="">
                        Studies
                    </h3></div>
                    <p>The Computer Science Division offers a practice-oriented and research-oriented <a
                            href="study-teaching/portal-site-study-teaching/index.html" title="Öffnet internen Link"
                            class="internal-link">study program</a>. The study offers include the subjects Computer
                        Science, business informatics and information technology/computer engineering, bachelor and
                        master level each. Computer Science for teacher-training and the master Visual Computing
                        complement the program.</p>
                    <p>&nbsp;</p></div>


                <div id="c1085827" class="csc-frame csc-frame-default frame-type-div frame-layout-0">
                    <hr class="ce-div"/>
                </div>

            </div>

            <div class="grid__column grid__column--md-4" id="dash_2">
                <div id="c1085813" class="csc-frame csc-frame-default frame-type-text frame-layout-0 highlight-box-alt">
                    <div class="csc-header"><h3 class="">
                        Contact
                    </h3></div>
                    <p>University of Rostock<br/><a href="http://www.ief.uni-rostock.de/index.php?id=1&amp;L=1"
                                                    title="Öffnet internen Link" target="_blank" class="external-link">Faculty
                        of Computer Science and Electrical Engineering </a><br/> Computer Science Division<br/>
                        Albert-Einstein-Str. 22<br/> 18059 Rostock</p>
                    <p>Secretariat<br/> Mrs. Schulze<br/> Room 163<br/> Phone.: +49 381 498 7451<br/> Fax: +49 381 498
                        7452<br/><a href="mailto:informatik@uni-rostock.de"> eMail: informatik@uni-rostock.de</a></p>


                    <img id="contact_component" src="main/file/285.png" style="width: 100%; display: none;">

                </div>


                <div id="c1085817" class="csc-frame csc-frame-default frame-type-image frame-layout-0">
                    <div class="csc-textpic csc-textpic-responsive csc-textpic-center csc-textpic-above">
                        <div class="csc-textpic-imagewrap" data-csc-images="1" data-csc-cols="1">
                            <div class="csc-textpic-center-outer">
                                <div class="csc-textpic-center-inner">
                                    <div class="csc-textpic-imagerow">
                                        <div class="media-element csc-textpic-imagecolumn">
                                            <figure class="media-element__image">
                                                <picture>
                                                    <source srcset="main/file/EU-Logo_en.jpg"
                                                            media="(max-width: 500px)">
                                                    <source srcset="main/file/EU-Logo_en.jpg"
                                                            media="(max-width: 500px) AND (min-resolution: 192dpi)">
                                                    <source srcset="main/file/EU-Logo_en.jpg"
                                                            media="(min-width: 501px) AND (max-width: 768px)">
                                                    <source srcset="main/file/EU-Logo_en.jpg"
                                                            media="(min-width: 768px)">
                                                    <img src="main/file/EU-Logo_en.jpg"
                                                         width="231" height="200" alt=""/></picture>
                                            </figure>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>


        </div>

    </main>
    <!-- theme_hsmv: Partials/Content/Main.html [end] -->

    <div id="contact_config"
         style="border: 2px solid red; right: 10px; text-align: center; position:absolute; top:680px; padding: 10px; display: none;">
        <div style="margin:20px;">What is your opinion?</div>
        <select id="contact_select">
            <option value="0">Do not show map</option>
            <option value="1">Show map</option>
        </select>
    </div>
</div>
<!-- theme_hsmv: Templates/Theme/CenterContent.html [end] -->


<footer class="footer footer--padding-bottom">
    <div class="footer-column footer-column--dark">
        <div class="footer__content-wrapper">

            <div class="grid">
                <div class="grid__column grid__column--xs-12 grid__column--sm-12 grid__column--md-9">

                    <div id="c1179023" class="grid csc-frame csc-frame-default csc-frame--type-gridelements_pi1">


                        <div class="grid__column grid__column--md-4">
                            <div id="c1179021" class="csc-frame csc-frame-default frame-type-text frame-layout-0">
                                <div class="csc-header"><h4 class="">
                                    Contact
                                </h4></div>
                                <p>Computer Science Division<br/> University of Rostock<br/> 18059 Rostock<br/>
                                    Albert-Einstein-Str. 22<br/><br/> Phone: +49 (0) 381 498 - 7451<br/></p></div>

                        </div>

                        <div class="grid__column grid__column--md-4">
                            <div id="c1179019" class="csc-frame csc-frame-default frame-type-text frame-layout-0">
                                <div class="csc-header"><h4 class="">
                                    Webmaster Computer Science
                                </h4></div>
                                <p>Send an email</p></div>

                        </div>

                        <div class="grid__column grid__column--md-4">
                            <div id="c1179017"
                                 class="csc-frame csc-frame-default frame-type-menu_subpages frame-layout-0">
                                <div class="csc-header"><h4 class="">
                                    Service
                                </h4></div>
                                <ul class="csc-menu">
                                    <li><a href="footer/site-map-and-arrival/index.html"
                                           title="Site map and arrival"><span>Site map and arrival</span></a></li>
                                    <li><a href="footer/regulations/index.html"
                                           title="Regulations"><span>Regulations</span></a></li>
                                    <li><a href="footer/imprint/index.html" title="Imprint"><span>Imprint</span></a>
                                    </li>
                                    <li><a href="footer/privacy/index.html" title="Privacy"><span>Privacy</span></a>
                                    </li>
                                </ul>
                            </div>

                        </div>


                    </div>


                </div>
                <div class="grid__column grid__column--xs-12 grid__column--sm-12 grid__column--md-3">

                    <!-- theme_hsmv: Partials/Content/Socialmedia.html [begin] -->

                    <h4>Social Media</h4>
                    <ul class="socialmedia-list">

                        <li class="socialmedia-list__item">
                            <a class="social-link social-link--facebook" target="_blank"
                               href="https://www.facebook.com/universitaet.rostock/">Facebook</a>
                        </li>


                        <li class="socialmedia-list__item">
                            <a class="social-link social-link--youtube" target="_blank"
                               href="https://www.youtube.com/user/unirostock/">YouTube</a>
                        </li>


                    </ul>

                    <!-- theme_hsmv: Partials/Content/Socialmedia.html [end] -->

                </div>
            </div>

            <div class="footer-bottom">
                <div class="footer-bottom__copyright">
                    <p>&copy;&nbsp;2020&nbsp; Universität Rostock</p>
                </div>
            </div>

        </div>
    </div>
</footer>

<%--<script src="main/file/modernizr.min.js" type="text/javascript"></script>--%>
<script src="https://www.informatik.uni-rostock.de/typo3conf/ext/theme_hsmv/Resources/Public/JavaScript/main-menu.js?1574938898"
        type="text/javascript"></script>
<script src="https://www.informatik.uni-rostock.de/typo3conf/ext/theme_hsmv/Resources/Public/JavaScript/sub-menu.js?1574938898"
        type="text/javascript"></script>
<script src="https://www.informatik.uni-rostock.de/typo3conf/ext/theme_hsmv/Resources/Public/JavaScript/header-submenu.js?1574938898"
        type="text/javascript"></script>
<script src="https://www.informatik.uni-rostock.de/typo3conf/ext/theme_hsmv/Resources/Public/JavaScript/slick.min.js?1574938898"
        type="text/javascript"></script>
<%--<script src="https://www.informatik.uni-rostock.de/typo3conf/ext/theme_hsmv/Resources/Public/JavaScript/scroll-top.js?1574938898"--%>
<%--        type="text/javascript"></script>--%>
<%--<script type="text/javascript">--%>
<%--    (function ($) {--%>
<%--        $(window).on('load', function () {--%>
<%--            $('#slider-1085811').slick({--%>
<%--                dots: true,--%>
<%--                arrows: true,--%>
<%--                infinite: true,--%>
<%--                slidesToShow: 1,--%>
<%--                lazyLoad: "onDemand",--%>
<%--                focusOnSelect: false,--%>
<%--                adaptiveHeight: true,--%>
<%--                autoplay: false,--%>

<%--                responsive: [--%>
<%--                    {--%>
<%--                        breakpoint: 768,--%>
<%--                        settings: {--%>
<%--                            autoplay: false--%>
<%--                        }--%>
<%--                    }--%>
<%--                ],--%>
<%--            });--%>
<%--        });--%>
<%--    })(jQuery);--%>
<%--</script>--%>
<div id="infodiv" style="background-color: #e2e2e2; z-index:1000; height:auto; padding-top:20px; width:300px; position: fixed; top:10px; right:10px; color:black; ">
    <div align="center"><u>Ticket</u></div><br>
    <table style="padding: 10px;" border="0">
        <tr>
            <td><b>Guid</b></td>
            <td  id="guid" >aaaa</td>
        </tr>
        <tr>
            <td><b>Public</b></td>
            <td  id="publicIs" >aaaa</td>
        </tr>
        <tr>
            <td><b>Sent</b></td>
            <td  id="sentTime" >aaaa</td>
        </tr>
        <tr>
            <td><b>Items</b></td>
            <td id="commentcount" >aaaa</td>
        </tr>
        <tr>
            <td><b>Name</b></td>
            <td id="name" >aaaa</td>
        </tr>
        <tr>
            <td><b>Email</b></td>
            <td id="email" >aaaa</td>
        </tr>

    </table>
    <table style="padding:10px; border:0;" class="centertable">
        <tr>
            <td><b>Ticket settings</b></td>
            <td><b>Local settings</b></td>
        </tr>
        <tr><td colspan="2">Please adjust the red properties, a change of browser zoom can help.</td></tr>
        <tr><td colspan="2"><b>Windows dimensions</b></td></tr>
        <tr>
            <td id="windimensionsDB">10x10</td>
            <td id="windimensions" style="color:red;">-</td>
        </tr>
        <tr><td colspan="2"><b>Browser</b></td></tr>
        <tr>
            <td id="browserDB">10x10</td>
            <td id="browsername">-</td>
        </tr>
        <tr><td colspan="2"><b>Browser font-size</b></td></tr>
        <tr>
            <td id="browserfontDB">10x10</td>
            <td id="browserfont">-</td>
        </tr>

    </table>
    <style>
        table tr {
            border-bottom: 0px;
        }

        table tr td {

            font-size: 14px!important;
            padding:9px;
        }

        .centertable tr td {
            text-align: center;
        }
    </style>

</div>
</body>
</html>