<%-- 
    Document   : index
    Created on : Mar 2, 2020, 12:07:01 PM
    Author     : foosa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Pre-Thesis Admin</title>
    <!-- plugins:css -->
    <link rel="stylesheet" href="admin/assets/vendors/iconfonts/mdi/css/materialdesignicons.min.css">
    <link rel="stylesheet" href="admin/assets/vendors/iconfonts/ionicons/css/ionicons.css">
    <link rel="stylesheet" href="admin/assets/vendors/iconfonts/typicons/src/font/typicons.css">
    <link rel="stylesheet" href="admin/assets/vendors/iconfonts/flag-icon-css/css/flag-icon.min.css">
    <link rel="stylesheet" href="admin/assets/vendors/css/vendor.bundle.base.css">
    <link rel="stylesheet" href="admin/assets/vendors/css/vendor.bundle.addons.css">
    <!-- endinject -->
    <!-- plugin css for this page -->
    <!-- End plugin css for this page -->
    <!-- inject:css -->
    <link rel="stylesheet" href="admin/assets/css/shared/style.css">
    <!-- endinject -->
    <!-- Layout styles -->
    <link rel="stylesheet" href="admin/assets/css/demo_1/style.css">
    <!-- End Layout styles -->
    <link rel="shortcut icon" href="admin/assets/images/favicon.png"/>
</head>
<body>
<script>
    function includeHTML() {
        var z, i, elmnt, file, xhttp;
        /* Loop through a collection of all HTML elements: */
        z = document.getElementsByTagName("*");
        for (i = 0; i < z.length; i++) {
            elmnt = z[i];
            /*search for elements with a certain atrribute:*/
            file = elmnt.getAttribute("w3-include-html");
            if (file) {
                /* Make an HTTP request using the attribute value as the file name: */
                xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function () {
                    if (this.readyState == 4) {
                        if (this.status == 200) {
                            elmnt.innerHTML = this.responseText;
                        }
                        if (this.status == 404) {
                            elmnt.innerHTML = "Page not found.";
                        }
                        /* Remove the attribute, and call this function once more: */
                        elmnt.removeAttribute("w3-include-html");
                        includeHTML();
                    }
                }
                xhttp.open("GET", file, true);
                xhttp.send();
                /* Exit the function: */
                return;
            }
        }
    }
</script>

<div class="container-scroller">
    <!-- Logo -->
    <nav class="navbar default-layout col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
        <div class="text-center navbar-brand-wrapper d-flex align-items-top justify-content-center">
            <a class="navbar-brand brand-logo" href="/">
                <img src="http://localhost:8084/main/file/csm_rostock_logo_0afd2db082.png" alt="logo" /> </a>
            <a class="navbar-brand brand-logo-mini" href="/">
                <img src="http://localhost:8084/main/file/csm_rostock_logo_0afd2db082.png" alt="logo" /> </a>
        </div>
        <%@ include file="header.jsp" %>

    </nav>
    <!-- partial -->
    <div class="container-fluid page-body-wrapper">
        <!-- partial:partials/_sidebar.html -->
        <%@ include file="menu.jsp" %>
        <!-- partial -->
        <div class="main-panel">
            <div class="content-wrapper">


                <c:forEach items="${ticket}" var = "t">


                <div class="card myclear mb-3">
                    <div>
                        <h2 class="float-left mb-3">Ticket</h2>
                        <button type="button" class="btn float-right m-3 btn-secondary" style="">
                            <i class="fa fa-trash mr-3"></i>Delete
                        </button>
                    </div>
                    <div class="card-body">
                        <div class="row mb-2">
                            <div class="text-sm-right col-sm-3">
                                <b>Status:</b>
                            </div>
                            <div class="col">
                                <h6 class="bg-warning px-2 d-inline fm__unselectable text-nowrap">open</h6>
                                <button type="button" class="btn float-right btn-secondary btn-sm">Close ticket</button>
                            </div>
                        </div>
                        <div class="row mb-2">
                            <div class="text-sm-right col-sm-3"><b>Sent:</b></div>
                            <div class="col">2/28/2020, 8:20:08</div>

                        </div>
                        <div class="row mb-2">
                            <div class="text-sm-right col-sm-3"><b>ViewGuid:</b>
                            </div>
                            <div class="col">${t.viewGuid}</div>

                        </div>
                        <div class="row mt-4 mb-2">
                            <div class="text-sm-right col-sm-3"><b>Name:</b></div>
                            <div class="col">${t.name}</div>

                        </div>
                        <div class="row mb-2">
                            <div class="text-sm-right col-sm-3"><b>Email:</b></div>
                            <div class="col">${t.email}</div>

                        </div>
                        <div class="row mb-2">
                            <div class="text-sm-right col-sm-3"><b>Url:</b></div>
                            <div class="col"><a href="http://localhost:8084/indexOpen?id=${t.viewGuid}" target="_blank">http://localhost:8084/indexOpen?id=${t.viewGuid}</a>
<%--                                <button type="button" class="btn float-right btn-secondary btn-sm">Show ticket at url--%>
<%--                                </button>--%>
                            </div>

                        </div>
                        <div class="row mb-2">
                            <div class="text-sm-right col-sm-3"><b>Public:</b></div>
                            <div class="col">${t.isPublic}<i class="fa fa-remove"></i></div>
                        </div>
                        <div class="row mt-4 mb-2">
                            <div class="text-sm-right col-sm-3"><b>Browser:</b></div>
                            <div class="dont-break-out col">${t.navigatorString}</div>

                        </div>
                        <div class="row mb-2">
                            <div class="text-sm-right col-sm-3"><b>Browser window:</b></div>
                            <div class="dont-break-out col">${t.screenWidth} x ${t.screenHeight}</div>

                        </div>
                        <div class="row mb-2">
                            <div class="text-sm-right col-sm-3"><b>Browser font size:</b></div>
                            <div class="dont-break-out col">${t.browserFontSize} </div>

                        </div>

                    </div>

                    <h5 class="mb-2 ml-2">Annotations</h5>

                    <div class="table-responsive">

                        <table aria-busy="false" aria-colcount="2" class="table b-table table-hover border" id="__BVID__13">
                            <thead role="rowgroup" class="">
                            <tr role="row">
                                <th role="columnheader" scope="col" aria-colindex="1" class="">Text</th>
                                <th role="columnheader" scope="col" aria-colindex="2" aria-label="No" class=""
                                    style="width: 100px !important;"></th>
                            </tr>
                            </thead>
                            <tbody role="rowgroup" class="">
                                <%--                        <c:set var = "viewGuid" scope = "session" value = "${ticket.viewGuid}"/>--%>
                            <c:forEach items="${anns}" var = "a">

                                <tr role="row" class="">
                                    <td role="cell" aria-colindex="1" class="">
                                            ${a.comment}
                                    </td>
                                    <td role="cell" aria-colindex="2" class="">

                                        <a href="/deleteAnnotation?id=${a.id}&viewGuid=${t.viewGuid}" class="btn btn-outline-danger btn-fw" role="button" aria-pressed="true"><i
                                                class="fa fa-trash-o mr-3"></i>Delete</a>


                                    </td>
                                </tr>
                            </c:forEach>

                            </tbody>
                        </table>

                    </div>

                </div>
                </c:forEach>

                <!-- content-wrapper ends -->
                <!-- partial:partials/_footer.html -->
                <%@ include file="footer.jsp" %>
                <!-- partial -->
            </div>
            <!-- main-panel ends -->
        </div>
        <!-- container-scroller -->
        <!-- plugins:js -->
        <script src="admin/assets/vendors/js/vendor.bundle.base.js"></script>
        <script src="admin/assets/vendors/js/vendor.bundle.addons.js"></script>
        <!-- endinject -->
        <!-- Plugin js for this page-->
        <!-- End plugin js for this page-->
        <!-- inject:js -->
        <script src="admin/assets/js/shared/off-canvas.js"></script>
        <script src="admin/assets/js/shared/misc.js"></script>
        <!-- endinject -->
        <!-- Custom js for this page-->
        <script src="admin/assets/js/demo_1/dashboard.js"></script>
        <!-- End custom js for this page-->
</body>
</html>