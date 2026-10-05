-- Stub for Defold Editor (autocomplete + diagnostics).
-- Runtime module is provided by native extension via luaL_register(MODULE_NAME, Module_methods).
-- Do not require this file.

---@class rustorecore
local M = {}

--- Подписаться на канал и получать сообщения из native-части.
--- Callback будет вызван как: callback(self, channel, value) или callback(self, channel, value0, value1)
--- (в зависимости от того, что пришло в очереди).
--- @param channel string
--- @param callback function(self:any, channel:string, value:string)|function(self:any, channel:string, value0:string, value1:string)
function M.connect(channel, callback) end

--- Android log: VERBOSE
--- @param tag string
--- @param msg string|number
function M.log_verbose(tag, msg) end

--- Android log: DEBUG
--- @param tag string
--- @param msg string|number
function M.log_debug(tag, msg) end

--- Android log: INFO
--- @param tag string
--- @param msg string|number
function M.log_info(tag, msg) end

--- Android log: WARNING
--- @param tag string
--- @param msg string|number
function M.log_warning(tag, msg) end

--- Android log: ERROR
--- @param tag string
--- @param msg string|number
function M.log_error(tag, msg) end

--- Показать toast.
--- @param msg string|number
function M.show_toast(msg) end

--- Скопировать текст в буфер обмена.
--- @param text string|number
function M.copy_to_clipboard(text) end

--- Получить текст из буфера обмена.
-- @return string text
function M.get_from_clipboard() end

--- Получить строковый ресурс Android по имени.
--- @param name string
-- @return string value
function M.get_string_resources(name) end

--- Получить строку из SharedPreferences.
--- @param storage_name string
--- @param key string
--- @param default_value string
-- @return string value
function M.get_string_shared_preferences(storage_name, key, default_value) end

--- Записать строку в SharedPreferences.
--- @param storage_name string
--- @param key string
--- @param value string
function M.set_string_shared_preferences(storage_name, key, value) end

--- Получить int из SharedPreferences.
--- @param storage_name string
--- @param key string
--- @param default_value number 
-- @return number value
function M.get_int_shared_preferences(storage_name, key, default_value) end

--- Записать int в SharedPreferences.
--- @param storage_name string
--- @param key string
--- @param value number 
function M.set_int_shared_preferences(storage_name, key, value) end

--- Проверить, установлено ли приложение rustore.
-- @return boolean installed
function M.is_rustore_installed() end

--- Открыть инструкцию по установке/скачиванию rustore.
function M.open_rustore_download_instruction() end

--- Открыть rustore.
function M.open_rustore() end

--- Открыть экран авторизации rustore.
function M.open_rustore_authorization() end

---@type rustorecore
rustorecore = rustorecore
