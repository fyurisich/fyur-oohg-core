/*
 * $Id: h_application.prg,v 1.11 2017-10-01 16:04:16 fyurisich Exp $
 */
/*
 * ooHG source code:
 * Application object
 *
 * Based upon
 * HMG Extended source code
 * Copyright 2009 by Grigory Filatov <gfilatov@inbox.ru>
 *
 * Copyright 2014-2017 Fernando Yurisich <fyurisich@oohg.org>
 * https://sourceforge.net/projects/oohg/
 *
 * Portions of this project are based upon Harbour MiniGUI library.
 * Copyright 2002-2005 Roberto Lopez <roblez@ciudad.com.ar>
 *
 * Portions of this project are based upon Harbour GUI framework for Win32.
 * Copyright 2001 Alexander S.Kresin <alex@belacy.belgorod.su>
 * Copyright 2001 Antonio Linares <alinares@fivetech.com>
 *
 * Portions of this project are based upon Harbour Project.
 * Copyright 1999-2017, https://harbour.github.io/
 */
/*
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2, or (at your option)
 * any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this software; see the file COPYING.  If not, write to
 * the Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
 * Boston, MA 02110-1335,USA (or download from http://www.gnu.org/licenses/).
 *
 * As a special exception, the ooHG Project gives permission for
 * additional uses of the text contained in its release of ooHG.
 *
 * The exception is that, if you link the ooHG libraries with other
 * files to produce an executable, this does not by itself cause the
 * resulting executable to be covered by the GNU General Public License.
 * Your use of that executable is in no way restricted on account of
 * linking the ooHG library code into it.
 *
 * This exception does not however invalidate any other reasons why
 * the executable file might be covered by the GNU General Public License.
 *
 * This exception applies only to the code released by the ooHG
 * Project under the name ooHG. If you copy code from other
 * ooHG Project or Free Software Foundation releases into a copy of
 * ooHG, as the General Public License permits, the exception does
 * not apply to the code that you add in this way. To avoid misleading
 * anyone as to the status of such modified files, you must delete
 * this exception notice from them.
 *
 * If you write modifications of your own for ooHG, it is your choice
 * whether to permit this exception to apply to your modifications.
 * If you do not wish that, delete this exception notice.
 */


#include "oohg.ch"
#include "hbclass.ch"

#define NDX_OOHG_ACTIVECONTROLINFO     01
#define NDX_OOHG_ACTIVEFRAME           02
#define NDX_OOHG_ADJUSTFONT            03
#define NDX_OOHG_ADJUSTWIDTH           04
#define NDX_OOHG_AUTOADJUST            05
#define NDX_OOHG_DEFAULTFONTCOLOR      06
#define NDX_OOHG_DEFAULTFONTNAME       07
#define NDX_OOHG_DEFAULTFONTSIZE       08
#define NDX_OOHG_DIALOGCANCELLED       09
#define NDX_OOHG_EXTENDEDNAVIGATION    10
#define NDX_OOHG_MAIN                  11
#define NDX_OOHG_SAMEENTERDBLCLICK     12
#define NDX_OOHG_TEMPWINDOWNAME        13
#define NDX_OOHG_THISCONTROL           14
#define NDX_OOHG_THISEVENTTYPE         15
#define NDX_OOHG_THISFORM              16
#define NDX_OOHG_THISITEMCELLCOL       17
#define NDX_OOHG_THISITEMCELLHEIGHT    18
#define NDX_OOHG_THISITEMCELLROW       19
#define NDX_OOHG_THISITEMCELLVALUE     20
#define NDX_OOHG_THISITEMCELLWIDTH     21
#define NDX_OOHG_THISITEMCOLINDEX      22
#define NDX_OOHG_THISITEMROWINDEX      23
#define NDX_OOHG_THISOBJECT            24
#define NDX_OOHG_THISQUERYCOLINDEX     25
#define NDX_OOHG_THISQUERYDATA         26
#define NDX_OOHG_THISQUERYROWINDEX     27
#define NDX_OOHG_THISTYPE              28
#define NDX_OOHG_MAIN_ICON             29
#define NDX_OOHG_MULTIPLEINSTANCES     30
#define NDX_OOHG_APP_CARGO             31
#define NUMBER_OF_APP_WIDE_VARS        31

CLASS TApplication

   CLASSDATA oAppObj              INIT NIL HIDDEN
   CLASSDATA hClsMtx              INIT NIL HIDDEN

   DATA aVars                     INIT NIL HIDDEN
   DATA ArgC                      INIT NIL READONLY
   DATA Args                      INIT NIL READONLY
   DATA Drive                     INIT NIL READONLY
   DATA ExeName                   INIT NIL READONLY
   DATA AppMutex                  INIT NIL HIDDEN
   DATA FileName                  INIT NIL READONLY
   DATA Path                      INIT NIL READONLY

   METHOD Define

   METHOD BackColor               SETGET
   METHOD Col                     SETGET
   METHOD Cursor                  SETGET
   METHOD Height                  SETGET
   METHOD HelpButton              SETGET
   METHOD hWnd
   METHOD MultipleInstances       SETGET
   METHOD MainClientHeight        SETGET
   METHOD MainClientWidth         SETGET
   METHOD MainName
   METHOD MainObject
   METHOD MainStyle               SETGET
   METHOD Row                     SETGET
   METHOD Title                   SETGET
   METHOD TopMost                 SETGET
   METHOD Value_Pos01             SETGET
   METHOD Value_Pos02             SETGET
   METHOD Value_Pos03             SETGET
   METHOD Value_Pos04             SETGET
   METHOD Value_Pos05             SETGET
   METHOD Value_Pos06             SETGET
   METHOD Value_Pos07             SETGET
   METHOD Value_Pos08             SETGET
   METHOD Value_Pos09             SETGET
   METHOD Value_Pos10             SETGET
   METHOD Value_Pos11             SETGET
   METHOD Value_Pos12             SETGET
   METHOD Value_Pos13             SETGET
   METHOD Value_Pos14             SETGET
   METHOD Value_Pos15             SETGET
   METHOD Value_Pos16             SETGET
   METHOD Value_Pos17             SETGET
   METHOD Value_Pos18             SETGET
   METHOD Value_Pos19             SETGET
   METHOD Value_Pos20             SETGET
   METHOD Value_Pos21             SETGET
   METHOD Value_Pos22             SETGET
   METHOD Value_Pos23             SETGET
   METHOD Value_Pos24             SETGET
   METHOD Value_Pos25             SETGET
   METHOD Value_Pos26             SETGET
   METHOD Value_Pos27             SETGET
   METHOD Value_Pos28             SETGET
   METHOD Value_Pos29             SETGET
   METHOD Value_Pos30             SETGET
   METHOD Value_Pos31             SETGET
   METHOD Width                   SETGET

   MESSAGE Cargo                  METHOD Value_Pos31
   MESSAGE FormObject             METHOD MainObject
   MESSAGE Handle                 METHOD hWnd
   MESSAGE Icon                   METHOD Value_Pos29

   ENDCLASS

METHOD Define() CLASS TApplication

   IF ::oAppObj == NIL
      ::aVars := Array( NUMBER_OF_APP_WIDE_VARS )

      ::aVars[ NDX_OOHG_ACTIVECONTROLINFO ]  := {}
      ::aVars[ NDX_OOHG_ACTIVEFRAME ]        := {}
      ::aVars[ NDX_OOHG_ADJUSTFONT ]         := .T.
      ::aVars[ NDX_OOHG_ADJUSTWIDTH ]        := .T.
      ::aVars[ NDX_OOHG_AUTOADJUST ]         := .F.
      ::aVars[ NDX_OOHG_DEFAULTFONTCOLOR ]   := NIL
      ::aVars[ NDX_OOHG_DEFAULTFONTNAME ]    := 'Arial'
      ::aVars[ NDX_OOHG_DEFAULTFONTSIZE ]    := 9
      ::aVars[ NDX_OOHG_DIALOGCANCELLED ]    := .F.
      ::aVars[ NDX_OOHG_EXTENDEDNAVIGATION ] := .F.
      ::aVars[ NDX_OOHG_MAIN ]               := NIL
      ::aVars[ NDX_OOHG_SAMEENTERDBLCLICK ]  := .F.
      ::aVars[ NDX_OOHG_TEMPWINDOWNAME ]     := ""
      ::aVars[ NDX_OOHG_THISCONTROL ]        := NIL
      ::aVars[ NDX_OOHG_THISEVENTTYPE ]      := ''
      ::aVars[ NDX_OOHG_THISFORM ]           := NIL
      ::aVars[ NDX_OOHG_THISITEMCELLCOL ]    := 0
      ::aVars[ NDX_OOHG_THISITEMCELLHEIGHT ] := 0
      ::aVars[ NDX_OOHG_THISITEMCELLROW ]    := 0
      ::aVars[ NDX_OOHG_THISITEMCELLVALUE ]  := NIL
      ::aVars[ NDX_OOHG_THISITEMCELLWIDTH ]  := 0
      ::aVars[ NDX_OOHG_THISITEMCOLINDEX ]   := 0
      ::aVars[ NDX_OOHG_THISITEMROWINDEX ]   := 0
      ::aVars[ NDX_OOHG_THISOBJECT ]         := ''
      ::aVars[ NDX_OOHG_THISQUERYCOLINDEX ]  := 0
      ::aVars[ NDX_OOHG_THISQUERYDATA ]      := ""
      ::aVars[ NDX_OOHG_THISQUERYROWINDEX ]  := 0
      ::aVars[ NDX_OOHG_THISTYPE ]           := ''
      ::aVars[ NDX_OOHG_MAIN_ICON ]          := NIL
      ::aVars[ NDX_OOHG_MULTIPLEINSTANCES ]  := .T.

      ::ArgC     := HB_ArgC()
      ::Args     := GetCommandLineArgs()
      ::ExeName  := GetProgramFileName()
      ::Drive    := Left( ::ExeName, 1 )
      ::Path     := Left( ::ExeName, RAt( '\', ::ExeName ) - 1 )
      ::FileName := Substr( ::ExeName, RAt( '\', ::ExeName ) + 1 )

      ::hClsMtx := hb_mutexCreate()
      ::oAppObj := Self
   ENDIF

   RETURN ( ::oAppObj )

METHOD BackColor( uColor ) CLASS TApplication

   LOCAL oMain, uRet := NIL

   hb_mutexLock( ::hClsMtx )
   IF PCount() > 0
      oMain := ::aVars[ NDX_OOHG_MAIN ]
      IF HB_IsObject( oMain )
         uRet := oMain:BackColor( uColor )
      ENDIF
   ELSE
      oMain := ::aVars[ NDX_OOHG_MAIN ]
      IF HB_IsObject( oMain )
         uRet := oMain:BackColor()
      ENDIF
   ENDIF
   hb_mutexUnlock( ::hClsMtx )

   RETURN ( uRet )

METHOD Col( nCol ) CLASS TApplication

   LOCAL oMain, uRet := NIL

   hb_mutexLock( ::hClsMtx )
   If PCount() > 0
      oMain := ::aVars[ NDX_OOHG_MAIN ]
      If HB_IsObject( oMain )
         uRet := oMain:Col( nCol )
      ENDIF
   ELSE
      oMain := ::aVars[ NDX_OOHG_MAIN ]
      If HB_IsObject( oMain )
         uRet := oMain:Col()
      ENDIF
   ENDIF
   hb_mutexUnlock( ::hClsMtx )

   RETURN ( uRet )

METHOD Cursor( uValue ) CLASS TApplication

   LOCAL oMain, uRet := NIL

   hb_mutexLock( ::hClsMtx )
   IF PCount() > 0
      oMain := ::aVars[ NDX_OOHG_MAIN ]
      IF HB_IsObject( oMain )
         uRet := oMain:Cursor( uValue )
      ENDIF
   ELSE
      oMain := ::aVars[ NDX_OOHG_MAIN ]
      IF HB_IsObject( oMain )
         uRet := oMain:Cursor()
      ENDIF
   ENDIF
   hb_mutexUnlock( ::hClsMtx )

   RETURN ( uRet )

METHOD hWnd CLASS TApplication

   LOCAL oMain, uRet := NIL

   hb_mutexLock( ::hClsMtx )
   oMain := ::aVars[ NDX_OOHG_MAIN ]
   IF HB_IsObject( oMain )
      uRet := oMain:hWnd
   ENDIF
   hb_mutexUnlock( ::hClsMtx )

   RETURN ( uRet )

METHOD MainClientHeight( nHeight ) CLASS TApplication

   LOCAL oMain, uRet := NIL

   hb_mutexLock( ::hClsMtx )
   IF PCount() > 0
      oMain := ::aVars[ NDX_OOHG_MAIN ]
      IF HB_IsObject( oMain )
         uRet := oMain:ClientHeight( nHeight )
      ENDIF
   ELSE
      oMain := ::aVars[ NDX_OOHG_MAIN ]
      IF HB_IsObject( oMain )
         uRet := oMain:ClientHeight()
      ENDIF
   ENDIF
   hb_mutexUnlock( ::hClsMtx )

   RETURN ( uRet )

METHOD MainClientWidth( nHeight ) CLASS TApplication

   LOCAL oMain, uRet := NIL

   hb_mutexLock( ::hClsMtx )
   IF PCount() > 0
      oMain := ::aVars[ NDX_OOHG_MAIN ]
      IF HB_IsObject( oMain )
         uRet := oMain:ClientWidth( nHeight )
      ENDIF
   ELSE
      oMain := ::aVars[ NDX_OOHG_MAIN ]
      IF HB_IsObject( oMain )
         uRet := oMain:ClientWidth()
      ENDIF
   ENDIF
   hb_mutexUnlock( ::hClsMtx )

   RETURN ( uRet )

METHOD MainName CLASS TApplication

   LOCAL oMain, uRet := NIL

   hb_mutexLock( ::hClsMtx )
   oMain := ::aVars[ NDX_OOHG_MAIN ]
   IF HB_IsObject( oMain )
      uRet := oMain:Name
   ENDIF
   hb_mutexUnlock( ::hClsMtx )

   RETURN ( uRet )

METHOD MainObject CLASS TApplication

   LOCAL uRet

   hb_mutexLock( ::hClsMtx )
   uRet := ::aVars[ NDX_OOHG_MAIN ]
   hb_mutexUnlock( ::hClsMtx )

   RETURN ( uRet )

METHOD MainStyle( nStyle ) CLASS TApplication

   LOCAL oMain, uRet := NIL

   hb_mutexLock( ::hClsMtx )
   IF PCount() > 0
      oMain := ::aVars[ NDX_OOHG_MAIN ]
      IF HB_IsObject( oMain )
         uRet := oMain:Style( nStyle )
      ENDIF
   ELSE
      oMain := ::aVars[ NDX_OOHG_MAIN ]
      IF HB_IsObject( oMain )
         uRet := oMain:Style()
      ENDIF
   ENDIF
   hb_mutexUnlock( ::hClsMtx )

   RETURN ( uRet )

METHOD Height( nHeight ) CLASS TApplication

   LOCAL oMain, uRet := NIL

   hb_mutexLock( ::hClsMtx )
   IF PCount() > 0
      oMain := ::aVars[ NDX_OOHG_MAIN ]
      IF HB_IsObject( oMain )
         uRet := oMain:Height( nHeight )
      ENDIF
   ELSE
      oMain := ::aVars[ NDX_OOHG_MAIN ]
      IF HB_IsObject( oMain )
         uRet := oMain:Height()
      ENDIF
   ENDIF
   hb_mutexUnlock( ::hClsMtx )

   RETURN ( uRet )


METHOD HelpButton( lShow ) CLASS TApplication

   LOCAL oMain, uRet := NIL

   hb_mutexLock( ::hClsMtx )
   IF PCount() > 0
      oMain := ::aVars[ NDX_OOHG_MAIN ]
      IF HB_IsObject( oMain )
         uRet := oMain:HelpButton( lShow )
      ENDIF
   ELSE
      oMain := ::aVars[ NDX_OOHG_MAIN ]
      IF HB_IsObject( oMain )
         uRet := oMain:HelpButton()
      ENDIF
   ENDIF
   hb_mutexUnlock( ::hClsMtx )

   RETURN ( uRet )

METHOD MultipleInstances( lMultiple, lWarning ) CLASS TApplication

   LOCAL lBefore, lRet

   hb_mutexLock( ::hClsMtx )
   IF lMultiple == NIL
      lRet := ::aVars[ NDX_OOHG_MULTIPLEINSTANCES ]
   ELSE
      lBefore := ::aVars[ NDX_OOHG_MULTIPLEINSTANCES ]

      IF HB_IsLogical( lMultiple )
         ::aVars[ NDX_OOHG_MULTIPLEINSTANCES ] := lMultiple
      ELSEIf HB_IsNumeric( lMultiple )
         ::aVars[ NDX_OOHG_MULTIPLEINSTANCES ] := ( lMultiple != 0 )
      ELSEIf VALTYPE( lMultiple ) $ "CM"
         IF UPPER( ALLTRIM( lMultiple ) ) == "ON"
            ::aVars[ NDX_OOHG_MULTIPLEINSTANCES ] := .T.
         ELSEIf UPPER( ALLTRIM( lMultiple ) ) == "OFF"
            ::aVars[ NDX_OOHG_MULTIPLEINSTANCES ] := .F.
         ENDIF
      ENDIF

      lRet := ::aVars[ NDX_OOHG_MULTIPLEINSTANCES ]
      IF lRet # lBefore
         IF lRet
            CloseHandle( ::AppMutex )
            ::AppMutex := NIL
         ELSE
            ::AppMutex := CreateMutex( , .T., STRTRAN( GetModuleFileName(), '\', '_' ) )
            IF EMPTY( ::AppMutex ) .OR. _OOHG_GetLastError() > 0
               IF HB_IsLogical( lWarning ) .AND. lWarning
                  MsgStop( _OOHG_Messages( 1, 4 ) )
               ENDIF
               ExitProcess(0)
            ENDIF
         ENDIF
      ENDIF
   ENDIF
   hb_mutexUnlock( ::hClsMtx )

   RETURN ( lRet )

METHOD Row( nRow ) CLASS TApplication

   LOCAL oMain, uRet := NIL

   hb_mutexLock( ::hClsMtx )
   IF PCount() > 0
      oMain := ::aVars[ NDX_OOHG_MAIN ]
      IF HB_IsObject( oMain )
         uRet := oMain:Row( nRow )
      ENDIF
   ELSE
      oMain := ::aVars[ NDX_OOHG_MAIN ]
      IF HB_IsObject( oMain )
         uRet := oMain:Row()
      ENDIF
   ENDIF
   hb_mutexUnlock( ::hClsMtx )

   RETURN ( uRet )

METHOD Title( cTitle ) CLASS TApplication

   LOCAL oMain, uRet := NIL

   hb_mutexLock( ::hClsMtx )
   IF PCount() > 0
      oMain := ::aVars[ NDX_OOHG_MAIN ]
      IF HB_IsObject( oMain )
         uRet := oMain:Title( cTitle )
      ENDIF
   ELSE
      oMain := ::aVars[ NDX_OOHG_MAIN ]
      IF HB_IsObject( oMain )
         uRet := oMain:Title()
      ENDIF
   ENDIF
   hb_mutexUnlock( ::hClsMtx )

   RETURN ( uRet )

METHOD TopMost( lTopmost ) CLASS TApplication

   LOCAL oMain, uRet := NIL

   hb_mutexLock( ::hClsMtx )
   IF PCount() > 0
      oMain := ::aVars[ NDX_OOHG_MAIN ]
      IF HB_IsObject( oMain )
         uRet := oMain:TopMost( lTopmost )
      ENDIF
   ELSE
      oMain := ::aVars[ NDX_OOHG_MAIN ]
      IF HB_IsObject( oMain )
         uRet := oMain:TopMost()
      ENDIF
   ENDIF
   hb_mutexUnlock( ::hClsMtx )

   RETURN ( uRet )

METHOD Value_Pos01( uValue ) CLASS TApplication

   LOCAL uRet

   hb_mutexLock( ::hClsMtx )
   IF uValue != NIL
      ::aVars[ NDX_OOHG_ACTIVECONTROLINFO ] := uValue
   ENDIF
   uRet := ::aVars[ NDX_OOHG_ACTIVECONTROLINFO ]
   hb_mutexUnlock( ::hClsMtx )

   RETURN ( uRet )

METHOD Value_Pos02( uValue ) CLASS TApplication

   LOCAL uRet

   hb_mutexLock( ::hClsMtx )
   IF uValue != NIL
      ::aVars[ NDX_OOHG_ACTIVEFRAME ] := uValue
   ENDIF
   uRet := ::aVars[ NDX_OOHG_ACTIVEFRAME ]
   hb_mutexUnlock( ::hClsMtx )

   RETURN ( uRet )

METHOD Value_Pos03( uValue ) CLASS TApplication

   LOCAL uRet

   hb_mutexLock( ::hClsMtx )
   IF uValue != NIL
      ::aVars[ NDX_OOHG_ADJUSTFONT ] := uValue
   ENDIF
   uRet := ::aVars[ NDX_OOHG_ADJUSTFONT ]
   hb_mutexUnlock( ::hClsMtx )

   RETURN ( uRet )

METHOD Value_Pos04( uValue ) CLASS TApplication

   LOCAL uRet

   hb_mutexLock( ::hClsMtx )
   IF uValue != NIL
      ::aVars[ NDX_OOHG_ADJUSTWIDTH ] := uValue
   ENDIF
   uRet := ::aVars[ NDX_OOHG_ADJUSTWIDTH ]
   hb_mutexUnlock( ::hClsMtx )

   RETURN ( uRet )

METHOD Value_Pos05( uValue ) CLASS TApplication

   LOCAL uRet

   hb_mutexLock( ::hClsMtx )
   IF uValue != NIL
      ::aVars[ NDX_OOHG_AUTOADJUST ] := uValue
   ENDIF
   uRet := ::aVars[ NDX_OOHG_AUTOADJUST ]
   hb_mutexUnlock( ::hClsMtx )

   RETURN ( uRet )

METHOD Value_Pos06( uValue ) CLASS TApplication

   LOCAL uRet

   hb_mutexLock( ::hClsMtx )
   IF uValue != NIL
      ::aVars[ NDX_OOHG_DEFAULTFONTCOLOR ] := uValue
   ENDIF
   uRet := ::aVars[ NDX_OOHG_DEFAULTFONTCOLOR ]
   hb_mutexUnlock( ::hClsMtx )

   RETURN ( uRet )

METHOD Value_Pos07( uValue ) CLASS TApplication

   LOCAL uRet

   hb_mutexLock( ::hClsMtx )
   IF uValue != NIL
      ::aVars[ NDX_OOHG_DEFAULTFONTNAME ] := uValue
   ENDIF
   uRet := ::aVars[ NDX_OOHG_DEFAULTFONTNAME ]
   hb_mutexUnlock( ::hClsMtx )

   RETURN ( uRet )

METHOD Value_Pos08( uValue ) CLASS TApplication

   LOCAL uRet

   hb_mutexLock( ::hClsMtx )
   IF uValue != NIL
      ::aVars[ NDX_OOHG_DEFAULTFONTSIZE ] := uValue
   ENDIF
   uRet := ::aVars[ NDX_OOHG_DEFAULTFONTSIZE ]
   hb_mutexUnlock( ::hClsMtx )

   RETURN ( uRet )

METHOD Value_Pos09( uValue ) CLASS TApplication

   LOCAL uRet

   hb_mutexLock( ::hClsMtx )
   IF uValue != NIL
      ::aVars[ NDX_OOHG_DIALOGCANCELLED ] := uValue
   ENDIF
   uRet := ::aVars[ NDX_OOHG_DIALOGCANCELLED ]
   hb_mutexUnlock( ::hClsMtx )

   RETURN ( uRet )

METHOD Value_Pos10( uValue ) CLASS TApplication

   LOCAL uRet

   hb_mutexLock( ::hClsMtx )
   IF uValue != NIL
      ::aVars[ NDX_OOHG_EXTENDEDNAVIGATION ] := uValue
   ENDIF
   uRet := ::aVars[ NDX_OOHG_EXTENDEDNAVIGATION ]
   hb_mutexUnlock( ::hClsMtx )

   RETURN ( uRet )


METHOD Value_Pos11( uValue ) CLASS TApplication

   LOCAL uRet

   hb_mutexLock( ::hClsMtx )
   IF uValue != NIL
      ::aVars[ NDX_OOHG_MAIN ] := uValue
   ENDIF
   uRet := ::aVars[ NDX_OOHG_MAIN ]
   hb_mutexUnlock( ::hClsMtx )

   RETURN ( uRet )

METHOD Value_Pos12( uValue ) CLASS TApplication

   LOCAL uRet

   hb_mutexLock( ::hClsMtx )
   IF uValue != NIL
      ::aVars[ NDX_OOHG_SAMEENTERDBLCLICK ] := uValue
   ENDIF
   uRet := ::aVars[ NDX_OOHG_SAMEENTERDBLCLICK ]
   hb_mutexUnlock( ::hClsMtx )

   RETURN ( uRet )

METHOD Value_Pos13( uValue ) CLASS TApplication

   LOCAL uRet

   hb_mutexLock( ::hClsMtx )
   IF uValue != NIL
      ::aVars[ NDX_OOHG_TEMPWINDOWNAME ] := uValue
   ENDIF
   uRet := ::aVars[ NDX_OOHG_TEMPWINDOWNAME ]
   hb_mutexUnlock( ::hClsMtx )

   RETURN ( uRet )

METHOD Value_Pos14( uValue ) CLASS TApplication

   LOCAL uRet

   hb_mutexLock( ::hClsMtx )
   IF uValue != NIL
      ::aVars[ NDX_OOHG_THISCONTROL ] := uValue
   ENDIF
   uRet := ::aVars[ NDX_OOHG_THISCONTROL ]
   hb_mutexUnlock( ::hClsMtx )

   RETURN ( uRet )

METHOD Value_Pos15( uValue ) CLASS TApplication

   LOCAL uRet

   hb_mutexLock( ::hClsMtx )
   IF uValue != NIL
      ::aVars[ NDX_OOHG_THISEVENTTYPE ] := uValue
   ENDIF
   uRet := ::aVars[ NDX_OOHG_THISEVENTTYPE ]
   hb_mutexUnlock( ::hClsMtx )

   RETURN ( uRet )

METHOD Value_Pos16( uValue ) CLASS TApplication

   LOCAL uRet

   hb_mutexLock( ::hClsMtx )
   IF uValue != NIL
      ::aVars[ NDX_OOHG_THISFORM ] := uValue
   ENDIF
   uRet := ::aVars[ NDX_OOHG_THISFORM ]
   hb_mutexUnlock( ::hClsMtx )

   RETURN ( uRet )

METHOD Value_Pos17( uValue ) CLASS TApplication

   LOCAL uRet

   hb_mutexLock( ::hClsMtx )
   IF uValue != NIL
      ::aVars[ NDX_OOHG_THISITEMCELLCOL ] := uValue
   ENDIF
   uRet := ::aVars[ NDX_OOHG_THISITEMCELLCOL ]
   hb_mutexUnlock( ::hClsMtx )

   RETURN ( uRet )

METHOD Value_Pos18( uValue ) CLASS TApplication

   LOCAL uRet

   hb_mutexLock( ::hClsMtx )
   IF uValue != NIL
      ::aVars[ NDX_OOHG_THISITEMCELLHEIGHT ] := uValue
   ENDIF
   uRet := ::aVars[ NDX_OOHG_THISITEMCELLHEIGHT ]
   hb_mutexUnlock( ::hClsMtx )

   RETURN ( uRet )

METHOD Value_Pos19( uValue ) CLASS TApplication

   LOCAL uRet

   hb_mutexLock( ::hClsMtx )
   IF uValue != NIL
      ::aVars[ NDX_OOHG_THISITEMCELLROW ] := uValue
   ENDIF
   uRet := ::aVars[ NDX_OOHG_THISITEMCELLROW ]
   hb_mutexUnlock( ::hClsMtx )

   RETURN ( uRet )

METHOD Value_Pos20( uValue ) CLASS TApplication

   LOCAL uRet

   hb_mutexLock( ::hClsMtx )
   IF uValue != NIL
      ::aVars[ NDX_OOHG_THISITEMCELLVALUE ] := uValue
   ENDIF
   uRet := ::aVars[ NDX_OOHG_THISITEMCELLVALUE ]
   hb_mutexUnlock( ::hClsMtx )

   RETURN ( uRet )

METHOD Value_Pos21( uValue ) CLASS TApplication

   LOCAL uRet

   hb_mutexLock( ::hClsMtx )
   IF uValue != NIL
      ::aVars[ NDX_OOHG_THISITEMCELLWIDTH ] := uValue
   ENDIF
   uRet := ::aVars[ NDX_OOHG_THISITEMCELLWIDTH ]
   hb_mutexUnlock( ::hClsMtx )

   RETURN ( uRet )

METHOD Value_Pos22( uValue ) CLASS TApplication

   LOCAL uRet

   hb_mutexLock( ::hClsMtx )
   IF uValue != NIL
      ::aVars[ NDX_OOHG_THISITEMCOLINDEX ] := uValue
   ENDIF
   uRet := ::aVars[ NDX_OOHG_THISITEMCOLINDEX ]
   hb_mutexUnlock( ::hClsMtx )

   RETURN ( uRet )

METHOD Value_Pos23( uValue ) CLASS TApplication

   LOCAL uRet

   hb_mutexLock( ::hClsMtx )
   IF uValue != NIL
      ::aVars[ NDX_OOHG_THISITEMROWINDEX ] := uValue
   ENDIF
   uRet := ::aVars[ NDX_OOHG_THISITEMROWINDEX ]
   hb_mutexUnlock( ::hClsMtx )

   RETURN ( uRet )

METHOD Value_Pos24( uValue ) CLASS TApplication

   LOCAL uRet

   hb_mutexLock( ::hClsMtx )
   IF uValue != NIL
      ::aVars[ NDX_OOHG_THISOBJECT ] := uValue
   ENDIF
   uRet := ::aVars[ NDX_OOHG_THISOBJECT ]
   hb_mutexUnlock( ::hClsMtx )

   RETURN ( uRet )

METHOD Value_Pos25( uValue ) CLASS TApplication

   LOCAL uRet

   hb_mutexLock( ::hClsMtx )
   IF uValue != NIL
      ::aVars[ NDX_OOHG_THISQUERYCOLINDEX ] := uValue
   ENDIF
   uRet := ::aVars[ NDX_OOHG_THISQUERYCOLINDEX ]
   hb_mutexUnlock( ::hClsMtx )

   RETURN ( uRet )

METHOD Value_Pos26( uValue ) CLASS TApplication

   LOCAL uRet

   hb_mutexLock( ::hClsMtx )
   IF uValue != NIL
      ::aVars[ NDX_OOHG_THISQUERYDATA ] := uValue
   ENDIF
   uRet := ::aVars[ NDX_OOHG_THISQUERYDATA ]
   hb_mutexUnlock( ::hClsMtx )

   RETURN ( uRet )

METHOD Value_Pos27( uValue ) CLASS TApplication

   LOCAL uRet

   hb_mutexLock( ::hClsMtx )
   IF uValue != NIL
      ::aVars[ NDX_OOHG_THISQUERYROWINDEX ] := uValue
   ENDIF
   uRet := ::aVars[ NDX_OOHG_THISQUERYROWINDEX ]
   hb_mutexUnlock( ::hClsMtx )

   RETURN ( uRet )

METHOD Value_Pos28( uValue ) CLASS TApplication

   LOCAL uRet

   hb_mutexLock( ::hClsMtx )
   IF uValue != NIL
      ::aVars[ NDX_OOHG_THISTYPE ] := uValue
   ENDIF
   uRet := ::aVars[ NDX_OOHG_THISTYPE ]
   hb_mutexUnlock( ::hClsMtx )

   RETURN ( uRet )

METHOD Value_Pos29( uValue ) CLASS TApplication

   LOCAL uRet

   hb_mutexLock( ::hClsMtx )
   IF uValue != NIL
      ::aVars[ NDX_OOHG_MAIN_ICON ] := uValue
   ENDIF
   uRet := ::aVars[ NDX_OOHG_MAIN_ICON ]
   hb_mutexUnlock( ::hClsMtx )

   RETURN ( uRet )

METHOD Value_Pos30( uValue ) CLASS TApplication

   LOCAL uRet

   hb_mutexLock( ::hClsMtx )
   IF uValue != NIL
      ::MultipleInstances( uValue, .F. )
   ENDIF
   uRet := ::aVars[ NDX_OOHG_MULTIPLEINSTANCES ]
   hb_mutexUnlock( ::hClsMtx )

   RETURN ( uRet )

METHOD Value_Pos31( uValue ) CLASS TApplication

   LOCAL uRet

   hb_mutexLock( ::hClsMtx )
   IF uValue != NIL
      ::aVars[ NDX_OOHG_APP_CARGO ] := uValue
   ENDIF
   uRet := ::aVars[ NDX_OOHG_APP_CARGO ]
   hb_mutexUnlock( ::hClsMtx )

   RETURN ( uRet )

METHOD Width( nWidth ) CLASS TApplication

   LOCAL oMain, uRet := NIL

   hb_mutexLock( ::hClsMtx )
   IF PCount() > 0
      oMain := ::aVars[ NDX_OOHG_MAIN ]
      IF HB_IsObject( oMain )
         uRet := oMain:Width( nWidth )
      ENDIF
   ELSE
      oMain := ::aVars[ NDX_OOHG_MAIN ]
      IF HB_IsObject( oMain )
         uRet := oMain:Width()
      ENDIF
   ENDIF
   hb_mutexUnlock( ::hClsMtx )

   RETURN ( uRet )

STATIC FUNCTION GetCommandLineArgs

   LOCAL i, nCount, aArgs

   nCount := HB_ArgC()
   aArgs := {}
   FOR i := 1 To nCount
      aAdd( aArgs, HB_ArgV( i ) )
   NEXT i

   RETURN ( aArgs )
