# Campus Net Guard

Campus Net Guard 是一个校园网自动认证脚本，用于在连接中断或会话失效后自动执行登录流程。

## 功能概览

- 自动检测并执行校园网认证
- 支持单次执行与常驻运行
- 提供开机自启与路由安装脚本（Windows）

## 项目结构

- `campus_net_guard.py`：主程序
- `campus-net-guard.json`：配置文件模板
- `run_campus_net_guard.ps1`：后台启动脚本
- `install_campus_net_routes.ps1`：校园网直连路由安装脚本
- `install_campus_net_task.ps1`：开机自启任务安装脚本

## 快速开始

### 1) 配置参数

编辑 `campus-net-guard.json`：

```json
{
  "account": "your_account",
  "password": "your_password",
  "domain": "@cucc",
  "ac_id": "17"
}
```

### 2) 单次测试

```powershell
python campus_net_guard.py --once
```

### 3) 常驻运行

```powershell
python campus_net_guard.py
```

## 环境要求

- Windows + PowerShell
- Python 3.x

## 安全说明

- 不要将真实账号密码提交到仓库
- 建议将敏感配置保存在本地私有文件中
- 推送前请检查是否包含日志或隐私数据

## 免责声明

本项目仅用于合法合规的网络认证自动化场景。请自行确认使用行为符合学校及网络服务提供方相关规定。