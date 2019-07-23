FILE = $(TRAVIS_BUILD_DIR)/VERSION
VERSION = `cat $(FILE)`
ARCHIVE_NAME = '/tmp/simlachat-'$(VERSION)'.zip'

all: build_archive send_to_ftp delete_archive

build_archive:
	zip -r $(ARCHIVE_NAME) ./simlachat/*
	zip -r /tmp/simlachat.zip ./simlachat/*

send_to_ftp:
#	curl -T $(ARCHIVE_NAME) -u $(FTP_USER):$(FTP_PASSWORD) ftp://$(FTP_HOST)
#	curl -T /tmp/simlachat.zip -u $(FTP_USER):$(FTP_PASSWORD) ftp://$(FTP_HOST)
	curl --ftp-create-dirs -T /tmp/simlachat.zip sftp://$(FTP_USER):$(FTP_PASSWORD)@$(FTP_HOST)
delete_archive:
	rm -f $(ARCHIVE_NAME)
	rm -f /tmp/simlachat.zip
