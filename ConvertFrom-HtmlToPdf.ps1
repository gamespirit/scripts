<# georg aminger 15.11.2016
This is a script which is using wkhtmltopdf.
It converts all html files in a folder and add a pdf file.
html to pdf powershell
I used http://wkhtmltopdf.org/

#>
$InputLocation = "C:\temp"

$tool = 'C:\Program Files\wkhtmltopdf\bin\wkhtmltopdf.exe'
$htmls = get-childitem  -filter *.html -path $InputLocation -Recurse

foreach($html in $htmls)
{
    $filename = $html.FullName
    $pdf = $html.FullName.split('.')[0] + '.pdf'
	& $tool @("-q","-s","A4","-O","Landscape",$filename,$pdf)
}