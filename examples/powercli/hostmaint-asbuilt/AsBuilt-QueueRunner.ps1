Import-Module AWS.Tools.SQS

$QueueURL = "https://sqs.us-west-2.amazonaws.com/773198461984/vebaqueue"
$AccessKey = "xxx"
$SecretKey = "xxx"
$Region = "us-west-2"

$sqsMessage=Receive-SQSMessage -AttributeName SenderID -MessageAttributeName ServerName -MessageCount 1 -QueueUrl $QueueURL -AccessKey $AccessKey -SecretKey $SecretKey -Region $Region
if ($sqsMessage -ne $NULL) {
  $sqsMessage
  $sqsMessage.MessageAttributes 
  $serverName = $sqsMessage.MessageAttributes.ServerName.StringValue
  
  write-host "Server Name: "$serverName
  write-Host "Message ID: "$sqsMessage.MessageID
  write-host "Message Body: " $sqsMessage.Body
  if ($serverName -ne $NULL){
    Write-Host $sqsMessage.Body "for $serverName"
  }
  Remove-SQSMessage -QueueUrl $QueueURL -AccessKey $AccessKey -SecretKey $SecretKey -Region $Region -ReceiptHandle $sqsMessage.ReceiptHandle -confirm:$false
}
else {
  Write-Host "No messages found in queue"
}

