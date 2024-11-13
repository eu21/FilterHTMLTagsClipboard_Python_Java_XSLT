@echo off
cd /D %~dp0


REM cmd.exe /k cd c:\Users\Yauheni_Kuzniatsou\Desktop\WORKINPROGRESS\1.82\SCA-5418\SCA-5418-XSLT-MSXML-QXA-transformations\
rem cd c:\Users\Yauheni_Kuzniatsou\Desktop\WORKINPROGRESS\1.82\SCA-5418\SCA-5418-XSLT-MSXML-QXA-transformations\

REM set inputFile=input_Abamectin_AI_Profile_orig.xml
REM set openTransform=open_AI.xsl
REM set outputFile=output_Abamectin_AI_Profile_orig.xml

set inputFile=input.html
set transformation1=transformation.xsl
set outputFile1=output.html

rem transform.exe %inputFile% %openTransform% %outputFile% | (set /p cache= & set cache)

rem (msxsl.exe %inputFile% %openTransform% -o %outputFile% & echo.) >2 & (set /p cache=)<2
rem echo %cache%

rem transform.exe input_Abamectin_AI_Profile_orig.xml open_AI.xsl output_Abamectin_AI_Profile_orig.xml

cls
REM msxsl.exe -u '3.0' %inputFile% %transformation1% -o %outputFile1%
REM java -jar saxon-9.1.0.8.jar -s:input.html -xsl:transformation.xsl -o:output.html

::BEST Working
::make xhtml file that will comply with Saxon reqs
::java -jar tagsoup-1.2.1.jar --encoding=utf8 --html --method=html --output-encoding=utf8 --files input.html
java -jar tagsoup-1.2.1.jar --encoding=utf8 --html --method=html --nons --nobogons --nodefaults --omit-xml-declaration --output-encoding=utf8 --files input.html
::java -jar tagsoup-1.2.1.jar --encoding=utf8 --html --method=html --nons --nobogons --nodefaults --omit-xml-declaration --output-encoding=utf8 --files input.html

::java -jar tagsoup-1.2.1.jar --encoding=utf8 --output-encoding=utf8 --files input.html
::Run Saxon processor to do main logic
java -cp Saxon-HE-10.6.jar;tagsoup-1.2.1.jar net.sf.saxon.Transform -x:org.ccil.cowan.tagsoup.Parser -s:input.xhtml -xsl:transformation.xsl -o:output.html

rem pause>NULL

