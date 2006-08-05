@echo off
rem
rem $Id: makelib.bat,v 1.27 2006-08-05 02:20:30 guerra000 Exp $
rem
cls

Rem Set Paths 

IF "%HG_BCC%"==""  SET HG_BCC=c:\borland\bcc55
IF "%HG_ROOT%"=="" SET HG_ROOT=c:\oohg
IF "%HG_HRB%"==""  SET HG_HRB=c:\harbour

IF NOT EXIST %hg_root%\lib\oohg.lib MD %hg_root%\lib >nul

IF EXIST %hg_root%\lib\oohg.lib del %hg_root%\lib\oohg.lib
IF EXIST %hg_root%\lib\hbprinter.lib del %hg_root%\lib\hbprinter.lib
IF EXIST %hg_root%\lib\miniprint.lib del %hg_root%\lib\miniprint.lib

if exist %hg_hrb%\lib\tip.lib goto XHARBOUR_COMPILE

:HARBOUR_COMPILE
SET OOHG_X_FLAGS=-i%hg_hrb%\include;%hg_root%\include; -n1 -w  -gc0 -es2
GOTO PRG_COMPILE

:XHARBOUR_COMPILE
SET OOHG_X_FLAGS=-i%hg_hrb%\include;%hg_root%\include; -n1 -w2 -gc0 -es2
GOTO PRG_COMPILE

:PRG_COMPILE
%hg_hrb%\bin\harbour h_browse h_scrsaver h_error h_ipaddress h_monthcal h_help h_crypt h_status h_tree h_toolbar h_init h_media h_winapimisc h_slider h_button h_checkbox h_combo h_controlmisc h_datepicker h_editbox h_dialogs h_grid h_windows h_image h_label h_listbox h_menu h_msgbox h_frame h_progressbar h_radio h_spinner h_tab h_textbox h_timer h_cursor h_ini h_report h_registry h_font h_hyperlink h_hotkey h_graph h_richeditbox h_edit h_edit_ex h_zip %OOHG_X_FLAGS%
if errorlevel 1 goto EXIT1
%hg_hrb%\bin\harbour h_http h_comm h_print h_scroll h_splitbox h_progressmeter h_scrollbutton h_xbrowse h_internal h_textarray %OOHG_X_FLAGS%
if errorlevel 1 goto EXIT1
if exist winprint.prg  %hg_hrb%\bin\harbour winprint  %OOHG_X_FLAGS%
if errorlevel 1 goto EXIT1
if exist miniprint.prg %hg_hrb%\bin\harbour miniprint %OOHG_X_FLAGS%
if errorlevel 1 goto EXIT1

SET OOHG_X_FLAGS=-c -O2 -tW -tWM -d -a8 -OS -5 -6 -I%hg_hrb%\include;%hg_bcc%\include; -L%hg_hrb%\lib;%hg_bcc%\lib;

%hg_bcc%\bin\bcc32 %OOHG_X_FLAGS% h_scrsaver.c h_edit.c h_edit_ex.c h_error.c h_ipaddress.c c_ipaddress.c h_monthcal.c c_monthcal.c h_help.c c_help.c h_crypt.c c_crypt.c h_status.c h_tree.c c_tree.c c_toolbar.c h_toolbar.c h_init.c h_media.c c_media.c h_winapimisc.c h_slider.c c_checkbox.c c_combo.c c_controlmisc.c c_datepicker.c c_resource.c h_cursor.c c_cursor.c c_ini.c h_ini.c h_report.c h_registry.c h_font.c c_font.c h_hyperlink.c h_richeditbox.c c_richeditbox.c h_scroll.c h_http.c h_zip.c h_progressmeter.c h_comm.c h_print.c
if errorlevel 1 goto EXIT2
%hg_bcc%\bin\bcc32 %OOHG_X_FLAGS% c_dialogs.c c_grid.c c_windows.c c_image.c c_listbox.c c_menu.c c_msgbox.c c_frame.c c_progressbar.c c_slider.c c_spinner.c c_textbox.c c_timer.c c_winapimisc.c h_button.c h_checkbox.c h_combo.c h_controlmisc.c h_datepicker.c h_editbox.c h_dialogs.c h_grid.c h_windows.c h_image.c h_label.c h_listbox.c h_menu.c h_msgbox.c h_frame.c h_progressbar.c h_radio.c h_spinner.c h_tab.c h_textbox.c h_timer.c c_scrsaver.c h_hotkey.c h_graph.c c_graph.c h_browse.c h_splitbox.c h_scrollbutton.c h_xbrowse.c h_internal.c h_textarray.c
if errorlevel 1 goto EXIT2
if exist winprint.c  %hg_bcc%\bin\bcc32 %OOHG_X_FLAGS% winprint.c
if errorlevel 1 goto EXIT2
if exist miniprint.c %hg_bcc%\bin\bcc32 %OOHG_X_FLAGS% miniprint.c
if errorlevel 1 goto EXIT2

%hg_bcc%\bin\tlib %hg_root%\lib\oohg +h_scrsaver.obj +h_edit.obj +h_edit_ex.obj +h_error.obj +h_ipaddress.obj +c_ipaddress.obj +h_monthcal.obj +c_monthcal.obj +h_help.obj +c_help.obj +h_status.obj +h_tree.obj +c_tree.obj +h_toolbar.obj +c_toolbar.obj +h_init.obj +h_media.obj + c_media.obj  +c_resource.obj +h_cursor.obj +c_cursor.obj +h_ini.obj +c_ini.obj +h_report.obj +h_font.obj +c_font.obj +h_hyperlink.obj +c_scrsaver.obj +h_hotkey.obj +h_graph.obj +c_graph.obj +h_richeditbox.obj +c_richeditbox.obj +h_browse.obj +h_scroll.obj +h_http.obj +h_zip.obj +h_progressmeter.obj +h_comm.obj +h_print.obj +h_splitbox.obj +h_scrollbutton.obj +h_xbrowse.obj +h_internal.obj +h_textarray.obj
if errorlevel 2 goto EXIT3
%hg_bcc%\bin\tlib %hg_root%\lib\oohg +c_crypt.obj +h_crypt.obj +h_winapimisc.obj +h_slider.obj +c_checkbox.obj +c_combo.obj +c_controlmisc.obj +c_datepicker.obj +c_dialogs.obj +c_grid.obj +c_windows.obj +c_image.obj +c_listbox.obj +c_menu.obj +c_msgbox.obj +c_frame.obj +c_progressbar.obj +c_slider.obj +c_spinner.obj +c_textbox.obj +c_timer.obj +c_winapimisc +h_button.obj +h_checkbox.obj +h_combo.obj +h_controlmisc.obj +h_datepicker.obj +h_editbox.obj +h_dialogs.obj +h_grid.obj +h_windows.obj +h_image.obj +h_label.obj +h_listbox.obj +h_menu.obj +h_msgbox.obj +h_frame.obj +h_progressbar.obj +h_radio.obj +h_spinner.obj +h_tab.obj +h_textbox.obj +h_timer.obj +h_registry.obj
if errorlevel 2 goto EXIT3
if exist winprint.obj  %hg_bcc%\bin\tlib %hg_root%\lib\hbprinter +winprint.obj
if errorlevel 2 goto EXIT3
if exist miniprint.obj %hg_bcc%\bin\tlib %hg_root%\lib\miniprint +miniprint.obj
if errorlevel 2 goto EXIT3

:EXIT3
IF EXIST %hg_root%\lib\oohg.bak del %hg_root%\lib\oohg.bak
IF EXIST %hg_root%\lib\hbprinter.bak del %hg_root%\lib\hbprinter.bak
IF EXIST %hg_root%\lib\miniprint.bak del %hg_root%\lib\miniprint.bak

:EXIT2
del *.obj

:EXIT1
del h_*.c
if exist winprint.c  del winprint.c
if exist miniprint.c del miniprint.c

SET OOHG_X_FLAGS=
