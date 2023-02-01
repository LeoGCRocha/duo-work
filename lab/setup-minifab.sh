# Pass this script to the minifab command to execute the steps
curl -o minifab -sL https://tinyurl.com/yxa2q6yr 
chmod +x minifab
sudo mv minifab /usr/local/bin
git clone https://github.com/ct-blockchain/minifabric
cd minifabric
docker build -t hyperledgerlabs/minifab:latest .
cd ../