# SquadUp

週次のゲーム募集・コミュニティ活動を管理するための、サーバレス構成のDiscord Botです。

## 概要

SquadUpは、特定のメンバーでゲームをすることが多い、小・中規模コミュニティ向けのDiscord Botです。

主に以下をサポートします。

- 週次のゲーム募集
- 参加状況の管理
- 日次チェックイン
- 週次集計の自動化

AWS Lambda と DynamoDB を中心としたサーバレス構成で実装しています。

---

## 主な機能

- 週次募集投稿
- メンバーの参加状況可視化
- ボタンによる参加・不参加・未定のステータス登録
- 日次チェックイン機能
- 週次集計の自動化
- コミュニティ向けのスケジュール管理支援

---

## 構成

### 構成図

<img width="4728" height="6008" alt="image" src="https://github.com/user-attachments/assets/a41c0170-25ed-40d4-ac9f-b35c83d9e949" />

### AWSサービス

- AWS Lambda
- API Gateway
- DynamoDB
- EventBridge Scheduler

### 外部サービス

- Discord API
  - Interaction API
  - Webhook
  - Bot API

---

## 設計改善履歴

### S3からDynamoDBへの移行

当初は、投票データをS3に保存していました。

しかし、Botの機能追加に伴い、以下の要件が必要になりました。

- 複数コミュニティへの対応
- 集計処理の効率化
- 二重投稿防止
- 柔軟なデータ検索

上記に伴い、データ保存先をDynamoDBへ移行しました。

### Lambdaの責務分離

アプリケーションのLambdaを以下のように分離しました。

- Interaction Receiver Lambda
- Aggregation Worker Lambda

これにより、以下を改善しました。

- 保守性
- 運用時の見通し
- 拡張性

---

## 今後の予定

- `/setup` コマンドを追加し、ユーザーが導入後の設定を実施できるようにする
- 日次チェックイン通知の閾値を、ユーザーが設定できるようにする
- 集計項目スロットのデフォルト設定を、ユーザーが設定できるようにする
  - 平日：時間指定なしの1スロット
  - 土日：昼・夜の2スロット

---

## 作成目的

固定コミュニティ内でのゲーム参加日程の確認や出欠管理を効率化するために作成した個人開発プロジェクトです。

従来は個人間のやり取りに依存しており、参加可否の把握や当日の参加状況確認に手間が発生していました。

SquadUpでは、Discord上で募集・参加登録・集計を行うことで、コミュニティ内の予定調整を簡素化することを目的としています。



---



## English Version
The following is an English version of the README.



# SquadUp

A serverless Discord bot for managing weekly game sessions and community activities.

## Overview

SquadUp is a Discord bot designed for small to medium-sized gaming communities where members frequently play together.

It primarily supports the following features:

- Weekly game recruitment
- Participation status tracking
- Daily check-ins
- Automated weekly summaries

The bot is implemented using a serverless architecture centered around AWS Lambda and DynamoDB.

---

## Key Features

- Weekly game recruitment posts
- Participation status tracking for each week
- Button-based status registration
  - Participating
  - Not participating
  - Undecided
- Daily check-in feature
- Automated weekly summaries
- Schedule management support for gaming communities

---

## Architecture

### AWS Services

- AWS Lambda
- API Gateway
- DynamoDB
- EventBridge Scheduler

### External Services

- Discord API
  - Interaction API
  - Webhooks
  - Bot API

---

## Design Improvements

### Migration from S3 to DynamoDB

Initially, voting data was stored in S3.

However, as new features were added, the following requirements became important:

- Support for multiple communities
- More efficient aggregation
- Prevention of duplicate weekly posts
- Flexible data querying

As a result, the data storage layer was migrated to DynamoDB.

### Separation of Lambda Responsibilities

The application was separated into the following Lambda functions:

- Interaction Receiver Lambda
- Aggregation Worker Lambda

This improved:

- Maintainability
- Operational visibility
- Extensibility

---

## Future Plans

- Add a `/setup` command so users can configure the bot after installation.
- Allow users to configure the threshold for daily check-in notifications.
- Improve the flexibility of aggregation slots so users can customize default schedules.
  - Weekdays: 1 slot with no specific time
  - Weekends: 2 slots for daytime and nighttime

---

## Purpose

This personal project was created to streamline schedule coordination and attendance management within fixed gaming communities.

Previously, availability checks and attendance confirmation depended on individual communication, which made it difficult to track who could participate and who would actually join on the day.

SquadUp aims to simplify community scheduling by handling recruitment, registration, and aggregation directly on Discord.
