###########################################################
# AUTHOR  : Kielan Sullivan
# CREATED : 05-30-2018 
# UPDATED :
# COMMENT : This script is used for a windows cron job (schtask)
#			When it i time to execute, read in a file containing 
#			my notes for he week and emails them to me.  
###########################################################



$date = Get-Date -DisplayHint Date
$file = "C:\Users\KielanSullivan\Desktop\Daily Log\DailyLog.txt"
$body = (Get-Content $file | out-string)

$Outlook = New-Object -ComObject Outlook.Application
$Mail = $Outlook.CreateItem(0)
$Mail.To = "kielansean@gmail.com"
$Mail.Subject = "Daily Log for week of $date"
$Mail.Body = $body
$Mail.Send()