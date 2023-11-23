# Проект для тестирования функционала DBT в базе Postgres

## Описание моделей

- airports (ручные скрипты)
- dbtvault (использование пакета automate_dv для создания DataVault)

## Команды DBT :bulb:

- dbt run | (запуск всех моделей в проекте)
- dbt run --select airports | (запуск определенной модели)
- dbt run --select dbtvault.vault.hubs.hub_flights | (запуск определенного скрипта)
- dbt run --select airports --full-refresh | (полное пересоздание объектов в определенной модели)

- dbt test | (запуск всех тестов в проекте)
- dbt test --select airports | (запуск всех тестов определенной модели)
- dbt test --tests flight_negative_profit_test | (запуск определенного теста)

- dbt snapshot | (запуск всех snapshots в проекте)
- dbt seed | (запуск всех seeds в проекте)

- dbt source freshness --select source:demodb.tickets | (проверка свежести записей источника данных)

- dbt build | (запуск всех моделей, тестов, snapshots и seeds в проекте)
- dbt debug | (проверка подключения к базе и настроек проекта)
- dbt compile | (компилирует код SQL скриптов моделей, тестов и analysis в папку target)

- dbt docs generate | (генерирование метаданных для документации)
- dbt docs serve | (запуск веб-сервера с документацией)

Ссылка на сгенерированную документацию - http://localhost:8080/#!/overview

[Подробная документация по командам DBT](https://docs.getdbt.com/reference/commands/run)

## Полезное при установке DBT

Добавляем путь к python.exe в PATH и создаем витруальное окружение командой:  
python -m venv dbt_venv
---
Активируем виртуальное окружение python:
..\dbt_venv\Scripts\Activate.ps1

Если ошибка при активации, то делаем следующее:
- Открываем терминал PowerShell от админа.
- Вставляем и запускаем - Set-ExecutionPolicy RemoteSigned
- На вопрос отвечаем - A
