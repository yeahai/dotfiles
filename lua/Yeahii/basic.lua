local g = vim.g
local o = vim.o
local bo = vim.bo
local wo = vim.wo

-- 功能key
g.mapleader = " "

-- utf8
g.encoding = "UTF-8"
o.fileencoding = "UTF-8"

-- 使用相对行号
wo.number = true
wo.relativenumber = true

-- 高亮所在行
wo.cursorline = true

-- 显示左侧图标指示列
wo.signcolumn = "yes"

-- 右侧参考线,超过表示代码太长了,考虑换行
wo.colorcolumn = "80"

-- 缩进2个空格等于一个Tab
o.tabstop = 2
bo.tabstop = 2
o.softtabstop = 2
o.shiftround = true

-- >> << 时 移动长度
o.shiftwidth = 2
bo.shiftwidth = 2

-- 搜索大小写不敏感,除非包含大写
o.ignorecase = true
o.smartcase = true

-- 搜索不要hlight
o.hlsearch = false

-- 边输入边搜索
o.incsearch = true

-- 使用增强状态栏后不再需要vim的模式提示
o.showmode = false

-- 当问及被外部程序修改时,自动加载
o.autoread = true
bo.autoread = true

-- 允许隐藏被修改过的buffer
o.hidden = true

-- 鼠标支持
o.mouse = "a"
