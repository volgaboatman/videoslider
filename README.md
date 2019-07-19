# Videoslider

Тестовое задание: ТЗ1

реализовать ленту видео (видео могут быть локальным или из интернета) с функцией автоплей - при скроле ленты должно автоматически начинаться проигрывание наиболее видимого видео

добавить возможность отключить/включить звук - если звук включен на одном видео, то он должен воспроизодится на следующем, если нет то наоборот(аналогично instagram)

для архитектуры должен использоваться built_redux

## Текущее состояние

В данной реализации state получился простой (без вложенных объектов) из-за того, что VideoController хитрый объект, которому надо вызывать dispose. Для обертки используется ChewieController (с ним меньше кода для инициализации). Для того, чтобы управлять текущим состоянием контроллера - он подписывается на изменения в store (т.е. не получается красиво его прикрепить к store).

В демо варианте 3 видео: из assets, из интернета, из интернета не существующее (для проверки на ошибки)

Что не нравится и надо исправить

- логика по хорошему доложна быть в store, надо исследовать можно ли в store запихнуть VideoController (как правильно ему вызывать dispose и т.д.) и будет ли он работать в тестах. Возможно придется какую-нибудь прокладку городить. Возможно надо сделать из video_slider StatefulWidget и перенести подписку туда.

- Откуда грузить видео

- В middleware имитируется загрузка списка через Timer, по хорошему должен быть сервис какой-нибудь

- Если у ChewieController.showControls = false - перестают показываться ошибки, хотя по идее должны. Возможно надо все переделать и более корректно обрабатывать ошибки

## Кодогенерация

Чтобы не забыть, при изменении в store надо запускать: flutter pub run build_runner build
