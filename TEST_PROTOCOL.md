# FlowHub Manual Test Protocol

This document outlines the User Stories and manual verification procedures for FlowHub. Every feature implementation must be validated against these stories before being marked complete.

---

## 🔐 Epic 1: Authentication & Identity

### **US 1.1: User Registration & Login**
**Story:** As a user, I want to create an account and log in securely so that my tasks are private and persisted.
- **Pre-conditions:** Backend server is running.
- **Test Steps:**
    1. Open the app.
    2. Navigate to the Registration page.
    3. Enter valid email and password.
    4. Observe redirect to Home Page.
    5. Restart app and verify session persists.
- **Expected Result:** JWT token is stored securely; user is redirected to the dashboard.
- **Status:** ✅ Verified (Automated + Manual)

---

## 🗂️ Epic 2: Task Management & Side Panel

### **US 2.1: Local-First Task Creation**
**Story:** As a user, I want to create tasks instantly, even when offline.
- **Pre-conditions:** App is open.
- **Test Steps:**
    1. Turn off internet/simulate offline mode.
    2. Add a new task in the Inbox.
    3. Observe the task appears immediately in the UI.
- **Expected Result:** Task is written to Isar database and UI updates optimistically.
- **Status:** ✅ Verified

### **US 2.2: Hierarchical Sub-tasks**
**Story:** As a user, I want to nest tasks inside each other to break down complex work.
- **Pre-conditions:** A parent task exists.
- **Test Steps:**
    1. Create a "Parent Task".
    2. Create a "Child Task" and assign it to the parent.
    3. Toggle the expand/collapse arrow on the Parent Task.
- **Expected Result:** Child tasks are correctly indented and visibility can be toggled.
- **Status:** ✅ Verified

### **US 2.3: Contextual Filtering**
**Story:** As a user, I want to filter my tasks by "Today", "Inbox", or "Overdue" to focus on what matters.
- **Pre-conditions:** Tasks exist with different due dates.
- **Test Steps:**
    1. Select "Today" filter in Side Panel.
    2. Verify only tasks due today appear.
    3. Select "Inbox" and verify tasks without dates appear.
- **Expected Result:** List updates instantly based on selected filter.
- **Status:** ✅ Verified

### **US 2.4: Hierarchical Tagging & Filtering**
**Story:** As a user, I want to add tags with categories (e.g. customer/RIT) to my tasks and filter the view by these tags temporarily.
- **Pre-conditions:** Tasks with tags exist.
- **Test Steps:**
    1. Open the Side Panel and expand the "Tags" section.
    2. Tap on a category (e.g. "customer") or a specific tag name (e.g. "RIT").
    3. Observe the task list filters to only show tasks with that tag.
    4. Tap the "X" on the active filter chip to clear the filter.
- **Expected Result:** Task list updates to show only matching tasks; tags are displayed with colors at the end of each todo item.
- **Status:** ✅ Verified

### **US 2.5: Importance Levels**
**Story:** As a user, I want to assign importance levels (Critical, High, Medium, Low) to my tasks so that I can visually prioritize my work.
- **Pre-conditions:** Tasks with different importance levels exist.
- **Test Steps:**
    1. Observe the task list.
    2. Identify tasks with different colors/indicators.
- **Expected Result:** Tasks show a vertical color strip and an icon matching their importance: Red (Critical), Orange (High), Blue (Medium), Grey (Low).
- **Status:** ✅ Verified

---

## 📅 Epic 3: Main Calendar & Temporal Flow

### **US 3.1: Multi-Mode Calendar Display**
**Story:** As a user, I want to see my schedule in Day, Week, and Month views.
- **Pre-conditions:** App is on Home Page.
- **Test Steps:**
    1. Use the toolbar to switch to "Week".
    2. Use the toolbar to switch to "Month".
    3. Toggle "24 Hour Format" in settings/knobs.
- **Expected Result:** Grid layout updates to show 7 columns for Week and a full grid for Month. Time labels reflect the selected format.
- **Status:** ✅ Verified

### **US 3.2: Current Time Context**
**Story:** As a user, I want to see where I am in the current day relative to my schedule.
- **Pre-conditions:** Day or Week view is active.
- **Test Steps:**
    1. Open the Day view.
    2. Observe the red line position.
- **Expected Result:** A red horizontal line indicates the current system time.
- **Status:** ✅ Verified

### **US 3.3: Calendar Navigation**
**Story:** As a user, I want to navigate to past or future dates to plan ahead.
- **Pre-conditions:** Toolbar is visible.
- **Test Steps:**
    1. Tap chevron-left/right.
    2. Verify date headers and month label update.
    3. Tap "Today" button.
- **Expected Result:** Reference date updates correctly; "Today" button centers the view on the current date.
- **Status:** ✅ Verified

---

## 🔄 Epic 1.6: Sync Engine (Pending)

### **US 1.6.1: Conflict Resolution**
**Story:** As a user, I want external changes (e.g. from GitHub) to override my local state if they conflict.
- **Pre-conditions:** External integration active.
- **Test Steps:**
    1. Modify task title locally.
    2. Simulate server push with a different title.
- **Expected Result:** Local title is replaced by the remote title (Remote-Overrides-Local).
- **Status:** ⏳ Pending Implementation

---

## 🗺️ Epic 4: Plugin Architecture & Integrations

### **US 4.1: Plugin Configuration UI**
**Story:** As a user, I want to see a list of available plugins and their connection status so that I can manage my external integrations.
- **Pre-conditions:** App is on Home Page.
- **Test Steps:**
    1. Tap the "Settings" button at the bottom of the Side Panel.
    2. Verify "Account Settings" page opens.
    3. Observe the list of plugins: GitHub, MS ToDo, Flagged Emails, Frappe.
    4. Tap "Connect" on a plugin.
- **Expected Result:** Connection status updates to "Connected" (simulated for now).
- **Status:** ✅ Verified

---

## 🛠️ Maintenance Rule
Every new feature MUST add a corresponding User Story and Test Case to this protocol.
