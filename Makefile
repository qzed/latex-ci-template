## Tools #######################################################################

LATEXMK = latexmk
MKDIR   = mkdir -p


## Files and directories #######################################################

DIR_OUT = build

TEX_MASTER = main.tex
TEX_MASTER_DEPS = $(TEX_MASTER) $(DIR_OUT)/version.tex

PAPER_BASENAME = $(shell basename $(TEX_MASTER) .tex)
PAPER_PDF = $(DIR_OUT)/$(BASENAME).pdf

.phony: all clean distclean directories


## Rules #######################################################################

all: $(PAPER_PDF)

clean:
	$(LATEXMK) -C

distclean: clean
	$(RM) -r $(DIR_OUT)

directories: $(DIR_OUT)

# main PDF rule
$(PAPER_PDF): $(TEX_MASTER_DEPS) | directories
	$(LATEXMK) $(TEX_MASTER)

# generate git version/revision info
ifneq (,$(wildcard .git/refs/heads/main))
$(DIR_OUT)/version.tex: .git/refs/heads/main ./scripts/genversion.sh | $(DIR_OUT)
	./scripts/genversion.sh > $@
else
$(DIR_OUT)/version.tex: | $(DIR_OUT)
	touch $@
endif

# generate directories
$(DIR_OUT):
	$(MKDIR) $@
