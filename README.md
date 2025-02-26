# AI_in_Shell

这个脚本可以直接在 Linux 终端部署 AI 对话大模型。

## 准备

环境默认使用 `zsh`。如果使用 `bash`，可能要修改一下 Makefile 脚本。

阿里 api_key。具体参考 [获取API Key](https://help.aliyun.com/zh/model-studio/developer-reference/get-api-key?spm=a2c4g.11186623.0.0.532547bbWBb3Jz)。

## 执行

直接输入：
```bash
sudo make start KEY=YOUR_API
source ~/.zshrc # 如果你使用 zsh
source ~/.bashrc  # 如果你编辑了 .bashrc
```

就可以了，之后就可以将这个仓库删除了。

## 效果

使用 `!`+ 回车 来表示结束提问。

```bash
$ AI
请输入问题 (输入 'exit' 退出): hello there!

====================思考过程====================

Okay, the user said "hello there." That's a friendly greeting. I should respond in a warm and welcoming way. Let me think of a few options. Maybe "Hello! How can I assist you today?" That's standard but polite. Alternatively, "Hi there! What can I do for you?" Hmm, that's a bit more casual. Since the user kept it simple, maybe adding an emoji would make it friendlier. Let me check if emojis are okay here. The previous response used a 😊, so maybe a smiley is fine. Alright, go with "Hello! 😊 How can I assist you today?" That's friendly and open-ended, inviting them to ask for help.
====================完整回复====================

Hello! 😊 How can I assist you today?请输入问题 (输入 'exit' 退出): exit
```


## 工作原理

很简单，看脚本就行了。
