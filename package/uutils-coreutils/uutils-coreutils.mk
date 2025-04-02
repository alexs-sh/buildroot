################################################################################
#
# uutils-coreutils
#
################################################################################

UUTILS_COREUTILS_VERSION = 0.0.30
UUTILS_COREUTILS_SITE = $(call github,uutils,coreutils,$(UUTILS_COREUTILS_VERSION))
UUTILS_COREUTILS_LICENSE = MIT
UUTILS_COREUTILS_LICENSE_FILES = LICENSE

# The list of supported utilities is used to instruct Cargo on which package(s)
# to build when coreutils is built as a set of separate files. It is also
# required to install the files into a target directory.
#
# There is some duplication with the native 'GNUMakefile' from the project.
# Unfortunately, it seems that the 'GNUMakefile' is not designed to support
# cross-compilation and cannot be used to build and install utilities in this
# case. Some manual handling is required here.
PROGS = \
	base32 \
	base64 \
	basenc \
	basename \
	cat \
	cksum \
	comm \
	cp \
	csplit \
	cut \
	date \
	dd \
	df \
	dir \
	dircolors \
	dirname \
	echo \
	env \
	expand \
	expr \
	factor \
	false \
	fmt \
	fold \
	hashsum \
	head \
	join \
	link \
	ln \
	ls \
	mkdir \
	mktemp \
	more \
	mv \
	nl \
	numfmt \
	nproc \
	od \
	paste \
	pr \
	printenv \
	printf \
	ptx \
	pwd \
	readlink \
	realpath \
	rm \
	rmdir \
	seq \
	shred \
	shuf \
	sleep \
	sort \
	split \
	sum \
	sync \
	tac \
	tail \
	tee \
	test \
	tr \
	true \
	truncate \
	tsort \
	unexpand \
	uniq \
	vdir \
	wc \
	whoami \
	yes

ifeq ($(BR2_ENABLE_DEBUG),y)
UUTILS_COREUTILS_PROFILE=debug
else
UUTILS_COREUTILS_PROFILE=release
endif

ifeq ($(BR2_PACKAGE_UUTILS_COREUTILS_MULTICALL),y)
define UUTILS_COREUTILS_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/target/$(RUSTC_TARGET_NAME)/$(UUTILS_COREUTILS_PROFILE)/coreutils $(TARGET_DIR)/bin/
endef
else
UUTILS_COREUTILS_CARGO_BUILD_OPTS += $(foreach prog,$(PROGS),-p uu_$(prog))
define UUTILS_COREUTILS_INSTALL_TARGET_CMDS
	$(foreach prog,$(PROGS), \
		$(INSTALL) -D -m 0755 $(@D)/target/$(RUSTC_TARGET_NAME)/$(UUTILS_COREUTILS_PROFILE)/$(prog) $(TARGET_DIR)/bin/
	)
endef
endif

$(eval $(cargo-package))
