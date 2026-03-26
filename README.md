# Campus Net Guard（Sanitized Release）

本仓库为校园网自动登录工具的**脱敏发布版本**，用于代码分发与复用。

## 项目说明

Campus Net Guard 用于在网络中断或会话失效后自动执行校园网认证，减少手动重复登录操作。

本发布版本已完成敏感信息清理：

- 不包含任何真实账号、密码或个人标识信息
- 默认提供模板化配置文件，需使用者自行填写
- 不影响原始本地脚本与私有配置

## 目录结构

- `campus_net_guard.py`：主程序
- `campus-net-guard.json`：配置模板
- `run_campus_net_guard.ps1`：后台启动脚本
- `install_campus_net_routes.ps1`：校园网直连路由安装脚本
- `install_campus_net_task.ps1`：开机自启动任务安装脚本

## 快速开始

### 1. 配置参数

编辑 `campus-net-guard.json`：

```json
{
  "account": "your_account",
  "password": "your_password",
  "domain": "@cucc",
  "ac_id": "17"
}
```

### 2. 单次测试运行

```powershell
python campus_net_guard.py --once
```

### 3. 常驻运行

```powershell
python campus_net_guard.py
```

## 安全与发布建议

- 请勿将真实凭据写入并提交到仓库
- 建议在本地使用独立私有配置文件存放敏感字段
- 推送前请检查变更，确保未包含日志、缓存或隐私数据

## 适用环境

- 操作系统：Windows（PowerShell）
- 运行时：Python 3.x

## 免责声明

本项目仅用于合法、合规的网络认证自动化场景。使用者需自行确保符合学校与网络服务提供方相关规定。