<%-- 
    Document   : howto
    Created on : Mar 2, 2020, 12:55:18 PM
    Author     : foosa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <aside class="col-12 col-md-auto p-1 bg-dark"><nav class="navbar navbar-expand navbar-dark bg-dark flex-md-column flex-row align-items-start py-2"><div class="collapse navbar-collapse"><ul class="flex-md-column flex-row navbar-nav w-100 justify-content-between"><li class="nav-item"><a href="/" class="nav-link pl-0 text-nowrap router-link-active"><i class="fa fa-home fa-fw"></i><span class="font-weight-bold ml-1">Home</span></a></li><li class="nav-item"><a href="/domains" class="nav-link pl-0"><i class="fa fa-globe fa-fw"></i><span class="d-none d-md-inline ml-1">Manage domains</span></a></li><li class="nav-item"><a href="/account" class="nav-link pl-0"><i class="fa fa-cog fa-fw"></i><span class="d-none d-md-inline ml-1">Account</span></a></li><li class="nav-item"><a href="#" class="nav-link pl-0"><i class="fa fa-power-off fa-fw"></i><span class="d-none d-md-inline ml-1">Logout</span></a></li></ul></div></nav></aside><main id="main" class="col bg-faded py-3"><div data-v-5c46b89b=""><!----><!----><h2 data-v-5c46b89b="">How to integrate your project<br data-v-5c46b89b=""><small data-v-5c46b89b="" class="text-muted">Main project</small></h2><br data-v-5c46b89b=""><div data-v-5c46b89b="" class="row mb-4 text-center"><div data-v-5c46b89b="" class="col"><button data-v-5c46b89b="" type="button" class="btn m-1 btn-secondary">Show HTML for usage with <br data-v-5c46b89b="">a predefined 'div'</button></div><div data-v-5c46b89b="" class="col"><button data-v-5c46b89b="" type="button" class="btn m-1 btn-secondary">Show HTML for usage with <br data-v-5c46b89b="">an existing HTML-Element</button></div><div data-v-5c46b89b="" class="col"><button data-v-5c46b89b="" type="button" class="btn m-1 btn-secondary">Show HTML for usage with <br data-v-5c46b89b="">a special query parameter</button></div></div><div data-v-5c46b89b=""><div data-v-5c46b89b="">
      Please insert the following <span data-v-5c46b89b="" class="font-weight-bold">script</span> into the source code of all relevant pages.
      <br data-v-5c46b89b="">
      You can copy it from below: <br data-v-5c46b89b=""></div><pre data-v-5c46b89b="" style="">      <code data-v-5c46b89b="" class="prettyprint prettyprinted" style=""><span class="pln">
  </span><span class="tag">&lt;script</span><span class="pln"> </span><span class="atn">src</span><span class="pun">=</span><span class="atv">"https://collabwebdesign.henrik-hertel.de/feedback_client_module.js"</span><span class="tag">&gt;&lt;/script&gt;</span><span class="pln">
  </span><span class="tag">&lt;script&gt;</span><span class="pln"> 
    </span><span class="typ">Feedback_Client_Module</span><span class="pun">.</span><span class="pln">activate</span><span class="pun">(</span><span class="pln">
      </span><span class="pun">{</span><span class="pln"> 
        projectCode</span><span class="pun">:</span><span class="pln"> </span><span class="str">"aafd8264-4f37-5a24-d1b4-72eb1b425430"</span><span class="pun">,</span><span class="pln"> 
        modus</span><span class="pun">:</span><span class="pln"> </span><span class="str">"UsePredefined"</span><span class="pun">,</span><span class="pln"> 
        locationOfCSSFile</span><span class="pun">:</span><span class="pln"> </span><span class="str">"https://collabwebdesign.henrik-hertel.de/fm__styles.css"</span><span class="pun">,</span><span class="pln">
        allowPayment</span><span class="pun">:</span><span class="pln"> </span><span class="kwd">true</span><span class="pln">
      </span><span class="pun">});</span><span class="pln">
  </span><span class="tag">&lt;/script&gt;</span></code>
    </pre><pre data-v-5c46b89b="" style="display: none;">      <code data-v-5c46b89b="" class="prettyprint prettyprinted" style=""><span class="pln">
  </span><span class="tag">&lt;script</span><span class="pln"> </span><span class="atn">src</span><span class="pun">=</span><span class="atv">"https://collabwebdesign.henrik-hertel.de/feedback_client_module.js"</span><span class="tag">&gt;&lt;/script&gt;</span><span class="pln">
  </span><span class="tag">&lt;script&gt;</span><span class="pln"> 
    </span><span class="typ">Feedback_Client_Module</span><span class="pun">.</span><span class="pln">activate</span><span class="pun">(</span><span class="pln">
      </span><span class="pun">{</span><span class="pln"> 
        projectCode</span><span class="pun">:</span><span class="pln"> </span><span class="str">"aafd8264-4f37-5a24-d1b4-72eb1b425430"</span><span class="pun">,</span><span class="pln"> 
        modus</span><span class="pun">:</span><span class="pln"> </span><span class="str">"UseExistingHTMLElement"</span><span class="pun">,</span><span class="pln">
        targetElement</span><span class="pun">:</span><span class="pln"> document</span><span class="pun">.</span><span class="pln">getElementById</span><span class="pun">(</span><span class="str">"myExistingDiv"</span><span class="pun">),</span><span class="pln">
        locationOfCSSFile</span><span class="pun">:</span><span class="pln"> </span><span class="str">"https://collabwebdesign.henrik-hertel.de/fm__styles.css"</span><span class="pun">,</span><span class="pln">
        allowPayment</span><span class="pun">:</span><span class="pln"> </span><span class="kwd">true</span><span class="pln">
      </span><span class="pun">});</span><span class="pln">
  </span><span class="tag">&lt;/script&gt;</span></code>
     </pre><pre data-v-5c46b89b="" style="display: none;">      <code data-v-5c46b89b="" class="prettyprint prettyprinted" style=""><span class="pln">
  </span><span class="tag">&lt;script</span><span class="pln"> </span><span class="atn">src</span><span class="pun">=</span><span class="atv">"https://collabwebdesign.henrik-hertel.de/feedback_client_module.js"</span><span class="tag">&gt;&lt;/script&gt;</span><span class="pln">
  </span><span class="tag">&lt;script&gt;</span><span class="pln"> 
    </span><span class="typ">Feedback_Client_Module</span><span class="pun">.</span><span class="pln">activate</span><span class="pun">(</span><span class="pln">
      </span><span class="pun">{</span><span class="pln"> 
        projectCode</span><span class="pun">:</span><span class="pln"> </span><span class="str">"aafd8264-4f37-5a24-d1b4-72eb1b425430"</span><span class="pun">,</span><span class="pln"> 
        modus</span><span class="pun">:</span><span class="pln"> </span><span class="str">"UseQueryParam"</span><span class="pun">,</span><span class="pln"> 
        locationOfCSSFile</span><span class="pun">:</span><span class="pln"> </span><span class="str">"https://collabwebdesign.henrik-hertel.de/fm__styles.css"</span><span class="pun">,</span><span class="pln">
        allowPayment</span><span class="pun">:</span><span class="pln"> </span><span class="kwd">true</span><span class="pln">
      </span><span class="pun">});</span><span class="pln">
  </span><span class="tag">&lt;/script&gt;</span></code>
    </pre><span data-v-5c46b89b="" class="font-weight-bold">Please consider:</span><br data-v-5c46b89b="">
      You can adjust the part <i data-v-5c46b89b="" class="text-info px-1">locationOfCSSFile: "https://collabwebdesign.henrik-hertel.de/fm__styles.css"</i> to point to your own CSS-file with your altered style. 
     
      <br data-v-5c46b89b="">
      If you want to allow payment via IOTA-Token you have to save your seed in your <a data-v-5c46b89b="" href="/account" class="">account</a> options, else change <i data-v-5c46b89b="" class="text-info px-1">allowPayment</i> to <i data-v-5c46b89b="" class="text-info px-1">false</i>.
    <br data-v-5c46b89b=""><!----><!----><br data-v-5c46b89b=""></div><br data-v-5c46b89b=""><div data-v-5c46b89b="" class="float-right"><button data-v-5c46b89b="" type="submit" class="btn btn-secondary">OK</button></div></div></main>
    </body>
</html>
