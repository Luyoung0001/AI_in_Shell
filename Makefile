ALL ?= Key
DIR = $(shell pwd)
FATHER_DIR = $(DIR)/..

AI_PY = $(DIR)/ai.py
start:
	# 用您的百炼API Key代替YOUR_DASHSCOPE_API_KEY
	@sudo apt install python3-pip
	@pip3 install openai
	@echo "export DASHSCOPE_API_KEY=$(ALL)" >> ~/.bashrc
	@echo "export DASHSCOPE_API_KEY=$(ALL)" >> ~/.zshrc

	@source ~/.bashrc  # 如果你编辑了 .bashrc
	@source ~/.zshrc  # 如果你编辑了 .zshrc

	@export PATH="$PATH:$(FATHER_DIR)"

	@cp $(AI_PY) $(FATHER_DIR)
	@echo -e "#!/bin/bash\npython3 AI.py" > $(FATHER_DIR)/AI
	@chmod +x $(FATHER_DIR)/AI
