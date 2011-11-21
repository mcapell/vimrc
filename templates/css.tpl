# filetype: css
/* container - place inside each section or around the entire page depending on your layout */
.container {
    width: 100%;
    margin: 0 auto;
    text-align: left;
    position: relative;
}
 
/* for clearing any floats <br class="clear" /> */
.clear{
    clear:both;
    height:0;
    font-size: 1px;
    line-height: 0px;
}
 
/*--- header section - put whatever you want here ---*/
#header {
}
 
/*--- horizontal "block" menu (A.K.A: navbar) ---*/
#menu {
    float: left;
}
#menu li {
    display: block;
    float: left;
}
#menu li a {
    display: block;
    text-decoration: none;
    height: 50px;
    width: 125px;
    padding: 5px 10px 5px 10px;
}
/* wordpress specific menu stylings */
#menu li.current_page_item a {
}
#menu li.first a {
}
#menu li.last a {
}
 
/*--- content section - put whatever you want here ---*/
#main {
    font: 1.2em Verdana, Arial, Helvetica, sans-serif;
    clear: both;
}
/*--- sidebar section - widgeds layout in Wordpress ---*/
#sidebar {
    float: right;
    width: 25%;
}

/*--- ColumnLeft section - put whatever you want here ---*/
#ColumnLeft {
    width: 74%;
}
 
/*--- footer section - put whatever you want here ---*/
#footer {
}

