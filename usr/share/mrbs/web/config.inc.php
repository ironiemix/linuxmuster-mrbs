<?php

// $Id: config.inc.php 1640 2010-11-24 17:50:28Z jberanek $

/**************************************************************************
 *   MRBS Configuration File
 *   Configure this file for your site.
 *   You shouldn't have to modify anything outside this file
 *   (except for the lang.* files, eg lang.en for English, if
 *   you want to change text strings such as "Meeting Room
 *   Booking System", "room" and "area").
 **************************************************************************/

// The timezone your meeting rooms run in. It is especially important
// to set this if you're using PHP 5 on Linux. In this configuration
// if you don't, meetings in a different DST than you are currently
// in are offset by the DST offset incorrectly.
//
// When upgrading an existing installation, this should be set to the
// timezone the web server runs in.  See the INSTALL document for more information.
//
// A list of valid timezones can be found at http://php.net/manual/timezones.php
// The following line must be uncommented by removing the '//' at the beginning
//$timezone = "Europe/London";


/*******************
 * Database settings
 ******************/
// Which database system: "pgsql"=PostgreSQL, "mysql"=MySQL,
// "mysqli"=MySQL via the mysqli PHP extension
$dbsys = "mysql";
// Hostname of database server. For pgsql, can use "" instead of localhost
// to use Unix Domain Sockets instead of TCP/IP.
$db_host = "localhost";
// Database name:
$db_database = "mrbs";
// Database login user name:
$db_login = "mrbs";
// Database login password:
$db_password = 'mrbs-password';
// Prefix for table names.  This will allow multiple installations where only
// one database is available
$db_tbl_prefix = "mrbs_";
// Uncomment this to NOT use PHP persistent (pooled) database connections:
// $db_nopersist = 1;


// Configuration for linuxmuster-mrbs

// Admins
$mrbs_admin = "administrator";
$mrbs_admin_email = "administrator@localhost";

// Schulname
$mrbs_company = "<a href=https://server/mrbs/>Raumbuchungssystem</a>";

// Theme
$theme = "default";

// Zeitraster
$enable_periods = TRUE;
$resolution = 900;
$morningstarts = 7;
$morningstarts_minutes = 0;
$eveningends   = 19;
$eveningends_minutes = 45;
// Wochenstart am Montag
$weekstarts = 1;
// Europ Datumsangabe
$dateformat = 1;
// Standardansicht
$default_view = "week";

// Beispiel fuer eine Schule, anpassen an eigene Beduerfnisse:

$periods[] = "(1.)07:40-08:25";
$periods[] = "(2.)08:30-09:15";
#$periods[] = "1.Pause";
$periods[] = "(3.)09:35-10:20";
$periods[] = "(4.)10:25-11:10";
#$periods[] = "2.&nbsp;Pause";
$periods[] = "(5.)11:20-12:05";
$periods[] = "(6.)12:10-12:55";
$periods[] = "(7.)13:30-14:15";
$periods[] = "(8.)14:20-15:05";
$periods[] = "(9.)15:10-15:55";
#$periods[] = "3.Pause";
$periods[] = "(10.)16:00-16:45";
$periods[] = "(11.)16:50-17:35";

// This next section must come at the end of the config file - ie after any
// language and mail settings, as the definitions are used in the included file
require_once "language.inc";   // DO NOT DELETE THIS LINE

/*************
 * Entry Types
 *************/

// This array maps entry type codes (letters A through J) into descriptions.
//
// Each type has a color which is defined in the array $color_types in the Themes
// directory - just edit whichever include file corresponds to the theme you
// have chosen in the config settings. (The default is default.inc, unsurprisingly!)
//
// The value for each type is a short (one word is best) description of the
// type. The values must be escaped for HTML output ("R&amp;D").
// Please leave I and E alone for compatibility.
// If a type's entry is unset or empty, that type is not defined; it will not
// be shown in the day view color-key, and not offered in the type selector
// for new or edited entries.

// $typel["A"] = "A";
// $typel["B"] = "B";
// $typel["C"] = "C";
// $typel["D"] = "D";
$typel["E"] = get_vocab("external");
// $typel["F"] = "F";
// $typel["G"] = "G";
// $typel["H"] = "H";
$typel["I"] = get_vocab("internal");
// $typel["J"] = "J";

?>
