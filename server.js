const http = require('http');
const fs = require('fs');
const path = require('path');

const PORT = 8765;

const MIME_TYPES = {
  '.html': 'text/html',
  '.js': 'text/javascript',
  '.css': 'text/css',
  '.json': 'application/json',
  '.png': 'image/png',
  '.jpg': 'image/jpeg',
  '.gif': 'image/gif',
  '.svg': 'image/svg+xml',
  '.ico': 'image/x-icon'
};

const server = http.createServer((req, res) => {
  // 安全处理文件路径，防止路径遍历攻击
  let filePath = path.normalize(path.join(__dirname, '.' + req.url));
  
  // 确保访问范围限制在项目目录内
  if (!filePath.startsWith(__dirname)) {
    res.writeHead(403);
    res.end('Forbidden');
    return;
  }

  // 如果是根路径，默认返回index.html
  if (filePath === __dirname || filePath === __dirname + path.sep) {
    filePath = path.join(__dirname, 'index.html');
  }

  const extname = String(path.extname(filePath)).toLowerCase();
  const contentType = MIME_TYPES[extname] || 'application/octet-stream';

  fs.readFile(filePath, (error, content) => {
    if (error) {
      if(error.code === 'ENOENT') {
        // 文件不存在时返回index.html（SPA路由支持）
        fs.readFile(path.join(__dirname, 'index.html'), (error, content) => {
          res.writeHead(200, { 'Content-Type': 'text/html' });
          res.end(content, 'utf-8');
        });
      } else {
        res.writeHead(500);
        res.end('Sorry, check with the site admin for error: '+error.code+' ..\n');
      }
    } else {
      res.writeHead(200, { 'Content-Type': contentType });
      res.end(content, 'utf-8');
    }
  });
});

server.listen(PORT, () => {
  console.log(`Server running at http://localhost:${PORT}/`);
  console.log('Press Ctrl+C to stop the server');
});
