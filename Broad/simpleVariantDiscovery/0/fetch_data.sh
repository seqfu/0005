id=0B7akc6CTmxIHcHQ0a2EwR2k5TjA
name=SimpleVariantDiscovery

wget --no-check-certificate "https://docs.google.com/uc?id=$id&export=download" -O $name.zip && \
unzip $name.zip && \
rm -rf __MACOSX && \
rm $name.zip
