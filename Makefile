.PHONY: examples

CC = lualatex
EXAMPLES_DIR = examples
CV_DIR = examples/cv
CV_SRCS = $(shell find $(CV_DIR) -name '*.tex')
CV_ZH_DIR = examples/cv-zh
CV_ZH_SRCS = $(shell find $(CV_ZH_DIR) -name '*.tex')

examples: $(foreach x, coverletter cv cv-zh, $x.pdf)

cv.pdf: $(EXAMPLES_DIR)/cv.tex $(CV_SRCS)
	$(CC) -output-directory=$(EXAMPLES_DIR) $<

cv-zh.pdf: $(EXAMPLES_DIR)/cv-zh.tex $(CV_ZH_SRCS)
	$(CC) -output-directory=$(EXAMPLES_DIR) $<

coverletter.pdf: $(EXAMPLES_DIR)/coverletter.tex
	$(CC) -output-directory=$(EXAMPLES_DIR) $<

clean:
	rm -rf $(EXAMPLES_DIR)/*.pdf
