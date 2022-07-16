#!/bin/sh
export $(grep -v '^#' .env | xargs)
echo ${MONGO_URI}

mongoexport --uri=${MONGO_URI} -o /home/budget-server/dumps/realAccount_`date '+%Y-%m-%d'`.txt -d budget -c realAccount --jsonArray
mongoexport --uri=${MONGO_URI} -o /home/budget-server/dumps/virtualAccount_`date '+%Y-%m-%d'`.txt -d budget -c virtualAccount --jsonArray
mongoexport --uri=${MONGO_URI} -o /home/budget-server/dumps/transaction_`date '+%Y-%m-%d'`.txt -d budget -c transaction --jsonArray
mongoexport --uri=${MONGO_URI} -o /home/budget-server/dumps/closingProcess_`date '+%Y-%m-%d'`.txt -d budget -c closingProcess --jsonArray
mongoexport --uri=${MONGO_URI} -o /home/budget-server/dumps/scannedTransaction_`date '+%Y-%m-%d'`.txt -d budget -c scannedTransaction --jsonArray
/home/budget-server/Dropbox-Uploader/dropbox_uploader.sh upload /home/budget-server/dumps/* /
rm /home/budget-server/dumps/*