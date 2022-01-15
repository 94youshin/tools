# shell 语法

## 常用技巧
1. check command
```bash
function check()
{
  if command -v $1 > /dev/null 2>&1;then
    return 0
  fi
  return 1
}
```
2. 获取当前工作目录
```bash
root="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
```

3. 获取命令全路径
```bash
kubectl=$(which kubectl)
```
4. 遍历数组
```bash
commands=(
	kubectl
	get	
	po
)

findPod=""
for cmd in ${commands[@]}
do
	findPod+="$cmd "
done

# exec cmd
${findPod}

#print cmd
echo ${findPod}
```
