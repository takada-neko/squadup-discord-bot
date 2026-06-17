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
> [!NOTE]
> The Terraform in this repository is a **learning sample** meant to illustrate the structure, and does not reflect the actual production configuration values. Because SquadUp is hosted on the operator's own AWS environment (a hosting model rather than a distributed one), the IaC is not intended to be deployed or reproduced as-is.

<img width="700" alt="image" src="https://github.com/user-attachments/assets/d2ee3893-2e9d-43e9-938a-7d6490eb0ae9" />
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