--[[
Lua 语言的格式自由。 它会忽略语法元素（符记）间的空格（包括换行）和注释， 仅把它们看作为名字和关键字间的分割符。
Lua 中的标识符, 可以是由非数字打头的任意字母下划线和数字构成的字符串。 
标识符可用于对变量、表的域、以及标签命名。
]]
-- 比如
i = 1
i10 = 1
_ij = 1


-- Lua 的关键字
and       break     do        else      elseif    end
false     for       function  goto      if        in
local     nil       not       or        repeat    return
then      true      until     while

-- Lua 语言对大小写敏感： and 是一个保留字，但 And 与 AND 则是两个不同的有效名字。 
-- 作为一个约定，程序应避免创建以下划线加一个或多个大写字母构成的名字 （例如 _VERSION）。

--[===[
字面串 可以用单引号或双引号括起。 
字面串内部可以包含下列 C 风格的转义串：
 '\a' （响铃）， '\b' （退格）， '\f' （换页）， '\n' （换行）， 
 '\r' （回车）， '\t' （横项制表）， '\v' （纵向制表）， 
 '\\' （反斜杠）， '\"' （双引号）， 以及 '\'' (单引号)。 
 在反斜杠后跟一个真正的换行等价于在字符串中写一个换行符。 
 转义串 '\z' 会忽略其后的一系列空白符，包括换行； 
 它在你需要对一个很长的字符串常量断行为多行并希望在每个新行保持缩进时非常有用。
]===]

str1 = "hello"
str2 = 'world'
str3 = 'Hello \\ world'



--[[
数字常量 （或称为 数字量） 
可以由可选的小数部分和可选的十为底的指数部分构成， 指数部分用字符 'e' 或 'E' 来标记。 
Lua 也接受以 0x 或 0X 开头的 16 进制常量。 
16 进制常量也接受小数加指数部分的形式，指数部分是以二为底， 用字符 'p' 或 'P' 来标记。 
数字常量中包含小数点或指数部分时，被认为是一个浮点数； 否则被认为是一个整数。 下面有一些合法的整数常量的例子：
]]

3   345   0xff   0xBEBADA

--[[
以下为合法的浮点常量：
]]
     3.0     3.1416     314.16e-2     0.31416E1     34e1
     0x0.1E  0xA23p-4   0X1.921FB54442D18P+1

--[===[
在字符串外的任何地方出现以双横线 (--) 开头的部分是 注释 。 
如果 -- 后没有紧跟着一个开大括号， 该注释为 短注释， 注释到当前行末截至。]]  
否则，这是一段 长注释 ， 注释区一直维持到对应的闭长括号。 长注释通常用于临时屏蔽掉一大段代码。
]===]








