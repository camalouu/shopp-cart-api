$body = @{
  items =
  @{
    count = 2;
    product = @{
      title = "Lenovo thinkpad";
      price = 388;
      description = "good laptop";
      id = "4c9aeb24-e298-4807-b7e4-578f504c7276";
    }
  },
  @{
    count = 2;
    product = @{
      title = "asus";
      price = 888;
      description = "nice screen";
      id = "4c9aeb24-e298-4807-b7e4-578f504c7276";
    }
  } 
} | ConvertTo-Json -Depth 10

$url = 'http://localhost:4000/api/profile/cart'

$headers = @{
  "Content-type" = "application/json";
}

$response = Invoke-RestMethod -Uri $url -Method Put -Body $body -Headers $headers

Write-Host $response 

# $creds = "camalouu:TEST_PASSWORD"
# $token = [Convert]::ToBase64String([System.Text.Encoding]::UTF8.GetBytes($creds))
# $headers = @{
#   'Authorization' = 'Basic ' + $token
# }
