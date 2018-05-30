id=0B7akc6CTmxIHdy11R1M3ZjJJdUU
name=helloHaplotypeCaller

wget --no-check-certificate "https://docs.google.com/uc?id=$id&export=download" -O $name.zip && \
unzip $name.zip && \
rm -rf __MACOSX && \
rm $name.zip
