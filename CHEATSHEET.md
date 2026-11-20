# CHEATSHEET — Neovim / LazyVim (среда Ideanick)

> Актуально после применённых улучшений. Разделено на:
>
> 1. собственные маппинги, 2) стандартные LazyVim (не перекрытые), 3) перекрытия.

Обозначения:

- **Leader** — основная лидер-клавиша (по умолчанию пробел).
- **Alt** — клавиша Alt (Option на macOS).
- **Ctrl** — клавиша Control.
- **Shift** — клавиша Shift.
- Режимы: n — normal, i — insert, v — visual.

---

## 1. Собственные маппинги

### 1.1 Общие перемещения

| Клавиша | Режим | Действие                 |
| ------- | ----- | ------------------------ |
| Alt + j | n     | Переместить строку вниз  |
| Alt + k | n     | Переместить строку вверх |

### 1.2 PNPM Monorepo

| Клавиша        | Действие                                   |
| -------------- | ------------------------------------------ |
| Leader + p + r | Показать PNPM root                         |
| Leader + p + p | Показать текущий пакет (`@ideanick/...`)   |
| Leader + p + u | `pnpm update`                              |
| Leader + p + b | Build текущего пакета                      |
| Leader + p + d | Dev текущего пакета                        |
| Leader + p + t | Test текущего пакета                       |
| Leader + p + l | Lint текущего пакета                       |
| Leader + t + c | `pnpm -r run typecheck` (TypeScript Check) |

### 1.3 Webapp / Backend

| Клавиша        | Действие                      |
| -------------- | ----------------------------- |
| Leader + w + d | Webapp Dev (`cwd = webapp`)   |
| Leader + w + b | Webapp Build                  |
| Leader + w + l | Webapp Lint                   |
| Leader + b + d | Backend Dev (`cwd = backend`) |
| Leader + b + b | Backend Build                 |

### 1.4 Neo-tree (файловое дерево)

| Клавиша    | Действие                        |
| ---------- | ------------------------------- |
| Leader + e | Плавающее дерево (float toggle) |
| Leader + z | Дерево слева (left toggle)      |
| Leader + x | Дерево справа (right toggle)    |

### 1.5 Терминал

| Клавиша              | Режим | Действие                 |
| -------------------- | ----- | ------------------------ |
| Leader + t + t       | n     | ToggleTerm float         |
| Leader + h + h       | n     | ToggleTerm horizontal    |
| Ctrl + обратный слеш | n     | Открыть/закрыть терминал |

### 1.6 Мультикурсор (vim-visual-multi)

**Нормальный режим:**

| Клавиша                      | Действие                                               |
| ---------------------------- | ------------------------------------------------------ |
| Leader + m + c               | Find Under / Find Subword Under (запуск мультикурсора) |
| Leader + m + m               | Select all matches                                     |
| Leader + m + n               | Add cursor next                                        |
| Ctrl + Shift + стрелка вниз  | Add Cursor Down                                        |
| Ctrl + Shift + стрелка вверх | Add Cursor Up                                          |
| Ctrl + b                     | Select All                                             |
| двойной слеш (`//`)          | Start Regex Search                                     |

**Визуальный режим (когда мультикурсор активен):**

| Клавиша  | Действие       |
| -------- | -------------- |
| Ctrl + m | Visual All     |
| Ctrl + d | Visual Add     |
| Ctrl + f | Visual Find    |
| Ctrl + n | Visual Cursors |

> Ctrl + d в normal-режиме больше не занят мультикурсором — возвращён прокрутке LazyVim.

### 1.7 blink.cmp (режим вставки)

| Клавиша     | Действие                                  |
| ----------- | ----------------------------------------- |
| Enter       | Accept (подтвердить выбор)                |
| Tab         | Select next / snippet forward / fallback  |
| Shift + Tab | Select prev / snippet backward / fallback |
| Ctrl + j    | Select next                               |
| Ctrl + k    | Select prev                               |
| Ctrl + w    | Show (показать автодополнение)            |
| Ctrl + e    | Hide (скрыть автодополнение)              |

---

## 2. Стандартные LazyVim (не перекрытые)

### 2.1 LSP

| Клавиша           | Режим | Действие                       |
| ----------------- | ----- | ------------------------------ |
| g + d             | n     | Goto Definition                |
| g + r             | n     | References                     |
| g + I             | n     | Goto Implementation            |
| g + y             | n     | Goto Type Definition           |
| g + D             | n     | Goto Declaration               |
| K                 | n     | Hover                          |
| g + K             | n     | Signature Help                 |
| Ctrl + k          | i     | Signature Help                 |
| Leader + c + a    | n, v  | Code Action                    |
| Leader + c + c    | n, v  | Run Codelens                   |
| Leader + c + C    | n     | Refresh & Display Codelens     |
| Leader + c + r    | n     | Rename                         |
| Leader + c + R    | n     | Rename File                    |
| Leader + c + A    | n     | Source Action                  |
| ] + ] / [ + [     | n     | Next / Prev Reference          |
| Alt + n / Alt + p | n     | Next / Prev Reference (с jump) |
| Leader + c + l    | n     | Lsp Info                       |

### 2.2 Файлы / поиск / буферы

| Клавиша                         | Действие                         |
| ------------------------------- | -------------------------------- |
| Leader + пробел                 | Find Files (Root Dir)            |
| Leader + слеш                   | Grep (Root Dir)                  |
| Leader + f + f / Leader + f + F | Find Files (root / cwd)          |
| Leader + f + g                  | Find Files (git-files)           |
| Leader + f + r / Leader + f + R | Recent (root / cwd)              |
| Leader + f + b / Leader + f + B | Buffers / Buffers (all)          |
| Leader + Shift + e              | Explorer Snacks (cwd)            |
| Leader + s + g / Leader + s + G | Grep (root / cwd)                |
| Leader + s + d / Leader + s + D | Diagnostics / Buffer Diagnostics |
| Leader + s + k                  | Keymaps                          |
| Leader + s + h                  | Help Pages                       |
| Leader + s + r                  | Resume                           |
| Leader + s + w                  | Visual selection or word         |
| Leader + s + t                  | Todo                             |
| Leader + s + T                  | Todo / Fix / Fixme               |

### 2.3 Git / окна / вкладки / утилиты

| Клавиша                                              | Действие                      |
| ---------------------------------------------------- | ----------------------------- |
| Leader + g + g / Leader + g + G                      | Lazygit (cwd / root)          |
| Leader + g + s                                       | Git Status                    |
| Leader + g + d / Leader + g + D                      | Git Diff (hunks / origin)     |
| Leader + q + q                                       | Quit all                      |
| Leader + w + w                                       | Other window                  |
| Leader + w + минус / Leader + w + вертикальная черта | Split below / right           |
| Leader + Tab + ] / Leader + Tab + [                  | Next / Prev Tab               |
| Leader + Tab + d                                     | Close Tab                     |
| Leader + b + ] / Leader + b + [                      | Next / Prev Buffer            |
| Leader + обратный апостроф                           | Switch to Other Buffer        |
| Leader + c + m                                       | Mason                         |
| Leader + f + n                                       | New File                      |
| Leader + x + l / Leader + x + q                      | Location List / Quickfix List |
| Leader + t + f                                       | Format on Save (toggle)       |
| Leader + t + s                                       | Spelling (toggle)             |
| Leader + t + w                                       | Word Wrap (toggle)            |
| Leader + t + n                                       | Line Numbers (toggle)         |
| Leader + t + d                                       | Diagnostics (toggle)          |

### 2.4 Терминал (LazyVim default)

| Клавиша                         | Действие                                |
| ------------------------------- | --------------------------------------- |
| Leader + o + t / Leader + o + T | Terminal (root / cwd) — Snacks terminal |
| Esc + Esc (в терминале)         | Выйти в normal mode                     |

---

## 3. Перекрытия (твои маппинги vs LazyVim)

| Твоя клавиша   | Что перекрыто в LazyVim        | Куда делось стандартное действие  |
| -------------- | ------------------------------ | --------------------------------- |
| Leader + e     | Explorer Snacks (cwd)          | Доступно на Leader + Shift + e    |
| Leader + w + d | Delete window                  | — (переназначь при необходимости) |
| Leader + b + d | Delete Buffer (mini.bufremove) | —                                 |
| Leader + b + b | Switch to Other Buffer         | Leader + обратный апостроф        |
| Leader + t + c | Toggle Conceal                 | —                                 |
| Leader + t + t | Htop (в некоторых сборках)     | `:Term` или переназначь           |

> Если какое-то из перекрытий критично — перенеси свою команду
> на заглавную букву (Leader + Shift + b + d, Leader + Shift + w + d, Leader + Shift + t + c и т.п.).

---

## 4. Быстрый старт

1. Открыть файл: Leader + пробел
2. Найти по тексту: Leader + слеш
3. Дерево файлов: Leader + e (float) / Leader + z (left) / Leader + x (right)
4. Терминал: Leader + t + t (float) / Leader + h + h (horizontal)
5. Форматирование: сохранить файл (format_on_save)
6. Мультикурсор: Leader + m + c на слове, затем Leader + m + n для добавления
7. Git: Leader + g + g (Lazygit)
8. Диагностика: Leader + s + d (проект) / Leader + s + D (буфер)

## 5. Проверка здоровья Neovim

| <th align='center'>Команда</th> | <th align='center'>Что делает</th>                                     | <th align='center'>Когда использовать</th>        |
| ------------------------------- | ---------------------------------------------------------------------- | ------------------------------------------------- |
| :LazyHealth                     | Загружает все плагины (включая ленивые) и запускает :checkhealth       | Для полной и точной диагностики                   |
| :checkhealth                    | Запускает работу Neovim и всех плагинов                                | Для быстрой общей проверки                        |
| :checkhealth lazy               | Проверяет только сам менеджер                                          | Если есть подозрения на работу менедлера плагинов |
| :checkhealth lazyvim            | Провурка специфичная для LazyVim (версия, Treesitter, внешние утилиты) | Для точной проверки требований LazyVim            |
