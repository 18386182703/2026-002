# PowerShell Server Startup Script
Write-Host "Starting local server..." -ForegroundColor Green
Write-Host ""
Write-Host "Server will be available at: http://localhost:8000" -ForegroundColor Cyan
Write-Host "Press Ctrl+C to stop the server" -ForegroundColor Yellow
Write-Host ""

# Try Python first
try {
    Write-Host "Trying to start Python server..."
    python -m http.server 8000
    exit 0
} catch {
    Write-Host "Python not found, trying alternative..." -ForegroundColor Yellow
}

# Fallback to simple PowerShell server
Write-Host "Starting PowerShell simple server..." -ForegroundColor Cyan
$listener = New-Object System.Net.HttpListener
$listener.Prefixes.Add('http://localhost:8000/')
$listener.Start()

try {
    while ($listener.IsListening) {
        $context = $listener.GetContext()
        $request = $context.Request
        $response = $context.Response
        
        # 安全处理文件路径，防止路径遍历攻击
        $requestPath = $request.Url.LocalPath -replace '^/', ''
        $localPath = Join-Path $PWD $requestPath
        
        # 规范化路径并验证访问范围限制在项目目录内
        try {
            $resolvedPath = Resolve-Path $localPath -ErrorAction Stop
            if (-not $resolvedPath.Path.StartsWith($PWD.Path)) {
                $response.StatusCode = 403
                $response.Close()
                continue
            }
            $localPath = $resolvedPath.Path
        } catch {
            # 如果路径不存在或无法解析，使用默认的index.html
            $localPath = Join-Path $PWD 'index.html'
        }
        
        # 再次验证最终路径
        if (-not $localPath.StartsWith($PWD.Path)) {
            $response.StatusCode = 403
            $response.Close()
            continue
        }
        
        if (Test-Path $localPath) {
            $content = [System.IO.File]::ReadAllBytes($localPath)
            $response.ContentLength64 = $content.Length
            $response.OutputStream.Write($content, 0, $content.Length)
        } else {
            $response.StatusCode = 404
        }
        
        $response.Close()
    }
} finally {
    $listener.Stop()
}
