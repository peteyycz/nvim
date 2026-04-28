local ok, jdtls = pcall(require, "jdtls")
if not ok then
  return
end

local root_dir = vim.fs.root(0, { ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" })
if not root_dir then
  return
end

local project_name = vim.fn.fnamemodify(root_dir, ":p:h:t")
local workspace_dir = vim.fn.stdpath("cache") .. "/jdtls-workspace/" .. project_name
local lombok_jar = vim.fn.stdpath("data") .. "/mason/packages/jdtls/lombok.jar"

local LspUtil = require("util.lsp")

jdtls.start_or_attach({
  cmd = {
    "jdtls",
    "--jvm-arg=-javaagent:" .. lombok_jar,
    "-data", workspace_dir,
  },
  root_dir = root_dir,
  on_attach = LspUtil.generic_on_attach,
  settings = {
    java = {
      configuration = {
        runtimes = {
          {
            name = "JavaSE-21",
            path = vim.env.JAVA_HOME or "/run/current-system/sw/lib/openjdk",
            default = true,
          },
        },
      },
    },
  },
})
