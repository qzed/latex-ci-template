## Tools #######################################################################

LATEXMK = latexmk
MKDIR   = mkdir -p


## Files and directories #######################################################

DIR_OUT = build

TEX_MASTER = main.tex
TEX_MASTER_DEPS = $(TEX_MASTER)

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

$(PAPER_PDF): $(TEX_MASTER_DEPS) | directories
	$(LATEXMK) $(TEX_MASTER)

$(DIR_OUT):
	$(MKDIR) $@
