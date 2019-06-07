#Site Collection Level
Add-PSSnapin microsoft.sharepoint.powershell -ea 0

$url = https://portal.contoso.com
$webapp = Get-SPWebApplication $url

foreach($site in $webapp.Sites)
{
    Write-Host $site

    #Disable modern Lists and libraries at the Site Collection Level
    $featureguid = new-object System.Guid "E3540C7D-6BEA-403C-A224-1A12EAFEE4C4"
    $site.Features.Add($featureguid, $true)

    #Re-enable the modern experience at the site collection Level.
    #$featureguid = new-object System.Guid "E3540C7D-6BEA-403C-A224-1A12EAFEE4C4"
    #$site.Features.Remove($featureguid, $true)
}