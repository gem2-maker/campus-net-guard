# Campus Net Guard（脱敏发布版）

这是**校园网自动登录脚本的脱敏发布副本**。

- ✅ 已移除真实账号密码
- ✅ 本仓库只包含模板配置
- ✅ 不影响你电脑上的原始脚本

---

## 文件说明

- `campus_net_guard.py`：主程序
- `campus-net-guard.json`：配置模板（需自行填写）
- `run_campus_net_guard.ps1`：后台启动脚本
- `install_campus_net_routes.ps1`：安装校园网直连路由
- `install_campus_net_task.ps1`：安装开机自启任务

---

## 快速使用

### 1) 填配置
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

---

## 安全说明

- 本发布版不包含你的真实凭据
- 仅你本机私有目录中的配置文件可写入真实账号密码
- 若要上传 GitHub，请确认不要提交含真实密码的配置文件

---

## 备注

如果你需要，我可以再补一版：
- `.gitignore`（默认忽略本地真实配置和日志）
- `LICENSE`
- 常见问题（FAQ）
