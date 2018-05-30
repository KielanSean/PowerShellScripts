###########################################################
# AUTHOR  : Kielan Sullivan
# CREATED : 05-30-2018 
# UPDATED :
# COMMENT : This script reads in a .csv file then updates
#			the active directory with the information
#			supplied.  [Note] Any field within the .csv
#			that is blank WILL update in the active 
#			directory as a blank field.
###########################################################

# Define the location of the .csv file
# For each record in the csv, search the active directory for the current user
# After the user is found, update the active directory with the information supplied

$365Users = Import-Csv #Path to CSV file

#  The script will currently update the State, Address, Office Phone, Employee's Title, Office Fax, Mobile Phone, Personal Phone, 
#  Postal Code, City, and Department.  
# [Note] Current .csv incremented all addresses.  You can set the street address to $_.StreetAddress if fixed.
# [Note] Office is not the office location but the office phone number.  
# [Note] Office Number is the direct number to reach the employee.


$365Users | ForEach-Object{Get-MsolUSer -UserPrincipalName $_.UserPrincipalName | Set-MsolUser -State $_.State
OrProvince -Office $_.Office -Title $_.Title -Fax $_.Fax -MobilePhone $_.MobilePhone -PhoneNumber $_.Phone -PostalCode $_.PostalCode -
StreetAddress "7500 W 160th Street" -City $_.City -Department $_.Department}          