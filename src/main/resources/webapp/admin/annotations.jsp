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
                        
                        <thead role="rowgroup" class=""><!---->
                            <tr role="row">
                                <th tabindex="0" role="columnheader" scope="col" aria-colindex="1" aria-label="Click to sort Descending" aria-sort="ascending" class=""></th></tr>
                        </thead><!---->
                        <tbody role="rowgroup" class="">
                            <!---->
                            <tr role="row" class="">
                                <td role="cell" aria-colindex="1" class="">
                                    
                                    Main project<h6 class="fa-archive bg-success ml-2 px-2 d-inline fm__unselectable text-nowrap">active</h6>
                                    
                                    
                                    <div  class="h5 ml-2 mt-2"><a  href="howtointegrate.jsp" class="">How to integrate?</a></div>
                                    <div  class="h5 ml-2 mt-2"><a href="tickets.jsp" class="text-info">Show tickets</a><!----></div>
                                    <div  class="h5 ml-2 mt-2"><a href="alternativeselections.jsp" class="text-info">Show alternative selections</a><!----></div>
                                </td>
                            </tr><!----><!----></tbody>
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
        </div></body>
</html>