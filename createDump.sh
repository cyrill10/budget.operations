 mysqldump  -h 0.0.0.0 -u root -pbudget-app budget > /home/budget-server/dumps/`date '+%Y-%m-%d'`.sql
/home/budget-server/Dropbox-Uploader/dropbox_uploader.sh upload /home/budget-server/dumps/`date '+%Y-%m-%d'`.sql /
rm /home/budget-server/dumps/`date '+%Y-%m-%d'`.sql
