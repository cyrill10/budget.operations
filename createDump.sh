#!/bin/sh
export $(grep -v '^#' /home/budget-server/.env | xargs)
echo ${MONGO_URI_WITH_DATABASE}

mongoexport --uri=${MONGO_URI_WITH_DATABASE} --forceTableScan -o /home/budget-server/dumps/`date '+%Y-%m-%d'`_realAccount.txt -c realAccount --jsonArray
mongoexport --uri=${MONGO_URI_WITH_DATABASE} --forceTableScan -o /home/budget-server/dumps/`date '+%Y-%m-%d'`_virtualAccount.txt -c virtualAccount --jsonArray
mongoexport --uri=${MONGO_URI_WITH_DATABASE} --forceTableScan -o /home/budget-server/dumps/`date '+%Y-%m-%d'`_transaction.txt -c transaction --jsonArray
mongoexport --uri=${MONGO_URI_WITH_DATABASE} --forceTableScan -o /home/budget-server/dumps/`date '+%Y-%m-%d'`_closingProcess.txt -c closingProcess --jsonArray
mongoexport --uri=${MONGO_URI_WITH_DATABASE} --forceTableScan -o /home/budget-server/dumps/`date '+%Y-%m-%d'`_scannedTransaction.txt -c scannedTransaction --jsonArray
/home/budget-server/Dropbox-Uploader/dropbox_uploader.sh upload /home/budget-server/dumps/*.txt /
rm /home/budget-server/dumps/*