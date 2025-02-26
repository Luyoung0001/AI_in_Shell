SHELL := /bin/zsh
KEY ?= Key
DIR = $(shell pwd)
FATHER_DIR = $(DIR)/..

AI_PY = $(DIR)/ai.py

start:
# 用您的百炼API Key代替YOUR_DASHSCOPE_API_KEY
	@echo "Current SHELL is: $(SHELL)"  # Debug: Print the shell being used
	@echo "Current working directory: $(DIR)" # Debug: Print current directory
	@echo "Father directory: $(FATHER_DIR)" # Debug: Print father directory
	@echo "API Key value: $(KEY)" # Debug: Print API Key value
	@echo "Checking if .zshrc exists: $(shell test -f $(FATHER_DIR)/.zshrc && echo 'yes' || echo 'no')" # Debug: Check if .zshrc exists
	@echo "Checking if .bashrc exists: $(shell test -f $(FATHER_DIR)/.bashrc && echo 'yes' || echo 'no')" # Debug: Check if .bashrc exists


# Attempt to write to .zshrc and .bashrc
	@echo "Attempting to write to $(FATHER_DIR)/.zshrc..."
	@echo "export DASHSCOPE_API_KEY=$(KEY)" >> $(FATHER_DIR)/.zshrc
	@echo "Attempting to write to $(FATHER_DIR)/.bashrc..."
	@echo "export DASHSCOPE_API_KEY=$(KEY)" >> $(FATHER_DIR)/.bashrc

	@echo "Sourcing $(FATHER_DIR)/.zshrc..."
	@source $(FATHER_DIR)/.zshrc  # 如果你编辑了 .zshrc
	@echo "Sourcing $(FATHER_DIR)/.bashrc..."
	@source $(FATHER_DIR)/.bashrc  # 如果你编辑了 .bashrc

	@export PATH="$PATH:$(FATHER_DIR)"
	@cp $(AI_PY) $(FATHER_DIR)/ai.py
	@echo -e "#!/bin/bash\npython3 ai.py" > $(FATHER_DIR)/AI
	@chmod +x $(FATHER_DIR)/AI
	@echo "AI command created in $(FATHER_DIR)"
	@echo "Run 'source $(FATHER_DIR)/.zshrc' or open a new terminal to update PATH"
	@echo "Then you can run 'AI' from any directory."
