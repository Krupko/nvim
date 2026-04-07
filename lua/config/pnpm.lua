-- ~/.config/nvim/lua/config/pnpm.lua
-- Настройка для PNPM монорепы

-- Проверка доступности pnpm
if vim.fn.executable("pnpm") == 0 then
  vim.notify("pnpm not found in PATH. Plugin pnpm-monorepo will not work.", vim.log.levels.ERROR)
  return
end

local function get_pnpm_root()
  local markers = { "pnpm-workspace.yaml", ".git" }
  for _, marker in ipairs(markers) do
    local root = vim.fs.find(marker, { upward = true })[1]
    if root then
      return vim.fn.fnamemodify(root, ":h")
    end
  end
  vim.notify("pnpm-workspace.yaml not found, using current directory", vim.log.levels.WARN)
  return vim.fn.getcwd()
end

local function get_current_package()
  local current = vim.fn.getcwd()
  local root = get_pnpm_root()
  if current:find(root, 1, true) == 1 then
    local rel = current:sub(#root + 2)
    if rel:match("^webapp/") or rel:match("^backend/") then
      return rel:gsub("/.*", "")
    end
  end
  return nil
end

local function run_pnpm_filter(cmd)
  local pkg = get_current_package()
  local full_cmd = pkg and string.format("pnpm --filter @ideanick/%s %s", pkg, cmd) or cmd

  vim.system(full_cmd, { text = true }, function(obj)
    if obj.code ~= 0 then
      vim.notify("Command failed: " .. (obj.stderr or ""), vim.log.levels.ERROR)
    else
      vim.notify(obj.stdout or "Command executed successfully", vim.log.levels.INFO)
    end
  end)
end

-- Команды для монорепы
vim.api.nvim_create_user_command("PnpmRoot", function()
  print("PNPM root: " .. get_pnpm_root())
end, { desc = "Show PNPM root" })

vim.api.nvim_create_user_command("PnpmPackage", function()
  local pkg = get_current_package()
  if pkg then
    print("Current package: @ideanick/" .. pkg)
  else
    print("Not in a package directory")
  end
end, { desc = "Show current package" })

vim.api.nvim_create_user_command("PnpmInstall", function()
  vim.system("pnpm install", { text = true }, function(obj)
    if obj.code ~= 0 then
      vim.notify("Install failed: " .. (obj.stderr or ""), vim.log.levels.ERROR)
    else
      vim.notify(obj.stdout or "Install completed", vim.log.levels.INFO)
    end
  end)
end, { desc = "PNPM Install" })

vim.api.nvim_create_user_command("PnpmUpdate", function()
  vim.system("pnpm update", { text = true }, function(obj)
    if obj.code ~= 0 then
      vim.notify("Update failed: " .. (obj.stderr or ""), vim.log.levels.ERROR)
    else
      vim.notify(obj.stdout or "Update completed", vim.log.levels.INFO)
    end
  end)
end, { desc = "PNPM Update" })

vim.api.nvim_create_user_command("PnpmBuild", function()
  run_pnpm_filter("build")
end, { desc = "Build current package" })

vim.api.nvim_create_user_command("PnpmDev", function()
  run_pnpm_filter("dev")
end, { desc = "Dev current package" })

vim.api.nvim_create_user_command("PnpmTest", function()
  run_pnpm_filter("test")
end, { desc = "Test current package" })

vim.api.nvim_create_user_command("PnpmLint", function()
  run_pnpm_filter("lint")
end, { desc = "Lint current package" })

-- Webapp shortcuts
vim.api.nvim_create_user_command("WebappDev", function()
  vim.system("cd webapp && pnpm dev", { text = true }, function(obj)
    if obj.code ~= 0 then
      vim.notify("Webapp dev failed: " .. (obj.stderr or ""), vim.log.levels.ERROR)
    else
      vim.notify(obj.stdout or "Webapp dev started", vim.log.levels.INFO)
    end
  end)
end, { desc = "Webapp Dev" })

vim.api.nvim_create_user_command("WebappBuild", function()
  vim.system("cd webapp && pnpm build", { text = true }, function(obj)
    if obj.code ~= 0 then
      vim.notify("Webapp build failed: " .. (obj.stderr or ""), vim.log.levels.ERROR)
    else
      vim.notify(obj.stdout or "Webapp build completed", vim.log.levels.INFO)
    end
  end)
end, { desc = "Webapp Build" })

vim.api.nvim_create_user_command("WebappLint", function()
  vim.system("cd webapp && pnpm lint", { text = true }, function(obj)
    if obj.code ~= 0 then
      vim.notify("Webapp lint failed: " .. (obj.stderr or ""), vim.log.levels.ERROR)
    else
      vim.notify(obj.stdout or "Webapp lint completed", vim.log.levels.INFO)
    end
  end)
end, { desc = "Webapp Lint" })

-- Backend shortcuts
vim.api.nvim_create_user_command("BackendDev", function()
  vim.system("cd backend && pnpm dev", { text = true }, function(obj)
    if obj.code ~= 0 then
      vim.notify("Backend dev failed: " .. (obj.stderr or ""), vim.log.levels.ERROR)
    else
      vim.notify(obj.stdout or "Backend dev started", vim.log.levels.INFO)
    end
  end)
end, { desc = "Backend Dev" })

vim.api.nvim_create_user_command("BackendBuild", function()
  vim.system("cd backend && pnpm build", { text = true }, function(obj)
    if obj.code ~= 0 then
      vim.notify("Backend build failed: " .. (obj.stderr or ""), vim.log.levels.ERROR)
    else
      vim.notify(obj.stdout or "Backend build completed", vim.log.levels.INFO)
    end
  end)
end, { desc = "Backend Build" })

-- TypeScript check
vim.api.nvim_create_user_command("TsCheck", function()
  vim.system("pnpm -r run typecheck", { text = true }, function(obj)
    if obj.code ~= 0 then
      vim.notify("TypeScript check failed: " .. (obj.stderr or ""), vim.log.levels.ERROR)
    else
      vim.notify(obj.stdout or "TypeScript check completed", vim.log.levels.INFO)
    end
  end)
end, { desc = "TypeScript Check All" })

-- Регистрация горячих клавиш в keymaps.lua
vim.g.pnpm_keymaps_registered = true
