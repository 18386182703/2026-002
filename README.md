# 2026-002 项目

一个复刻的网站首页，包含完整的媒体资源管理系统。

## 功能特性

### 首页功能
- ✅ 响应式设计（PC/平板/移动端）
- ✅ 导航栏滚动悬浮效果
- ✅ Hero 视觉区域
- ✅ 品牌展示墙
- ✅ 作品案例展示
- ✅ 服务菜单
- ✅ 公司介绍
- ✅ 联系方式

### 媒体资源管理系统
- ✅ 拖拽上传
- ✅ 点击选择文件
- ✅ 批量上传
- ✅ 文件格式验证（JPG/PNG/GIF/MP4/MOV）
- ✅ 文件大小验证（最大 100MB）
- ✅ 上传进度显示
- ✅ 文件预览
- ✅ 文件删除
- ✅ 错误处理

## 技术栈

- HTML5
- CSS3
- 原生 JavaScript (ES6+)
- Google Fonts (Space Mono, Noto Sans SC)
- Unsplash 图片资源

## 快速开始

### 方式一：直接打开（推荐）
1. 克隆或下载此仓库
2. 直接在浏览器中打开 `index.html`

### 方式二：使用 Node.js 服务器
```bash
node server.js
```
然后访问：http://localhost:8765

### 方式三：使用 PowerShell 服务器
```powershell
.\start-server.ps1
```
然后访问：http://localhost:8000

### 方式四：使用批处理文件
双击 `start-server.bat`，然后访问：http://localhost:8000

## 项目结构

```
.
├── index.html          # 主页面
├── server.js           # Node.js 服务器
├── start-server.bat    # Windows 启动脚本
├── start-server.ps1    # PowerShell 启动脚本
├── DEPLOYMENT.md       # 部署文档
└── README.md           # 项目说明
```

## 安全特性

### 已修复的问题
1. ✅ jpg MIME 类型修正为 `image/jpeg`
2. ✅ Node.js 服务器路径遍历防护
3. ✅ PowerShell 服务器路径遍历防护

## 浏览器兼容性

- ✅ Chrome (推荐)
- ✅ Firefox
- ✅ Safari
- ✅ Edge
- ✅ 移动端浏览器

## 部署

详细的部署说明请查看 [DEPLOYMENT.md](./DEPLOYMENT.md)。

### 快速部署到 GitHub Pages

1. 确保代码已推送到 GitHub
2. 进入仓库的 Settings
3. 找到 Pages 部分
4. 选择 main 分支作为源
5. 保存，几分钟后您的网站就可以访问了！

## 许可证

本项目仅供学习和参考使用。

## 作者

2026-002 项目
