# .RECIPEPREFIX := $(.RECIPEPREFIX)

IVERILOG := iverilog
VVP := vvp
IVERILOG_FLAGS := -I ..
VVP_FLAGS := -fst

TESTS := $(patsubst %.v, %, $(wildcard *_tb.v))

all: $(TESTS)

$(TESTS):
	@echo "[INFO] Build $@"
	@$(IVERILOG) -o $@ $(IVERILOG_FLAGS) $@.v
	@$(VVP) $@ $(VVP_FLAGS);

clean:
	rm *.vcd *_tb

.PHONY: clean, all, $(TESTS)