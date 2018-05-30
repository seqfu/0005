id=0B7akc6CTmxIHaGVkM0ktZ3hfQjA
name=jointCallingGenotypes

wget --no-check-certificate "https://docs.google.com/uc?id=$id&export=download" -O $name.zip && \
unzip $name.zip && \
rm -rf __MACOSX && \
rm $name.zip
