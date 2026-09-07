# 具身智能求职与面经

> 面向具身智能、机器人与 Physical AI 岗位的一站式中文求职资料库：持续整理招聘信息、真实面经高频题、精炼答案与工程实践要点。

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](https://github.com/YUAI-X/https-github.com-new-name-Embodied-AI-Interview-Guide/pulls)

## 快速入口

| 内容 | 适合谁 | 入口 |
| --- | --- | --- |
| 招聘信息 | 正在寻找校招、实习或社招机会 | [每日招聘汇总](data/jobs.md) |
| 面试题库 | 准备 VLA、强化学习、机器人控制、感知导航等技术面试 | [八卷题库](#面试题库) |
| 网页版 | 希望使用折叠题目进行自测 | [本地网页入口](docs/index.html) |

招聘信息来自飞书多维表格「每日招聘汇总」，当前仓库仅同步公开招聘记录，不包含“社群”表内容。岗位可能随时关闭，请以原始招聘页面为准。

## 面试题库

题库按技术主题拆成八卷，共 425 道主表及补充题，并包含约 19 道低频备选题。每题采用“精简答案 + 易错点”的形式，方便面试前自测和快速复盘。

| 卷 | 主题 | 题数 | 重点内容 |
| --- | --- | ---: | --- |
| [一](docs/interviews/01_basics.md) | 通识基础 | 55 | 深度学习、强化学习入门、机器人学、Attention、LayerNorm、Bellman、VAE |
| [二](docs/interviews/02_rl_algo.md) | 强化学习算法 | 50 | PPO、SAC、TD3、离线 RL、RLHF、GAE、DPO、GRPO |
| [三](docs/interviews/03_vla_il.md) | VLA / 模仿学习 | 77 | OpenVLA、π 系列、Diffusion Policy、Flow Matching、ACT、BC |
| [四](docs/interviews/04_world_sim.md) | 世界模型 / Sim2Real | 31 | Dreamer、V-JEPA、域随机化、Isaac Lab |
| [五](docs/interviews/05_engineering.md) | 工程落地 | 47 | VLA 部署、FSDP、数据飞轮、数值稳定性、优化器 |
| [六](docs/interviews/06_legged_control.md) | 腿足控制 / 遥操作 | 58 | MPC、WBC、RL Locomotion、PID、KF、EKF、LQR、IK |
| [七](docs/interviews/07_perception_nav.md) | 感知 / SLAM / 导航 | 67 | 点云、NeRF、Nav2、VLN、ObjectNav、SAM 2、A* |
| [八](docs/interviews/08_coding_systemdesign.md) | 编程 / 系统设计 | 40 | LeetCode 高频题、机器学习系统设计、机器人系统设计 |

## 推荐使用方法

1. 先在[招聘信息](data/jobs.md)中按招聘类型、方向和地点筛选目标岗位。
2. 根据岗位描述选择对应题卷，优先掌握 L1，再学习 L2、L3。
3. 看到题目先口述答案，再展开或查看正文；重点记录“易错”提示。
4. 面试结束后及时复盘，把新问题、考察重点和自己的回答补充进对应主题。

## 内容特点

- 真实题源：从公开面经中提炼反复出现的问题，同义题合并后按主题整理。
- 面向实战：覆盖 VLA、世界模型、强化学习、运动控制、SLAM、工程部署和系统设计。
- 快速复习：答案尽量精炼，并突出常见误区，适合碎片时间刷题。
- 招聘联动：把“找机会”和“准备面试”放在同一仓库，减少信息切换成本。
- 多端阅读：Markdown 适合 GitHub 浏览，HTML 版本支持题目折叠和移动端阅读。

## 项目结构

```text
.
├── data/jobs.md                 # 飞书招聘信息导出
├── docs/index.html              # 网页版入口
├── docs/interviews/             # 八卷面试题（Markdown + HTML）
├── images/                      # 项目预览图
├── notes/                       # 调研与补充笔记
└── tools/                       # 内容生成与渲染工具
```

## 数据更新

招聘表可通过 PowerShell 脚本重新同步：

```powershell
.\tools\export_feishu_jobs.ps1
```

运行前需要安装并登录 `lark-cli`，且拥有目标 Base 的字段与记录只读权限。脚本只导出「每日招聘汇总」，自动跳过空记录，不读取或提交「社群」表。

## 贡献

欢迎通过 [Issue](https://github.com/YUAI-X/https-github.com-new-name-Embodied-AI-Interview-Guide/issues) 或 [Pull Request](https://github.com/YUAI-X/https-github.com-new-name-Embodied-AI-Interview-Guide/pulls) 贡献：

- 新的公开招聘信息或失效链接反馈；
- 有公开来源的真实面试题；
- 答案纠错、工程实践补充和排版改进。

提交面试题时，请注明题目、岗位方向和公开来源。请勿提交个人隐私、群聊记录或未经许可的内部材料。

## 许可

[MIT License](LICENSE)
