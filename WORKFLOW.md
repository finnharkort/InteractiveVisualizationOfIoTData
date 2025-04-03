# Team Workflow for Power BI Report  

This document explains how we manage changes to the Power BI report.  

---

## 1️⃣ Create a New Branch  
- **Branch Naming:** Create a new branch with the name `feature-featurename`.  
  Example: `feature-new-dashboard`, `feature-fix-performance`, etc.

---

## 2️⃣ Work on the PBIX File  
- **Experiment in PBIX**: Make changes and experiment with your Power BI report under the `/pbix/` folder.  
- **Don't commit the `.pbix` file in your PR** – this file will be updated separately by the Merge Master.

---

## 3️⃣ Document Your Changes  
- **Code Changes:**  
  - When you implement a change, extract any new or updated DAX, M queries, or SQL code and place them in the `/code/` folder.  
  - Example structure for `/code/`:
  
    /code  
├── dax/  
│   └── CalculatedTable1.dax     
├── power-query/  
│   └── query.m         
├── sql/  
│   └── DatExpOrder.sql 



- **Descriptions & Screenshots:**  
  - Write a **description** of what was changed in **Markdown** (`.md`) format and store it in `/changes/`.  
  - If applicable, include **screenshots** to help illustrate the changes.  
  - Example structure for `/changes/`:
  
    ```plaintext
    /changes
    ├── 2025-04-03-new-dashboard.md   # Description of the change
    ├── 2025-04-03-new-dashboard.png  # Screenshot of the update
    ```

- **Use ChatGPT** (if needed) to help write your descriptions clearly and concisely.  

---

## 4️⃣ Create a Pull Request (PR)  
- **Push your branch** to GitHub.  

- **Open a Pull Request (PR):**  
  - **Base Branch:** `main`  
  - **Feature Branch:** `feature-featurename`  
  - **Include the `/code/` and `/changes/` folders in the PR.**  
  - **DO NOT include the `/pbix/` folder in the PR** – the `.pbix` file will be updated separately.  

---

## 5️⃣ Merging and Implementing Changes in PBIX  
- **Merge Master Responsibility:**  
  - The Merge Master (whoever is responsible) will review the PR and manually implement the changes in the `main.pbix` file.  
  - After updating `main.pbix`, the Merge Master will commit the updated `.pbix` to the `/pbix/` folder.  

- **Final PR Steps:**  
  - Once the changes are successfully merged and the `.pbix` file is updated, the PR can be closed.  
  - The Merge Master should also update the `CHANGELOG.md` to document the change.

---

## 6️⃣ Notes  
- **DO NOT commit `.pbix` files in the PR**—these will be handled manually.  
- If you're unsure about something, ask the team before merging.  
- **Use meaningful commit messages** and be clear about what’s changing.  
- **Keep feature branches short-lived**—merge ASAP to avoid big differences.

---
