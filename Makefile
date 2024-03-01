.POSIX:
.SILENT:
.PHONY: install uninstall

install: tasmodo.sh
	mkdir -p "${DESTDIR}${PREFIX}/bin"
	cp tasmodo.sh "${DESTDIR}${PREFIX}/bin/tasmodo"
	chmod a+x "${DESTDIR}${PREFIX}/bin/tasmodo"

uninstall:
	rm -f "${DESTDIR}${PREFIX}/bin/tasmodo"
