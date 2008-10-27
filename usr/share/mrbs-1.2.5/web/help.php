<?php

# $Id: help.php,v 1.12.2.1 2007/01/24 10:40:16 jberanek Exp $

require_once "grab_globals.inc.php";
include "config.inc.php";
include "$dbsys.inc";
include "functions.inc";
include "version.inc";

#If we dont know the right date then make it up
if(!isset($day) or !isset($month) or !isset($year))
{
	$day   = date("d");
	$month = date("m");
	$year  = date("Y");
}
if(empty($area))
	$area = get_default_area();

print_header($day, $month, $year, $area);


echo "<h2>" . get_vocab("help") . "</h2>\n";
echo "<a name=\"top\"></a>\n";
echo get_vocab("please_contact") . '<a href="mailto:' . $mrbs_admin_email . '">' . $mrbs_admin . "</a> " . get_vocab("for_any_questions") . "\n";
 
#include "site_faq" . $faqfilelang . ".html";
include "site_faq_lml.html";

echo "<h3>" . get_vocab("about_mrbs") . "</h3>\n";
echo "<a href=\"http://mrbs.sourceforge.net\">".get_vocab("mrbs")."</a> - ".get_mrbs_version()."\n";
echo "<BR>" . get_vocab("database") . sql_version() . "\n";
echo "<BR>" . get_vocab("system") . php_uname() . "\n";
echo "<BR>PHP: " . phpversion() . "\n";

include "trailer.inc";
?>
