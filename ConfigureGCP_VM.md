## SSH access
go to .ssh/ folder
touch config
content to put
Host dataZoomCamp2024vm
	Hostname EXTERNAL IP
	User USERNAME
	IdentityFile PRIVATE_KEY ABSOLUTE PATH

 connect and install conda

give permissions to run docker

sudo groupadd docker
sudo gpasswd -a $USER docker
	
