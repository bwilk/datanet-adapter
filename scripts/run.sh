echo "I am DataNet adapter!"

: "${AUTH:=no-auth}"

: "${URL_BASE:=http://process.cyfronet.pl:8080}"
: "${DB:=datanet}"
: "${SOURCE_COLL:=metadata-col-1}"
: "${TARGET_COLL:=metadata-col-2}"

export AUTH

echo "Getting metadata"
ruby ./get_metadata.rb $URL_BASE/$DB/$SOURCE_COLL

while :
do
	echo "Posting metadata"
	ruby ./post_metadata.rb $URL_BASE/$DB/$TARGET_COLL
	sleep 5
done

