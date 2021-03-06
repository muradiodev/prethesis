<%-- 
    Document   : index
    Created on : Mar 2, 2020, 12:07:01 PM
    Author     : foosa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

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
        <link rel="shortcut icon" href="admin/assets/images/favicon.png" />
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
                    <a class="navbar-brand brand-logo" href="index.html">
                        <img src="admin/assets/images/logo.svg" alt="logo" /> </a>
                    <a class="navbar-brand brand-logo-mini" href="index.html">
                        <img src="admin/assets/images/logo-mini.svg" alt="logo" /> </a>
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
                        <!-- Page Title Header Starts-->
                        <!-- Page Title Header Ends-->
                        <div class="row">
                            <div class="col-md-8">
                                <div class="row">
                                    <div class="col-md-6 grid-margin stretch-card">
                                        <div class="card">
                                            <div class="card-body pb-0">
                                                <div class="d-flex justify-content-between">
                                                    <h4 class="card-title mb-0">Total tickets</h4>
                                                    <p class="font-weight-semibold mb-0">2</p>
                                                </div>
                                            </div>
                                            <canvas class="mt-n4" height="90" id="total-revenue"></canva>
                                        </div>
                                    </div>
                                    <div class="col-md-6 grid-margin stretch-card">
                                        <div class="card">
                                            <div class="card-body pb-0">
                                                <div class="d-flex justify-content-between">
                                                    <h4 class="card-title mb-0">Total alternative selections</h4>
                                                    <p class="font-weight-semibold mb-0">14</p>
                                                </div>
                                            </div>
                                            <canvas class="mt-n3" height="90" id="total-transaction"></canva>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
<%--                        <%@ include file="demooo.jsp" %>--%>
                    </div>
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