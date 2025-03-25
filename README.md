# CoinRadar ₿

[![Swift](https://img.shields.io/badge/Swift-5.9-orange.svg)](https://swift.org)
[![Platform](https://img.shields.io/badge/Platform-iOS16+-blue.svg)](https://developer.apple.com/ios/)

Приложение для отслеживания криптовалют с продвинутой аналитикой и управлением портфелем. Получайте данные в реальном времени, анализируйте тренды и управляйте своими инвестициями.

<details>
<summary>🇬🇧 English Description</summary>

### 

A cryptocurrency tracking app with advanced analytics and portfolio management.  
Track live prices, view 7-day charts, analyze the global market and manage your holdings using a clean and intuitive SwiftUI interface.

#### Features:
- Real-time data from CoinGecko API
- CoreData-based investment portfolio
- 7-day interactive price charts
- Global market analytics
- Light/Dark theme support
- Image caching for better performance
- Haptic feedback for smooth UX
- Coin search and sorting
- Native support for iPad screens
- MVVM architecture, Combine framework

</details>

<p align="center">
  <!-- Замените ссылки на реальные скриншоты/гифки -->
  <img src="https://i.imgur.com/dH88RfI.png" width=30%>
  <img src="https://i.imgur.com/6jQpJ0y.png" width=30%>
  <img src="https://i.imgur.com/LKapwMq.png" width=30%>
</p>



## 🌟 Особенности

- Реальные цены криптовалют через CoinGecko API
- Портфель инвестиций с CoreData
- Интерактивные графики за 7 дней
- Детальная аналитика рынка
- Темная/светлая темы
- Локальное кеширование изображений
- Хэптик-обратная связь
- Поиск и сортировка монет
- Глобальная рыночная статистика

## 🛠 Технологии

- **Архитектура**: MVVM
- **Сетевой слой**: Combine + URLSession
- **Кеширование**: LocalFileManager + CoreData
- **Аналитика**: Собственная реализация Swift Charts
- **Анимации**: Кастомные переходы и взаимодействия
- **Зависимости**: Полная нативная реализация

## Дополнительно

- **iPad Support**  
  Приложение адаптировано под разные размеры экранов, включая iPad. Благодаря SwiftUI интерфейс масштабируется автоматически, а при необходимости можно задать отдельные настройки для iPad.

- **Централизованная цветовая схема**  
  В проекте используются структуры `ColorTheme` и `LaunchTheme`, позволяющие удобно управлять цветами приложения. Если вы хотите сменить палитру (фон, акценты, текст и т.д.), достаточно внести изменения в одном месте — они будут применены во всем проекте.




