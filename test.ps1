$body = @{
  id = "someid";
  name = "zafar";
  password = "pass"
} 

# $url = 'https://cy76pkiwg7.execute-api.us-east-1.amazonaws.com/dev/api/auth/login'

$creds = "camalouu:TEST_PASSWORD"

$token = [Convert]::ToBase64String([System.Text.Encoding]::UTF8.GetBytes($creds))

$headers = @{
  'Authorization' = 'Basic ' + $token
}

$url = 'http://localhost:3000/dev/api/profile'

$response = Invoke-RestMethod -Uri $url -Method Get -Headers $headers

Write-Host $response
