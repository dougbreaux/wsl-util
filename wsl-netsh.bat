@echo off
:: https://github.com/rancher-sandbox/rancher-desktop/issues/893#issuecomment-995060278
:: https://github.com/rancher-sandbox/rancher-desktop/issues/893#issuecomment-1013611478
netsh interface IP show addresses "vEthernet (WSL)" | findstr "IP"
netsh interface portproxy reset

set ports=9080, 60000
for %%p in (%ports%) do (
	netsh interface portproxy add v4tov4 listenport=%%p listenaddress=%1 connectport=%%p connectaddress=localhost
)
netsh interface portproxy show all