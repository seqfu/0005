version=4.0.4.0
zip_f=gatk-$version.zip

echo "Fetching $zip_f"
curl -L -O https://github.com/broadinstitute/gatk/releases/download/$version/$zip_f && \
unzip $zip_f && \
rm $zip_f
