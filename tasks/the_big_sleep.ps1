[CmdletBinding()]
Param(
  [Parameter(Mandatory = $False)]
  [ValidateRange(0,[int]::MaxValue)]
  [int] $length
)

if ($length -eq $null -or "${length}" -eq "") { 
    $length=1800
}

echo "Sleeping for ${length} seconds."
sleep $length
echo "Done sleeping, task complete."