# Fraud & Suspicious Login Analysis (SQL)

## Overview

This project analyses login activity data using SQL to detect suspicious behaviour and potential security risks. It focuses on identifying patterns such as failed login attempts, unusual access times, and geographically inconsistent login activity.

## Objectives

* Detect suspicious login behaviour
* Identify potential brute-force attempts
* Detect impossible travel scenarios
* Build a rule-based risk scoring model

## Tools Used

* SQL Server Management Studio (SSMS)
* T-SQL (Window Functions, Aggregations, CASE)

## Key Features

### 1. Suspicious Behaviour Detection

* Identifies users with multiple failed login attempts
* Detects login activity during unusual hours (midnight to 6 AM)

### 2. Impossible Travel Detection

* Uses window functions (LAG) to compare login locations over time
* Flags users logging in from different locations within short time intervals

### 3. Risk Scoring Model

* Combines multiple behavioural indicators:

  * Failed login attempts
  * Number of login locations
  * Night-time activity
* Assigns a risk score and flags high-risk users

## Key Insights

* Successfully identified users exhibiting impossible travel patterns
* Detected repeated failed login attempts indicating potential brute-force attacks
* Highlighted high-risk users for further investigation

## Dataset

A sample dataset is included in `login_logs_sample_data.sql` to allow replication of the analysis.

## How to Run

1. Run the `login_logs_sample_data.sql` file to create and populate the dataset
2. Run the `fraud_login_analysis.sql` file to perform analysis
3. Review query outputs for insights
