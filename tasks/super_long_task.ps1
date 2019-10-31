[CmdletBinding()]
  Param(
    [Parameter(Mandatory = $False)]
      [Integer]
        $length
)

if ($length -eq $null -or $length -eq "") { 
    $length=1800
}

echo "Sleeping for ${length} seconds."
sleep $length
echo "Done sleeping, task complete."