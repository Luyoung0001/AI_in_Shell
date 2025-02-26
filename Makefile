ALL ?= Key
DIR = $(shell pwd)
FATHER_DIR = $(DIR)/..

AI_PY = $(DIR)/ai.py
start:
	# 用您的百炼API Key代替YOUR_DASHSCOPE_API_KEY
	# 安装 pip3
	@sudo apt install python3-pip
	# 安装 openai
	@sudo pip3 install openai
	# 设置环境变量
	@echo "export DASHSCOPE_API_KEY=$(ALL)" >> ~/.bashrc
	@echo "export DASHSCOPE_API_KEY=$(ALL)" >> ~/.zshrc
	# 使环境变量生效
	@source ~/.bashrc  # 如果你编辑了 .bashrc
	@source ~/.zshrc  # 如果你编辑了 .zshrc
	# 安装AI
	@echo -e "#!/bin/bash\npython3 AI.py" > $(FATHER_DIR)/AI
	@export PATH="$PATH:$(FATHER_DIR)"
	# 移动AI.py到父目录
	@cp $(AI_PY) $(FATHER_DIR)
	# 添加可执行权限
	@chmod +x $(FATHER_DIR)/AI
