#!/bin/sh
export $(grep -v '^#' .env | xargs)
echo${MONGO_URI_WITH_DATABASE}

mongoexport --uri=${MONGO_URI_WITH_DATABASE} -o /home/budget-server/dumps/realAccount_`date '+%Y-%m-%d'`.txt -c realAccount --jsonArray
mongoexport --uri=${MONGO_URI_WITH_DATABASE} -o /home/budget-server/dumps/virtualAccount_`date '+%Y-%m-%d'`.txt -c virtualAccount --jsonArray
mongoexport --uri=${MONGO_URI_WITH_DATABASE} -o /home/budget-server/dumps/transaction_`date '+%Y-%m-%d'`.txt -c transaction --jsonArray
mongoexport --uri=${MONGO_URI_WITH_DATABASE} -o /home/budget-server/dumps/closingProcess_`date '+%Y-%m-%d'`.txt -c closingProcess --jsonArray
mongoexport --uri=${MONGO_URI_WITH_DATABASE} -o /home/budget-server/dumps/scannedTransaction_`date '+%Y-%m-%d'`.txt -c scannedTransaction --jsonArray
/home/budget-server/Dropbox-Uploader/dropbox_uploader.sh upload /home/budget-server/dumps/*.txt /
rm /home/budget-server/dumps/*