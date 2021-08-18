
# example code : launch teraterm
#$EXE_PATH = "C:\Program Files (x86)\teraterm\ttermpro.exe"
#$USER = "username"
#$PASS = "password"

# command line args
$VM_NAME = $Args[0]

function GetVMIPAddress() {
  $vmnw = GetVMNetworkAdapter
  return $vmnw.IPAddresses[0]
}

function GetVMNetworkAdapter() {
  return Get-VMNetworkAdapter -VMName $VM_NAME
}

function StartProcess() {
  $argumentList = $Args[0]
  Start-Process -FilePath $EXE_PATH -ArgumentList $argumentList
}

function main() {

  # get vm ip
  $ip = GetVMIPAddress
  echo "$VM_NAME : $ip"

  # example code : launch teraterm
  #$argumentList = "$ip /auth=password /user=$USER /passwd=$PASS"
  #StartProcess $argumentList
}

main
