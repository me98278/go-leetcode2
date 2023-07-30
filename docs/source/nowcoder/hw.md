# 牛客-华为机试

- https://www.nowcoder.com/ta/huawei

## 1.字符串最后一个单词的长度(5)

- 题目

```
题目描述:计算字符串最后一个单词的长度，单词以空格隔开。
输入描述:一行字符串，非空，长度小于5000。
输出描述:整数N，最后一个单词的长度。
示例1:输入:hello world  输出:5
```

- 解题思路

| No. | 思路   | 时间复杂度 | 空间复杂度 |
|:----|:-----|:------|:------|
| 01  | 内置函数 | O(n)  | O(n)  |
| 02  | 内置函数 | O(n)  | O(n)  |
| 03  | 内置函数 | O(n)  | O(n)  |
| 04  | 内置函数 | O(n)  | O(n)  |
| 05  | 顺序读取 | O(n)  | O(n)  |

```go
package main

import (
	"bufio"
	"fmt"
	"os"
	"strings"
)

func main() {
	reader := bufio.NewReader(os.Stdin)
	data, _, _ := reader.ReadLine()
	str := string(data)
	arr := strings.Fields(str)
	if len(arr) == 0 {
		fmt.Println(0)
		return
	}
	fmt.Println(len(arr[len(arr)-1]))
	return
}

# 2
package main

import (
	"bufio"
	"fmt"
	"os"
	"strings"
)

func main() {
	scan := bufio.NewScanner(os.Stdin)
	scan.Scan()
	str := scan.Text()
	arr := strings.Fields(str)
	if len(arr) == 0 {
		fmt.Println(0)
		return
	}
	fmt.Println(len(arr[len(arr)-1]))
	return
}

# 3
package main

import (
	"bufio"
	"fmt"
	"os"
	"strings"
)

func main() {
	reader := bufio.NewReader(os.Stdin)
	//data, _ := reader.ReadBytes('\n')
	data, _ := reader.ReadString('\n')
	str := string(data)
	arr := strings.Fields(str)
	if len(arr) == 0 {
		fmt.Println(0)
		return
	}
	fmt.Println(len(arr[len(arr)-1]))
	return
}

# 4
package main

import (
	"bufio"
	"fmt"
	"os"
	"strings"
)

func main() {
	scan := bufio.NewScanner(os.Stdin)
	for scan.Scan() {
		str := scan.Text()
		arr := strings.Fields(str)
		if len(arr) == 0 {
			fmt.Println(0)
		} else {
			fmt.Println(len(arr[len(arr)-1]))
		}
	}
	return
}

# 5
package main

import "fmt"

func main() {
	var str string
	for {
		flag, _ := fmt.Scan(&str)
		if flag == 0 {
			break
		}
	}
	fmt.Println(len(str))
}
```

## 2.计算字符个数(4)

- 题目

```
题目描述
写出一个程序，接受一个由字母和数字组成的字符串，和一个字符，然后输出输入字符串中含有该字符的个数。
不区分大小写。
输入描述:第一行输入一个有字母和数字以及空格组成的字符串，第二行输入一个字符。
输出描述:输出输入字符串中含有该字符的个数。
示例1
输入
ABCDEF
A
输出 1
```

- 解题思路

| No. | 思路   | 时间复杂度 | 空间复杂度 |
| :-----| :------| :-------| :-------|
| 01  | 遍历   | O(n)  | O(1)  |
| 02  | 遍历   | O(n)  | O(1)  |
| 03  | 遍历   | O(n)  | O(1)  |
| 04  | 内置函数 | O(n)  | O(1)  |

```go
package main

import (
	"bufio"
	"fmt"
	"os"
	"strings"
)

func main() {
	reader := bufio.NewReader(os.Stdin)
	data, _ := reader.ReadString('\n')
	str := strings.ToLower(data)
	// data, _ = reader.ReadString('\n')
	// c := strings.ToLower(data)[0]
	c, _, _ := reader.ReadRune()
	res := 0
	for i := 0; i < len(str); i++ {
		if str[i] == uint8(c) {
			res++
		}
	}
	fmt.Println(res)
	return
}

# 2
package main

import (
	"fmt"
	"strings"
)

func main() {
	var str string
	var c uint8
	fmt.Scanf("%s", &str)
	fmt.Scanf("%c", &c)
	str = strings.ToLower(str)
	c = strings.ToLower(string(c))[0]
	res := 0
	for i := 0; i < len(str); i++ {
		if str[i] == uint8(c) {
			res++
		}
	}
	fmt.Println(res)
	return
}

# 3
package main

import (
	"fmt"
	"strings"
)

func main() {
	var str string
	var c string
	fmt.Scan(&str)
	fmt.Scan(&c)
	str = strings.ToLower(str)
	c = strings.ToLower(c)
	res := 0
	for i := 0; i < len(str); i++ {
		if strings.EqualFold(string(str[i]), c) {
			res++
		}
	}
	fmt.Println(res)
	return
}

# 4
package main

import (
	"bufio"
	"fmt"
	"os"
	"strings"
)

func main() {
	reader := bufio.NewReader(os.Stdin)
	str, _, _ := reader.ReadLine()
	char, _, _ := reader.ReadLine()
	s := strings.ToLower(string(str))
	c := strings.ToLower(string(char))
	fmt.Println(strings.Count(s, c))
	return
}
```

## 3.明明的随机数(2)

- 题目

```
明明想在学校中请一些同学一起做一项问卷调查，为了实验的客观性，
他先用计算机生成了N个1到1000之间的随机整数（N≤1000），对于其中重复的数字，只保留一个，把其余相同的数去掉，
不同的数对应着不同的学生的学号。
然后再把这些数从小到大排序，按照排好的顺序去找同学做调查。
请你协助明明完成“去重”与“排序”的工作(同一个测试用例里可能会有多组数据，希望大家能正确处理)。
Input Param
n               输入随机数的个数
inputArray      n个随机整数组成的数组
Return Value
OutputArray    输出处理后的随机整数
注：测试用例保证输入参数的正确性，答题者无需验证。测试用例不止一组。
样例输入解释： 样例有两组测试
第一组是3个数字，分别是：2，2，1。
第二组是11个数字，分别是：10，20，40，32，67，40，20，89，300，400，15。
输入描述:输入多行，先输入随机整数的个数，再输入相应个数的整数
输出描述:返回多行，处理后的结果
示例1 输入
3
2
2
1
11
10
20
40
32
67
40
20
89
300
400
15
输出
1
2
10
15
20
32
40
67
89
300
400
```

- 解题思路

| No. | 思路      | 时间复杂度 | 空间复杂度 |
| :-----| :---------| :-------| :-------|
| 01  | 遍历-数组辅助 | O(n)  | O(1)  |
| 02  | 遍历-数组辅助 | O(n)  | O(1)  |

```go
package main

import (
	"bufio"
	"fmt"
	"os"
	"strconv"
)

func main() {
	reader := bufio.NewReader(os.Stdin)
	for {
		n, _, _ := reader.ReadLine()
		if len(n) <= 0 {
			break
		}
		num, _ := strconv.Atoi(string(n))
		temp := make([]bool, 1024)
		for i := 0; i < num; i++ {
			data, _, _ := reader.ReadLine()
			value, _ := strconv.Atoi(string(data))
			temp[value] = true
		}
		for i := 0; i < len(temp); i++ {
			if temp[i] == true {
				fmt.Println(i)
			}
		}
	}
}

# 2
package main

import (
	"bufio"
	"fmt"
	"os"
	"strconv"
)

func main() {
	scan := bufio.NewScanner(os.Stdin)
	for {
		scan.Scan()
		n := scan.Text()
		if len(n) <= 0 {
			break
		}
		num, _ := strconv.Atoi(string(n))
		temp := make([]bool, 1024)
		for i := 0; i < num; i++ {
			scan.Scan()
			data := scan.Text()
			value, _ := strconv.Atoi(string(data))
			temp[value] = true
		}
		for i := 0; i < len(temp); i++ {
			if temp[i] == true {
				fmt.Println(i)
			}
		}
	}
}
```

## 4.字符串分隔(2)

- 题目

```
题目描述
•连续输入字符串，请按长度为8拆分每个字符串后输出到新的字符串数组；
•长度不是8整数倍的字符串请在后面补数字0，空字符串不处理。
输入描述:连续输入字符串(输入2次,每个字符串长度小于100)
输出描述:输出到长度为8的新字符串数组
示例1
输入
abc
123456789
输出
abc00000
12345678
90000000
```

- 解题思路

| No. | 思路 | 时间复杂度 | 空间复杂度 |
| :-----| :----| :-------| :-------|
| 01  | 遍历 | O(n)  | O(n)  |
| 02  | 遍历 | O(n)  | O(n)  |

```go
package main

import (
	"bufio"
	"fmt"
	"os"
)

func main() {
	scan := bufio.NewScanner(os.Stdin)
	for i := 0; i < 2; i++ {
		scan.Scan()
		str := scan.Text()
		length := len(str)
		if length%8 != 0 {
			for i := 0; i < 8-length%8; i++ {
				str = str + string('0')
			}
		}
		for i := 0; i < len(str)/8; i++ {
			fmt.Println(str[i*8 : i*8+8])
		}
	}
}

#
package main

import (
	"fmt"
)

func main() {
	arr := [2]string{}
	fmt.Scanln(&arr[0])
	fmt.Scanln(&arr[1])
	for i := 0; i < 2; i++ {
		str := arr[i]
		length := len(str)
		if length%8 != 0 {
			for i := 0; i < 8-length%8; i++ {
				str = str + string('0')
			}
		}
		for i := 0; i < len(str)/8; i++ {
			fmt.Println(str[i*8 : i*8+8])
		}
	}
}
```

## 5.进制转换(3)

- 题目

```
题目描述
写出一个程序，接受一个十六进制的数，输出该数值的十进制表示。（多组同时输入 ）
输入描述:输入一个十六进制的数值字符串。
输出描述:输出该数值的十进制字符串。
示例1
输入
0xA
输出
10
```

- 解题思路

| No. | 思路     | 时间复杂度 | 空间复杂度 |
| :-----| :--------| :-------| :-------|
| 01  | 遍历     | O(1)  | O(1)  |
| 02  | 遍历     | O(1)  | O(1)  |
| 03  | 字符串转整数 | O(1)  | O(1)  |

```go
package main

import "fmt"

func main() {
	var num int
	for {
		n, _ := fmt.Scanf("0x%x", &num)
		if n == 0 {
			break
		}
		fmt.Println(num)
	}
}

#
package main

import "fmt"

func main() {
	var num int
	for {
		n, _ := fmt.Scanf("%v", &num)
		if n == 0 {
			break
		}
		fmt.Println(num)
	}
}

#
package main

import (
	"bufio"
	"fmt"
	"os"
	"strconv"
)

func main() {
	reader := bufio.NewReader(os.Stdin)
	var num string
	for {
		data, _, _ := reader.ReadLine()
		if len(data) == 0 {
			break
		}
		num = string(data[2:])
		value, _ := strconv.ParseInt(num, 16, 32)
		fmt.Println(value)
	}
}
```

## 6.质数因子(2)

- 题目

```
题目描述
功能:输入一个正整数，按照从小到大的顺序输出它的所有质因子（重复的也要列举）
（如180的质因子为2 2 3 3 5 ）
最后一个数后面也要有空格
输入描述:输入一个long型整数
输出描述:按照从小到大的顺序输出它的所有质数的因子，以空格隔开。最后一个数后面也要有空格。
示例1
输入
180
输出
2 2 3 3 5
```

- 解题思路

| No. | 思路 | 时间复杂度     | 空间复杂度 |
| :-----| :----| :-----------| :-------|
| 01  | 遍历 | O(log(n)) | O(1)  |
| 02  | 遍历 | O(log(n)) | O(1)  |

```go
package main

import "fmt"

func main() {
	var num int64
	for {
		n, _ := fmt.Scanf("%d", &num)
		if n == 0 {
			break
		}
		i := int64(2)
		for num > 1 {
			if num%i == 0 {
				fmt.Printf("%d ", i)
				num = num / i
			} else {
				i++
			}
		}
		fmt.Println()
	}
}

#
package main

import "fmt"

func main() {
	var num int64
	for {
		n, _ := fmt.Scanf("%d", &num)
		if n == 0 {
			break
		}
		for i := int64(2); i <= num; i++ {
			if num == 1 {
				break
			}
			for num%i == 0 {
				fmt.Printf("%d ", i)
				num = num / i
			}
		}
		fmt.Println()
	}
}
```

## 7.取近似值(2)

- 题目

```
题目描述
写出一个程序，接受一个正浮点数值，输出该数值的近似整数值。如果小数点后数值大于等于5,向上取整；
小于5，则向下取整。
输入描述:输入一个正浮点数值
输出描述:输出该数值的近似整数值
示例1
输入
5.5
输出
6
```

- 解题思路

| No. | 思路 | 时间复杂度 | 空间复杂度 |
| :-----| :----| :-------| :-------|
| 01  | 遍历 | O(1)  | O(1)  |
| 02  | 遍历 | O(1)  | O(1)  |

```go
package main

import "fmt"

func main() {
	var num float32
	fmt.Scanf("%f", &num)
	fmt.Println(int(num + 0.5))
}

#
package main

import (
	"fmt"
	"math"
)

func main() {
	var num float64
	for {
		n, _ := fmt.Scanf("%f", &num)
		if n == 0 {
			break
		}
		fmt.Println(int(math.Floor(num + 0.5)))
	}
}
```

## 8.合并表记录(2)

- 题目

```
题目描述
数据表记录包含表索引和数值（int范围的整数），请对表索引相同的记录进行合并，即将相同索引的数值进行求和运算，
输出按照key值升序进行输出。
输入描述:先输入键值对的个数 然后输入成对的index和value值，以空格隔开
输出描述:输出合并后的键值对（多行）
示例1
输入
4
0 1
0 2
1 2
3 4
输出
0 3
1 2
3 4
```

- 解题思路

| No. | 思路   | 时间复杂度      | 空间复杂度 |
| :-----| :------| :------------| :-------|
| 01  | 数组辅助 | O(n)       | O(1)  |
| 02  | 哈希辅助 | O(nlog(n)) | O(n)  |

```go
package main

import "fmt"

func main() {
	var num int
	for {
		n, _ := fmt.Scanf("%d", &num)
		if n == 0 {
			break
		}
		var key, vale int
		arr := make([]int, 1024)
		for i := 0; i < num; i++ {
			fmt.Scanf("%d %d", &key, &vale)
			arr[key] = arr[key] + vale
		}
		for i := 0; i < len(arr); i++ {
			if arr[i] != 0 {
				fmt.Printf("%d %d\n", i, arr[i])
			}
		}
	}
}

#
package main

import (
	"fmt"
	"sort"
)

func main() {
	var num int
	for {
		n, _ := fmt.Scanf("%d", &num)
		if n == 0 {
			break
		}
		var key, vale int
		arr := make([]int, 0)
		m := make(map[int]int)
		for i := 0; i < num; i++ {
			fmt.Scanf("%d %d", &key, &vale)
			if _, ok := m[key]; !ok {
				arr = append(arr, key)
			}
			m[key] = m[key] + vale
		}
		sort.Ints(arr)
		for i := 0; i < len(arr); i++ {
			fmt.Printf("%d %d\n", arr[i], m[arr[i]])
		}
	}
}
```

## 9.提取不重复的整数(2)

- 题目

```
题目描述:输入一个int型整数，按照从右向左的阅读顺序，返回一个不含重复数字的新的整数。
输入描述:输入一个int型整数
输出描述:按照从右向左的阅读顺序，返回一个不含重复数字的新的整数
示例1
输入
9876673
输出
37689
```

- 解题思路

| No. | 思路   | 时间复杂度     | 空间复杂度 |
| :-----| :------| :-----------| :-------|
| 01  | 数组辅助 | O(log(n)) | O(1)  |
| 02  | 数组辅助 | O(log(n)) | O(1)  |

```go
package main

import (
	"fmt"
)

func main() {
	var num int
	for {
		n, _ := fmt.Scanf("%d", &num)
		if n == 0 {
			break
		}
		m := make(map[int]int)
		res := 0
		for num > 0 {
			value := num % 10
			num = num / 10
			if m[value] == 0 {
				res = res*10 + value
				m[value] = 1
			}
		}
		fmt.Println(res)
	}
}

#
package main

import (
	"fmt"
)

func main() {
	var num string
	for {
		n, _ := fmt.Scanf("%s", &num)
		if n == 0 {
			break
		}
		m := make(map[byte]int)
		for i := len(num) - 1; i >= 0; i-- {
			if m[num[i]] == 0 {
				fmt.Printf("%c", num[i])
				m[num[i]] = 1
			}
		}
		fmt.Println()
	}
}
```

## 10.字符个数统计(2)

- 题目

```
题目描述
编写一个函数，计算字符串中含有的不同字符的个数。字符在ACSII码范围内(0~127)，换行表示结束符，不算在字符里。
不在范围内的不作统计。多个相同的字符只计算一次
输入
abaca
输出
3
输入描述:输入N个字符，字符在ACSII码范围内。
输出描述:输出范围在(0~127)字符的个数。
示例1
输入
abc
输出
3
```

- 解题思路

| No. | 思路   | 时间复杂度 | 空间复杂度 |
| :-----| :------| :-------| :-------|
| 01  | 哈希辅助 | O(n)  | O(1)  |
| 02  | 数组辅助 | O(n)  | O(1)  |

```go
package main

import (
	"fmt"
)

func main() {
	var num string
	for {
		n, _ := fmt.Scanf("%s", &num)
		if n == 0 {
			break
		}
		m := make(map[byte]int)
		for i := 0; i < len(num); i++ {
			m[num[i]] = 1
		}
		fmt.Println(len(m))
	}
}

#
package main

import (
	"fmt"
)

func main() {
	var num string
	for {
		n, _ := fmt.Scan(&num)
		if n == 0 {
			break
		}
		m := make([]int, 128)
		res := 0
		for i := 0; i < len(num); i++ {
			if m[num[i]] == 0 {
				m[num[i]] = 1
				res++
			}
		}
		fmt.Println(res)
	}
}
```

## 11.数字颠倒(2)

- 题目

```
题目描述
描述：输入一个整数，将这个整数以字符串的形式逆序输出
程序不考虑负数的情况，若数字含有0，则逆序形式也含有0，如输入为100，则输出为001
输入描述:输入一个int整数
输出描述:将这个整数以字符串的形式逆序输出
示例1
输入
1516000
输出
0006151
```

- 解题思路

| No. | 思路 | 时间复杂度     | 空间复杂度 |
| :-----| :----| :-----------| :-------|
| 01  | 遍历 | O(log(n)) | O(1)  |
| 02  | 遍历 | O(log(n)) | O(1)  |

```go
package main

import (
	"fmt"
)

func main() {
	var num string
	for {
		n, _ := fmt.Scanf("%s", &num)
		if n == 0 {
			break
		}
		for i := len(num) - 1; i >= 0; i-- {
			// fmt.Print(num[i] - '0')
			fmt.Print(string(num[i]))
		}
		fmt.Println()
	}
}

#
package main

import (
	"fmt"
)

func main() {
	var num int
	for {
		n, _ := fmt.Scanf("%d", &num)
		if n == 0 {
			break
		}
		for num > 0{
			fmt.Print(num%10)
			num = num/10
		}
		fmt.Println()
	}
}
```

## 12.字符串反转(2)

- 题目

```
题目描述:写出一个程序，接受一个字符串，然后输出该字符串反转后的字符串。（字符串长度不超过1000）
输入描述:输入N个字符
输出描述:输出该字符串反转后的字符串
示例1
输入
abcd
输出
dcba
```

- 解题思路

| No. | 思路 | 时间复杂度 | 空间复杂度 |
| :-----| :----| :-------| :-------|
| 01  | 遍历 | O(n)  | O(1)  |
| 01  | 遍历 | O(n)  | O(1)  |

```go
package main

import (
	"fmt"
)

func main() {
	var str string
	for {
		n, _ := fmt.Scanf("%s", &str)
		if n == 0 {
			break
		}
		for i := len(str) - 1; i >= 0; i-- {
			fmt.Print(string(str[i]))
		}
		fmt.Println()
	}
}

#
package main

import (
	"bufio"
	"fmt"
	"os"
)

func main() {
	reader := bufio.NewReader(os.Stdin)
	for {
		n, _, _ := reader.ReadLine()
		if len(n) == 0 {
			break
		}
		str := n
		for i := len(str) - 1; i >= 0; i-- {
			fmt.Print(string(str[i]))
		}
		fmt.Println()
	}
}
```

## 13.句子逆序(2)

- 题目

```
题目描述
将一个英文语句以单词为单位逆序排放。例如“I am a boy”，逆序排放后为“boy a am I”
所有单词之间用一个空格隔开，语句中除了英文字母外，不再包含其他字符
接口说明
/**
 * 反转句子
 * 
 * @param sentence 原句子
 * @return 反转后的句子
 */
public String reverse(String sentence);
输入描述:将一个英文语句以单词为单位逆序排放。
输出描述:得到逆序的句子
示例1
输入
I am a boy
输出
boy a am I
```

- 解题思路

| No. | 思路   | 时间复杂度 | 空间复杂度 |
| :-----| :------| :-------| :-------|
| 01  | 内置函数 | O(n)  | O(n)  |
| 02  | 内置函数 | O(n)  | O(n)  |

```go
package main

import (
	"bufio"
	"fmt"
	"os"
	"strings"
)

func main() {
	reader := bufio.NewReader(os.Stdin)
	for {
		n, _, _ := reader.ReadLine()
		if len(n) == 0 {
			break
		}
		str := string(n)
		arr := strings.Split(str, " ")
		for i := 0; i < len(arr)/2; i++ {
			arr[i], arr[len(arr)-1-i] = arr[len(arr)-1-i], arr[i]
		}
		fmt.Println(strings.Join(arr, " "))
	}
}

#
package main

import (
	"bufio"
	"fmt"
	"os"
	"strings"
)

func main() {
	scan := bufio.NewScanner(os.Stdin)
	for scan.Scan() {
		str := scan.Text()
		arr := strings.Split(str, " ")
		for i := 0; i < len(arr)/2; i++ {
			arr[i], arr[len(arr)-1-i] = arr[len(arr)-1-i], arr[i]
		}
		fmt.Println(strings.Join(arr, " "))
	}
}
```

## 14.字串的连接最长路径查找(2)

- 题目

```
题目描述
给定n个字符串，请对n个字符串按照字典序排列。
输入描述:输入第一行为一个正整数n(1≤n≤1000),下面n行为n个字符串(字符串长度≤100),字符串中只含有大小写字母。
输出描述:数据输出n行，输出结果为按照字典序排列的字符串。
示例1
输入
9
cap
to
cat
card
two
too
up
boat
boot
输出
boat
boot
cap
card
cat
to
too
two
up
```

- 解题思路

| No. | 思路 | 时间复杂度      | 空间复杂度 |
| :-----| :----| :------------| :-------|
| 01  | 排序 | O(nlog(n)) | O(n)  |
| 02  | 排序 | O(nlog(n)) | O(n)  |

```go
package main

import (
	"fmt"
	"sort"
)

func main() {
	var num int
	for {
		n, _ := fmt.Scanf("%d", &num)
		if n == 0 {
			break
		}
		arr := make([]string, 0)
		var str string
		for i := 0; i < num; i++ {
			fmt.Scanf("%s", &str)
			arr = append(arr, str)
		}
		sort.Strings(arr)
		for i := 0; i < len(arr); i++ {
			fmt.Println(arr[i])
		}
	}
}

#
package main

import (
	"bufio"
	"fmt"
	"os"
	"sort"
	"strconv"
)

func main() {
	reader := bufio.NewReader(os.Stdin)
	for {
		n, _, _ := reader.ReadLine()
		if len(n) == 0 {
			break
		}
		num, _ := strconv.Atoi(string(n))
		arr := make([]string, 0)
		for i := 0; i < num; i++ {
			data, _, _ := reader.ReadLine()
			arr = append(arr, string(data))
		}
		sort.Strings(arr)
		for i := 0; i < len(arr); i++ {
			fmt.Println(arr[i])
		}
	}
}
```

## 15.求int型正整数在内存中存储时1的个数(2)

- 题目

```
题目描述:输入一个int型的正整数，计算出该int型数据在内存中存储时1的个数。
输入描述:输入一个整数（int类型）
输出描述:这个数转换成2进制后，输出1的个数
示例1
输入 5
输出 2
```

- 解题思路

| No. | 思路  | 时间复杂度     | 空间复杂度 |
| :-----| :-----| :-----------| :-------|
| 01  | 遍历  | O(log(n)) | O(1)  |
| 02  | 位运算 | O(log(n)) | O(1)  |

```go
package main

import "fmt"

func main() {
	var num int
	for {
		n, _ := fmt.Scanf("%d", &num)
		if n == 0{
			break
		}
		res := 0
		for num > 0{
			if num%2 == 1{
				res++
			}
			num = num/2
		}
		fmt.Println(res)
	}
}

#
package main

import "fmt"

func main() {
	var num int
	for {
		n, _ := fmt.Scanf("%d", &num)
		if n == 0 {
			break
		}
		res := 0
		for num > 0 {
			num = num & (num - 1)
			res++
		}
		fmt.Println(res)
	}
}
```

## 16.购物单

### 题目

```
题目描述
王强今天很开心，公司发给N元的年终奖。王强决定把年终奖用于购物，他把想买的物品分为两类：
主件与附件，附件是从属于某个主件的，下表就是一些主件与附件的例子：
主件	附件
电脑	打印机，扫描仪
书柜	图书
书桌	台灯，文具
工作椅	无
如果要买归类为附件的物品，必须先买该附件所属的主件。
每个主件可以有 0 个、 1 个或 2 个附件。附件不再有从属于自己的附件。
王强想买的东西很多，为了不超出预算，他把每件物品规定了一个重要度，分为 5 等：
用整数 1 ~ 5 表示，第 5 等最重要。他还从因特网上查到了每件物品的价格（都是 10 元的整数倍）。
他希望在不超过 N 元（可以等于 N 元）的前提下，使每件物品的价格与重要度的乘积的总和最大。
    设第 j 件物品的价格为 v[j] ，重要度为 w[j] ，共选中了 k 件物品，
    编号依次为 j 1 ， j 2 ，……， j k ，则所求的总和为：
v[j 1 ]*w[j 1 ]+v[j 2 ]*w[j 2 ]+ … +v[j k ]*w[j k ] 。（其中 * 为乘号）
    请你帮助王强设计一个满足要求的购物单。
输入描述:
输入的第 1 行，为两个正整数，用一个空格隔开：N m
（其中 N （ <32000 ）表示总钱数， m （ <60 ）为希望购买物品的个数。）
从第 2 行到第 m+1 行，第 j 行给出了编号为 j-1 的物品的基本数据，
每行有 3 个非负整数 v p q（其中 v 表示该物品的价格（ v<10000 ）， 
p 表示该物品的重要度（ 1 ~ 5 ）， q 表示该物品是主件还是附件。
如果 q=0 ，表示该物品为主件，如果 q>0 ，表示该物品为附件， q 是所属主件的编号）
输出描述:输出文件只有一个正整数，为不超过总钱数的物品的价格与重要度乘积的总和的最大值（ <200000 ）。
示例1
输入
1000 5
800 2 0
400 5 1
300 5 1
400 3 0
500 2 0
输出
2200
```

### 解题思路

| No. | 思路 | 时间复杂度     | 空间复杂度 |
| :-----| :----| :-----------| :-------|
| 01  | 遍历 | O(log(n)) | O(1)  |

```go

```

## 17.坐标移动(1)

- 题目

```
题目描述
开发一个坐标计算工具， A表示向左移动，D表示向右移动，W表示向上移动，S表示向下移动。
从（0,0）点开始移动，从输入字符串里面读取一些坐标，并将最终输入结果输出到输出文件里面。
输入：合法坐标为A(或者D或者W或者S) + 数字（两位以内）坐标之间以;分隔。
非法坐标点需要进行丢弃。如AA10;  A1A;  $%$;  YAD; 等。
下面是一个简单的例子 如：
A10;S20;W10;D30;X;A1A;B10A11;;A10;
处理过程：起点（0,0）
+   A10   =  （-10,0）
+   S20   =  (-10,-20)
+   W10  =  (-10,-10)
+   D30  =  (20,-10)
+   x    =  无效
+   A1A   =  无效
+   B10A11   =  无效
+  一个空 不影响
+   A10  =  (10,-10)
结果 （10， -10）
注意请处理多组输入输出
输入描述:一行字符串
输出描述:最终坐标，以,分隔
示例1
输入 A10;S20;W10;D30;X;A1A;B10A11;;A10;
输出 10,-10
```

- 解题思路

| No. | 思路 | 时间复杂度 | 空间复杂度 |
| :-----| :----| :-------| :-------|
| 01  | 遍历 | O(n)  | O(1)  |

```go
package main

import (
	"fmt"
	"strconv"
	"strings"
)

func main() {
	var str string
	for {
		n, _ := fmt.Scanf("%s", &str)
		if n == 0 {
			break
		}
		arr := strings.Split(str, ";")
		x := 0
		y := 0
		for i := 0; i < len(arr); i++ {
			if len(arr[i]) <= 1 || len(arr[i]) > 3 {
				continue
			}
			value, _ := strconv.Atoi(arr[i][1:])
			switch arr[i][0] {
			case 'A':
				x = x - value
			case 'D':
				x = x + value
			case 'W':
				y = y + value
			case 'S':
				y = y - value
			}
		}
		fmt.Printf("%d,%d\n", x, y)
	}
}

#
```

## 18.识别有效的IP地址和掩码并进行分类统计

### 题目

```
题目描述
请解析IP地址和对应的掩码，进行分类识别。要求按照A/B/C/D/E类地址归类，不合法的地址和掩码单独归类。
所有的IP地址划分为 A,B,C,D,E五类
A类地址1.0.0.0~126.255.255.255;
B类地址128.0.0.0~191.255.255.255;
C类地址192.0.0.0~223.255.255.255;
D类地址224.0.0.0~239.255.255.255；
E类地址240.0.0.0~255.255.255.255
私网IP范围是：
10.0.0.0～10.255.255.255
172.16.0.0～172.31.255.255
192.168.0.0～192.168.255.255
子网掩码为二进制下前面是连续的1，然后全是0。（例如：255.255.255.32就是一个非法的掩码）
注意二进制下全是1或者全是0均为非法
注意：
1. 类似于【0.*.*.*】和【127.*.*.*】的IP地址不属于上述输入的任意一类，也不属于不合法ip地址，
计数时可以忽略
2. 私有IP地址和A,B,C,D,E类地址是不冲突的
输入描述: 多行字符串。每行一个IP地址和掩码，用~隔开。
输出描述:统计A、B、C、D、E、错误IP地址或错误掩码、私有IP的个数，之间以空格隔开。
示例1
输入
10.70.44.68~255.254.255.0
1.0.0.1~255.0.0.0
192.168.0.2~255.255.255.0
19..0.~255.255.255.0
输出
1 0 1 0 0 2 1
```

### 解题思路

```go

```