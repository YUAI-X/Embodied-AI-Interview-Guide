<h1 align="center">具身智能求职与面经</h1>

<p align="center">面向具身智能、机器人与 Physical AI 岗位的一站式中文求职资料库</p>

<p align="center">
  <a href="https://winstonjq.github.io/embodied-interview-qa/"><strong>在线刷题</strong></a> ·
  <a href="https://github.com/YUAI-X/Embodied-AI-Interview-Guide/blob/master/data/jobs.md"><strong>求职信息</strong></a> ·
  <a href="https://github.com/YUAI-X/Embodied-AI-Interview-Guide/issues"><strong>参与贡献</strong></a>
</p>

<p align="center">
  <a href="LICENSE"><img src="https://img.shields.io/badge/License-MIT-blue.svg" alt="MIT License"></a>
  <a href="https://github.com/YUAI-X/Embodied-AI-Interview-Guide/pulls"><img src="https://img.shields.io/badge/PRs-welcome-brightgreen.svg" alt="PRs Welcome"></a>
</p>

## 面经刷题

<p align="center">
  <a href="https://winstonjq.github.io/embodied-interview-qa/"><strong>打开在线面经题库 →</strong></a>
</p>

<table align="center">
  <tr>
    <td align="center"><strong>8</strong><br>专题卷</td>
    <td align="center"><strong>425</strong><br>面经题</td>
    <td align="center"><strong>54</strong><br>手撕代码题</td>
    <td align="center"><strong>≈19</strong><br>低频备选题</td>
  </tr>
</table>

题库覆盖从基础理论到真机工程落地的完整面试链路。每题采用“精简答案 + 易错点”的形式，适合面试前自测和快速复盘。

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

## 求职信息

[**查看具身智能求职信息（按发布日期从新到旧）→**](https://github.com/YUAI-X/Embodied-AI-Interview-Guide/blob/master/data/jobs.md)

## 推荐使用方法

1. 打开[在线面经题库](https://winstonjq.github.io/embodied-interview-qa/)，根据目标岗位选择对应题卷。
2. 优先掌握 L1，再学习 L2、L3；看到题目先口述答案，再展开查看答案和易错点。
3. 在[求职信息](https://github.com/YUAI-X/Embodied-AI-Interview-Guide/blob/master/data/jobs.md)中从最新日期向前浏览，筛选目标岗位。
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
├── data/jobs.md                 # 按发布日期倒序排列的求职信息
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

脚本只导出「每日招聘汇总」，自动跳过空记录，并按发布日期从新到旧排列；不读取或提交「社群」表。

## 贡献

欢迎通过 [Issue](https://github.com/YUAI-X/Embodied-AI-Interview-Guide/issues) 或 [Pull Request](https://github.com/YUAI-X/Embodied-AI-Interview-Guide/pulls) 贡献公开招聘信息、真实面试题、答案纠错和工程实践补充。

请勿提交个人隐私、群聊记录或未经许可的内部材料。

## 许可

[MIT License](LICENSE)
