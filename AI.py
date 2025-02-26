from openai import OpenAI
import os

# 初始化OpenAI客户端
client = OpenAI(
    api_key=os.getenv("DASHSCOPE_API_KEY"),
    base_url="https://dashscope.aliyuncs.com/compatible-mode/v1"
)

def ask_deepseek(user_question):
    """
    向 DeepSeek R1 提问，并打印思考过程和完整回复。

    参数:
        user_question (str): 要向 DeepSeek R1 提出的问题。
    """
    reasoning_content = ""
    answer_content = ""
    is_answering = False

    completion = client.chat.completions.create(
        model="deepseek-r1",
        messages=[
            {"role": "user", "content": user_question}
        ],
        stream=True,
    )

    print("\n" + "=" * 20 + "思考过程" + "=" * 20 + "\n")
    for chunk in completion:
        if not chunk.choices:
            print("\nUsage:")
            print(chunk.usage)
        else:
            delta = chunk.choices[0].delta
            if hasattr(delta, 'reasoning_content') and delta.reasoning_content is not None:
                print(delta.reasoning_content, end='', flush=True)
                reasoning_content += delta.reasoning_content
            else:
                if delta.content != "" and not is_answering:
                    print("\n" + "=" * 20 + "完整回复" + "=" * 20 + "\n")
                    is_answering = True
                print(delta.content, end='', flush=True)
                answer_content += delta.content
    return answer_content

if __name__ == "__main__":
    while True:
        user_prompt = input("请输入问题 (输入 'exit' 退出): ")
        if user_prompt.lower() == 'exit':
            break
        if user_prompt:
            ask_deepseek(user_prompt)
        else:
            print("您没有输入任何问题。")