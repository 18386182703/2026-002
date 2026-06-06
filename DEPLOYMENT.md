# 部署文档

## 项目概述

这是一个复刻了 `aixc4d.com` 首页的单页面网站，包含完整的媒体资源管理系统。

## 文件结构

```
.
├── index.html          # 主页面文件
└── DEPLOYMENT.md       # 部署文档（本文件）
```

## 技术栈

- HTML5
- CSS3
- 原生 JavaScript (ES6+)
- Google Fonts (Space Mono, Noto Sans SC)
- Unsplash 图片资源

## 功能特性

### 首页功能

1. **导航栏** - 支持滚动时的悬浮效果
2. **Hero 区域** - 带有浮动图片和统计标签的视觉区
3. **跑马灯** - 展示荣誉和成就
4. **品牌墙** - 展示合作品牌
5. **作品案例** - 4个案例卡片，支持悬停动画和模态框预览
6. **服务菜单** - 展示服务项目和价格
7. **媒体资源管理系统** - 完整的文件上传功能
8. **公司介绍** - 关于我们和团队照片
9. **联系方式** - 电话、邮箱和微信二维码
10. **页脚** - 版权信息和备案号

### 媒体资源管理系统

- ✅ 支持拖拽上传
- ✅ 支持点击选择文件
- ✅ 支持批量上传
- ✅ 文件格式验证（JPG、PNG、GIF、MP4、MOV）
- ✅ 文件大小验证（最大 100MB）
- ✅ 上传进度显示
- ✅ 文件预览功能（图片和视频）
- ✅ 错误处理和提示
- ✅ 文件删除功能

### 交互效果

- 滚动淡入动画
- 卡片悬停效果
- 模态框预览
- 导航栏滚动样式变化
- 响应式设计适配

## 浏览器兼容性

- ✅ Chrome (推荐)
- ✅ Firefox
- ✅ Safari
- ✅ Edge
- ✅ 移动端浏览器 (iOS Safari, Chrome Mobile)

## 部署方式

### 方式一：静态文件服务器（推荐）

#### 使用 Python（简单快速）

```bash
# Python 3
python -m http.server 8000

# Python 2
python -m SimpleHTTPServer 8000
```

然后在浏览器访问：`http://localhost:8000`

#### 使用 Node.js

```bash
# 全局安装 http-server
npm install -g http-server

# 在项目目录运行
http-server -p 8000
```

#### 使用 PHP

```bash
php -S localhost:8000
```

### 方式二：Nginx 部署

1. 将 `index.html` 文件上传到服务器
2. 配置 Nginx：

```nginx
server {
    listen 80;
    server_name your-domain.com;
    root /path/to/your/project;
    index index.html;

    location / {
        try_files $uri $uri/ =404;
    }
}
```

3. 重启 Nginx：`sudo nginx -s reload`

### 方式三：Apache 部署

1. 将 `index.html` 文件上传到服务器
2. 确保 Apache 已配置正确的文档根目录
3. 如果需要，可以创建 `.htaccess` 文件：

```apache
DirectoryIndex index.html
Options -Indexes
```

### 方式四：云服务部署

#### GitHub Pages

1. 创建 GitHub 仓库
2. 将 `index.html` 推送到仓库
3. 在仓库设置中启用 GitHub Pages

#### Vercel / Netlify

1. 注册账号
2. 导入项目或直接上传文件
3. 自动部署完成

#### 阿里云/腾讯云对象存储

1. 创建存储桶
2. 上传 `index.html`
3. 配置静态网站托管
4. 配置自定义域名（可选）

## 响应式断点

- 桌面端：> 1024px
- 平板端：768px - 1024px
- 移动端：< 768px

## 注意事项

1. **外部资源**：当前使用 Unsplash 图片和 Google Fonts，确保网络可访问
2. **CORS**：如果部署到生产环境，注意跨域问题
3. **上传功能**：当前上传是前端模拟，如需真实上传需要后端支持
4. **HTTPS**：生产环境建议使用 HTTPS

## 后端集成（可选）

如果需要实现真实的文件上传功能，需要：

1. 创建后端 API 接收文件
2. 实现文件存储（本地或云存储）
3. 更新前端 `validateAndUpload` 函数调用真实 API

示例（使用 fetch API）：

```javascript
async function validateAndUpload(file, fileItem) {
    // ... 验证代码 ...
    
    const formData = new FormData();
    formData.append('file', file);
    
    try {
        const response = await fetch('/api/upload', {
            method: 'POST',
            body: formData
        });
        // 处理响应
    } catch (error) {
        // 处理错误
    }
}
```

## 维护建议

- 定期更新依赖（如果有）
- 监控页面性能
- 收集用户反馈
- 备份重要文件

## 许可证

本项目仅供学习和参考使用。
