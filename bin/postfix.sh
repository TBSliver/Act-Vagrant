echo "postfix postfix/mailname string "`hostname`".local"     | sudo debconf-set-selections
echo "postfix postfix/main_mailer_type string 'Local only'"   | sudo debconf-set-selections

sudo apt-get -y install postfix mailutils
