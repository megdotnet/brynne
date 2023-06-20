
$file = get-content -path .\data.html
$output = ".\output.txt"

new-item -Path $output -ItemType File

$file | ForEach-Object {
    $data = $_
    $regex = [regex]::new("(?:\d+\.?)+")
    $match = $regex.Match($data)
    $number = $match.Value
    if ($number.Trim() -ne "") { 
        Add-Content -Path $output -Value $number
    }   
}


