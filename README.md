[English](README.en.md) | **日本語**
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
> [!NOTE]
> 本リポジトリに含まれる Terraform は、構成を理解するための **学習用サンプル** です。本番稼働している環境の設定値そのものではありません。SquadUp は Bot を運用者の AWS 環境でホストする方式（ホスティング型）のため、IaC をそのまま配布・再現する前提では作られていません。

<img width="700" alt="image" src="https://github.com/user-attachments/assets/d2ee3893-2e9d-43e9-938a-7d6490eb0ae9" />

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


