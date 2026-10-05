# defold-rustore-core

Общее ядро Defold-плагинов RuStore — расширение `RuStoreCore`, Lua-модуль `rustorecore`. Через него
модули [pay](https://github.com/maningame/defold-rustore-pay), [review](https://github.com/maningame/defold-rustore-review)
и [appupdate](https://github.com/maningame/defold-rustore-appupdate) отдают события в Lua; без ядра ни один из них
не соберётся. Сам по себе core умеет немного: лог, тост, буфер обмена, SharedPreferences и проверку, установлен
ли RuStore.

| | |
|---|---|
| Версия core | `10.5.0` |
| Источник | `extension_rustore_core` из официальных плагинов RuStore на GitFlic, `master` от 08.09.2026 |
| Платформы | Android; на остальных — пустой модуль, чтобы проект собирался в редакторе |

## Подключение

Строкой в `[project] dependencies` Android-цели — в `platforms/<цель>/platform.settings`:

```ini
dependencies#N = https://github.com/maningame/defold-rustore-core/archive/refs/tags/10.5.0-1.zip
```

- Defold не тянет зависимости библиотек сам: core прописывают в игре рядом с каждым модулем RuStore.
- Ядро должно быть в проекте ровно в одной копии. Плагины RuStore с GitFlic несут свою копию
  `extension_rustore_core` — при переносе нового модуля её не копировать.
- Maven-репозиторий RuStore (`nexus-external.rustore.ru`) объявлен здесь, в `manifests/android/build.gradle`.

## Lua

```lua
rustorecore.connect("rustore_pay_on_purchase_success", function(self, channel, value)
  -- value — JSON-строка от SDK
end)
```

Остальные функции и аннотации — `extension_rustore_core/lua/rustorecore_stub.lua` (подсказки редактора,
`require` не нужен).

## Отличия от GitFlic

- Падение в `FindLuaCallbacksByChannel` после перезапуска Lua (`sys.reboot`): подписка хранила указатель на
  Lua-строку, которую GC освобождал. Канал теперь копируется в `std::string`, а `FinalizeExtension` очищает
  подписки и очередь сообщений.
- В `build.gradle` объявлен gson: им пользуется jar ядра, раньше gson приходил только из модулей.
- Ядро собирается на всех платформах. У RuStore JNI-код открыт для любой платформы, и проект с ядром не
  собирался в редакторе; теперь он под `DM_PLATFORM_ANDROID`, а вне Android `rustorecore` — пустая таблица:
  вызовы держат за проверкой платформы.

## Обновление с GitFlic

1. Склонировать любой плагин RuStore (`git clone https://gitflic.ru/project/rustore/rustore-defold-pay.git`),
   версия ядра — `core` в его `versions.json`.
2. Сравнить его `*_example/extension_rustore_core` с нашей папкой и перенести изменения RuStore, сохранив
   отличия выше.
3. Коммит `build: rustore core <версия>`, тег — версия core. Наша правка поверх той же версии — тег
   `<версия>-1`, `<версия>-2`.

## Лицензия

MIT, © RuStore — [MIT-LICENSE.txt](MIT-LICENSE.txt).
