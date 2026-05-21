# 🎮 SquadUp — Discord Game Scheduling Bot

**週次のゲーム募集・参加管理・日次チェックインを自動化する、サーバレス構成のDiscord Bot**

[![Python](https://img.shields.io/badge/Python-3.x-blue.svg)](https://www.python.org/)
[![AWS Lambda](https://img.shields.io/badge/AWS-Lambda-orange.svg)](https://aws.amazon.com/lambda/)
[![DynamoDB](https://img.shields.io/badge/AWS-DynamoDB-blue.svg)](https://aws.amazon.com/dynamodb/)
[![License](https://img.shields.io/badge/License-Proprietary-red.svg)]()

---

## 作成目的

固定コミュニティ内でのゲーム参加日程の確認や出欠管理を効率化するために作成した個人開発プロジェクトです。

従来は個人間のやり取りに依存しており、参加可否の把握や当日の参加状況確認に手間が発生していました。

SquadUp では、Discord 上で募集・参加登録・集計を行うことで、**コミュニティ内の予定調整を簡素化**することを目的としています。

---

## 主な機能

- **週次募集投稿** — 毎週月曜 12:30（JST）に自動投稿
- **参加ステータス管理** — ボタン操作で「参加 / 不参加 / 未定」を登録
- **日次チェックイン** — 毎日 18:30（JST）、土日は 8:30 にも実行
- **週次集計の自動化** — 参加状況を自動で集計・通知
- **複数コミュニティ対応** — DynamoDB による柔軟なデータ管理

---

## アーキテクチャ

### 構成図

![構成図](https://private-user-images.githubusercontent.com/258735080/595147220-a41c0170-25ed-40d4-ac9f-b35c83d9e949.png)

### AWSサービス

| サービス | 用途 |
|---|---|
| AWS Lambda | Bot ロジックの実行 |
| API Gateway | Discord Interaction の受信 |
| DynamoDB | 投票・参加データの永続化 |
| EventBridge Scheduler | 週次・日次の定期実行 |

### 外部サービス

| サービス | 用途 |
|---|---|
| Discord Interaction API | スラッシュコマンド・ボタン操作の受信 |
| Discord Webhook | 定期投稿・通知の送信 |
| Discord Bot API | Bot の管理 |
| Terraform | インフラのコード管理 |

---

## 設計改善履歴

### S3 → DynamoDB への移行

当初は投票データを S3 に保存していましたが、機能追加に伴い以下の要件が必要になったため DynamoDB に移行しました。

- 複数コミュニティへの対応
- 集計処理の効率化
- 二重投稿防止
- 柔軟なデータ検索

### Lambda の責務分離

保守性・拡張性向上のため、Lambda を以下の2つに分離しました。

- **Interaction Receiver Lambda** — Discord からのリクエスト受信
- **Aggregation Worker Lambda** — 集計・通知処理

---

## 今後の予定

- [ ] `/setup` コマンドの追加（導入後の設定をユーザーが実施できるように）
- [ ] 週次投稿・日次チェックインの実行タイミングをユーザーが設定できるように
- [ ] 日次チェックイン通知の閾値をユーザーが設定できるように
- [ ] 集計スロットのカスタマイズ対応（現在は平日1スロット・土日2スロット固定）

---

## ライセンス

All Rights Reserved © 2025 SquadUp



---
---


## English Version
ここから先は英語版のREADMEです。



# 🎮 SquadUp — Discord Game Scheduling Bot

**A serverless Discord bot for automating weekly game recruitment, participation management, and daily check-ins.**

[![Python](https://img.shields.io/badge/Python-3.x-blue.svg)](https://www.python.org/)
[![AWS Lambda](https://img.shields.io/badge/AWS-Lambda-orange.svg)](https://aws.amazon.com/lambda/)
[![DynamoDB](https://img.shields.io/badge/AWS-DynamoDB-blue.svg)](https://aws.amazon.com/dynamodb/)
[![License](https://img.shields.io/badge/License-Proprietary-red.svg)]()

---

## Purpose

This personal project was created to streamline schedule coordination and attendance management within fixed gaming communities.

Previously, availability checks and attendance confirmation depended on individual communication, which made it difficult to track who could participate and who would actually join on the day.

SquadUp aims to **simplify community scheduling** by handling recruitment, registration, and aggregation directly on Discord.

---

## Key Features

- **Weekly recruitment posts** — Automatically posted every Monday at 12:30 JST
- **Participation status tracking** — Button-based registration for Participating / Not Participating / Undecided
- **Daily check-ins** — Runs every day at 18:30 JST, with an additional run at 8:30 JST on weekends
- **Automated weekly summaries** — Automatically aggregates and notifies participation status
- **Multi-community support** — Flexible data management via DynamoDB

---

## Architecture

### AWS Services

| Service | Purpose |
|---|---|
| AWS Lambda | Executes bot logic |
| API Gateway | Receives Discord Interactions |
| DynamoDB | Persists voting and participation data |
| EventBridge Scheduler | Triggers weekly and daily scheduled tasks |

### External Services

| Service | Purpose |
|---|---|
| Discord Interaction API | Receives slash commands and button interactions |
| Discord Webhook | Sends scheduled posts and notifications |
| Discord Bot API | Manages the bot |
| Terraform | Infrastructure as code |

---

## Design Improvements

### Migration from S3 to DynamoDB

Initially, voting data was stored in S3. As new features were added, the following requirements became necessary, leading to a migration to DynamoDB.

- Support for multiple communities
- More efficient aggregation
- Prevention of duplicate weekly posts
- Flexible data querying

### Separation of Lambda Responsibilities

To improve maintainability and extensibility, the Lambda functions were separated into two:

- **Interaction Receiver Lambda** — Receives requests from Discord
- **Aggregation Worker Lambda** — Handles aggregation and notification processing

---

## Future Plans

- [ ] Add a `/setup` command so users can configure the bot after installation
- [ ] Allow users to configure the timing of weekly recruitment posts and daily check-ins
- [ ] Allow users to configure the notification threshold for daily check-ins
- [ ] Support customizable aggregation slots (currently fixed: 1 slot on weekdays, 2 slots on weekends)

---

## License

All Rights Reserved © 2025 SquadUp
