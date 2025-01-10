# QUBE Project for AIQUE Exam

A simple Flutter UI from Figma for a job exam, using Async Redux for state management and Drift for database

## Steps to run
1. Update to latest Flutter version
2. Run `flutter pub get`
3. Run `flutter pub run build_runner build --delete-conflicting-outputs`

## Features
- Async Redux
- Drift
- Freezed

## Screenshots

### Step 1

| Loading State                       | Step 1 Page                  |
|-------------------------------------|------------------------------|
| ![](/screenshots/loading_state.png) | ![](/screenshots/step_1.png) |

### Step 2

| Step 2 Page                  | Errors                             | Valid                              |
|------------------------------|------------------------------------|------------------------------------|
| ![](/screenshots/step_2.png) | ![](/screenshots/step_2_error.png) | ![](/screenshots/step_2_valid.png) |

| Posting                              | Posted                              |
|--------------------------------------|-------------------------------------|
| ![](/screenshots/step_2_posting.png) | ![](/screenshots/step_2_posted.png) |
